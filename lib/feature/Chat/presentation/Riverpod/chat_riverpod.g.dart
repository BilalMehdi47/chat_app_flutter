// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatRemoteDataSourceHash() =>
    r'60ba22b7113fd0d0cb0388b0868b51da525cf9f7';

/// 1. Expose ChatRemoteDataSource
///
/// Copied from [chatRemoteDataSource].
@ProviderFor(chatRemoteDataSource)
final chatRemoteDataSourceProvider =
    AutoDisposeProvider<ChatRemoteDataSource>.internal(
  chatRemoteDataSource,
  name: r'chatRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chatRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ChatRemoteDataSourceRef = AutoDisposeProviderRef<ChatRemoteDataSource>;
String _$chatRepositoryHash() => r'298383e2919f58ba028220261a36c23186864d82';

/// 2. Expose ChatRepository
///
/// Copied from [chatRepository].
@ProviderFor(chatRepository)
final chatRepositoryProvider = AutoDisposeProvider<ChatRepository>.internal(
  chatRepository,
  name: r'chatRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chatRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ChatRepositoryRef = AutoDisposeProviderRef<ChatRepository>;
String _$fetchUserChatsUseCaseHash() =>
    r'073ab65736e2aac0ad7c63f9f83031dbdcd184ed';

/// 3. Expose FetchUserChatsUseCase
///
/// Copied from [fetchUserChatsUseCase].
@ProviderFor(fetchUserChatsUseCase)
final fetchUserChatsUseCaseProvider =
    AutoDisposeProvider<FetchUserChatsUseCase>.internal(
  fetchUserChatsUseCase,
  name: r'fetchUserChatsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchUserChatsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchUserChatsUseCaseRef
    = AutoDisposeProviderRef<FetchUserChatsUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
