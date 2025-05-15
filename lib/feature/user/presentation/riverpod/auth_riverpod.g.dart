// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRemoteDataSourceHash() =>
    r'9d783025383505d93ef0d69a1eaff48b9d67bfdb';

/// 1. Expose your remote data source
///
/// Copied from [userRemoteDataSource].
@ProviderFor(userRemoteDataSource)
final userRemoteDataSourceProvider =
    AutoDisposeProvider<UserRemoteDataSource>.internal(
  userRemoteDataSource,
  name: r'userRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserRemoteDataSourceRef = AutoDisposeProviderRef<UserRemoteDataSource>;
String _$userRepositoryHash() => r'52314ff3e3bd526dbf0b9859099bbc5f9ea7cdf8';

/// 2. Expose your repository implementation
///
/// Copied from [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = AutoDisposeProvider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserRepositoryRef = AutoDisposeProviderRef<UserRepository>;
String _$signInUserUseCaseHash() => r'06a5bac772a16617299d1a6e064262ae3c650197';

/// 3. Expose each use-case
///
/// Copied from [signInUserUseCase].
@ProviderFor(signInUserUseCase)
final signInUserUseCaseProvider =
    AutoDisposeProvider<SignInUserUseCase>.internal(
  signInUserUseCase,
  name: r'signInUserUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInUserUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SignInUserUseCaseRef = AutoDisposeProviderRef<SignInUserUseCase>;
String _$signUpUserUseCaseHash() => r'28f144b03d55d17418da22a58d53ce780edee87b';

/// Exposes Sign-Up use-case
///
/// Copied from [signUpUserUseCase].
@ProviderFor(signUpUserUseCase)
final signUpUserUseCaseProvider =
    AutoDisposeProvider<SignUpUserUseCase>.internal(
  signUpUserUseCase,
  name: r'signUpUserUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signUpUserUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SignUpUserUseCaseRef = AutoDisposeProviderRef<SignUpUserUseCase>;
String _$signOutUserUseCaseHash() =>
    r'fc3189a6b6c9eec557ba108efadb50d1367e3d22';

/// Exposes Sign-Out use-case
///
/// Copied from [signOutUserUseCase].
@ProviderFor(signOutUserUseCase)
final signOutUserUseCaseProvider =
    AutoDisposeProvider<SignOutUserUseCase>.internal(
  signOutUserUseCase,
  name: r'signOutUserUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signOutUserUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SignOutUserUseCaseRef = AutoDisposeProviderRef<SignOutUserUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
