// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messageControllerHash() => r'4a6e03196ad58e7679ff1fd11908b16b8cf40508';

/// Holds state for a single chat’s detail (partner + messages)
///
/// Copied from [MessageController].
@ProviderFor(MessageController)
final messageControllerProvider = AutoDisposeNotifierProvider<MessageController,
    AsyncValue<ChatDetailEntity?>>.internal(
  MessageController.new,
  name: r'messageControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$messageControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MessageController
    = AutoDisposeNotifier<AsyncValue<ChatDetailEntity?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
