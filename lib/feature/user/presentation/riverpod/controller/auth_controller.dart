import 'package:project/feature/user/data/data_sources/local/user_shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../app/costants/state_variables.dart';
import '../../../data/models/user_model.dart';
import '../../../domain/entities/user_entity.dart';
import '../auth_riverpod.dart';

part 'auth_controller.g.dart';

/// Holds current auth state: loading, data, or error
@riverpod
class AuthController extends _$AuthController {
  AsyncValue<UserModel?> build() => const AsyncData(null);

  /// Sign in
  Future<void> signIn(UserEntity user) async {
    state = const AsyncLoading();
    final result = await ref.read(signInUserUseCaseProvider)(user);
    state = result.fold(
      (f) => AsyncError(f, StackTrace.current),
      (u) => AsyncData(u),
    );
  }

  /// Sign up
  Future<void> signUp(UserEntity user) async {
    state = const AsyncLoading();
    final result = await ref.read(signUpUserUseCaseProvider)(user);
    state = result.fold(
      (f) => AsyncError(f, StackTrace.current),
      (u) => AsyncData(u),
    );
  }

  /// Sign out: clear token & reset form fields
  Future<void> signOut() async {
    state = const AsyncLoading();
    final result = await ref.read(signOutUserUseCaseProvider)();

    await result.fold(
      (failure) async {
        state = AsyncError(failure, StackTrace.current);
      },
      (successMsg) async {
        await UserSharedPref.removeAccessToken();

        // reset providers
        ref.read(nameProvider.notifier).state = '';
        ref.read(emailProvider.notifier).state = '';
        ref.read(passwordProvider.notifier).state = '';

        state = const AsyncData(null);
      },
    );
  }
}
