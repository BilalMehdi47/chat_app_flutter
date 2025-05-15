import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/data_sources/remote/user_remote_data_source.dart';
import '../../data/data_sources/remote/user_remote_data_source_impl.dart';
import '../../data/repository/user_repository_impl.dart';
import '../../domain/repository/user_repository.dart';
import '../../domain/use_cases/signIn_user_usecase.dart';
import '../../domain/use_cases/signOut_user_usecase.dart';
import '../../domain/use_cases/signUp_user_usecase.dart';
import 'package:http/http.dart' as http;

part 'auth_riverpod.g.dart';

/// 1. Expose your remote data source
@riverpod
UserRemoteDataSource userRemoteDataSource(Ref ref) {
  return UserRemoteDataSourceImpl(client: http.Client());}

/// 2. Expose your repository implementation
@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl(
    remoteDataSource: ref.read(userRemoteDataSourceProvider),
  );
}

/// 3. Expose each use-case
@riverpod
SignInUserUseCase signInUserUseCase(Ref ref) {
  return SignInUserUseCase(repository: ref.read(userRepositoryProvider));
}

/// Exposes Sign-Up use-case
@riverpod
SignUpUserUseCase signUpUserUseCase(Ref ref) {
  return SignUpUserUseCase(repository: ref.read(userRepositoryProvider));
}

/// Exposes Sign-Out use-case
@riverpod
SignOutUserUseCase signOutUserUseCase(Ref ref) {
  return SignOutUserUseCase(repository: ref.read(userRepositoryProvider));
}
