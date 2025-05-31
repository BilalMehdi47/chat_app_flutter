import 'package:dartz/dartz.dart';
import 'package:project/app/costants/state_variables.dart';
import 'package:project/core/error/response_failure.dart';
import 'package:project/feature/user/data/data_sources/local/user_shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/user_model.dart';
import '../../../domain/entities/user_entity.dart';
import '../auth_riverpod.dart';

part 'auth_controller.g.dart';

/// Holds current auth state: loading, data, or error
/// 
@riverpod
class AuthController extends _$AuthController {
  @override
  AsyncValue<UserModel?> build() {
    _loadToken();
    return const AsyncData(null);
  }

  Future<void> _loadToken() async {
    state = const AsyncLoading();
    final token = await UserSharedPref.getAccessToken();
    if (token != null && token.isNotEmpty) {
      AppConstant.accessToken = token;
      state = AsyncData(UserModel(token: token));
    } else {
      state = const AsyncData(null);
    }
  }

  /// Sign in
  Future<void> signIn(UserEntity user) async {
    state = const AsyncLoading();
    final result = await ref.read(signInUserUseCaseProvider)(user);
    state = result.fold(
      (f) => AsyncError(f, StackTrace.current),
      (u) {
        UserSharedPref.setAccessToken(uid: u.token);
        AppConstant.accessToken = u.token;
        return AsyncData(u);
      },
    );
  }

  /// Sign up
  Future<void> signUp(UserEntity user) async {
    state = const AsyncLoading();
    final result = await ref.read(signUpUserUseCaseProvider)(user);
    state = result.fold(
      (f) => AsyncError(f, StackTrace.current),
      (u) {
        UserSharedPref.setAccessToken(uid: u.token);
        AppConstant.accessToken = u.token;
        return AsyncData(u);
      },
    );
  }

  /// Sign out: clear token & reset form fields
  Future<Either<ResponseFailure, String>> signOut() async {
    try {
      state = const AsyncLoading();
      final result = await ref.read(signOutUserUseCaseProvider)();

      return result.fold(
        (failure) {
          state = AsyncError(failure, StackTrace.current);
          return Left(failure);
        },
        (successMsg) async {
          await UserSharedPref.removeAccessToken();
          AppConstant.accessToken = "";
          // Reset providers
          ref.read(nameProvider.notifier).state = '';
          ref.read(emailProvider.notifier).state = '';
          ref.read(passwordProvider.notifier).state = '';

          state = const AsyncData(null);
          return Right(successMsg);
        },
      );
    } catch (e, stackTrace) {
      final failure = ResponseFailure(e.toString());
      state = AsyncError(failure, stackTrace);
      return Left(failure);
    }
  }
}
