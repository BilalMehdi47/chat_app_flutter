import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/core/error/response_failure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/chat_detail_entity.dart';
import 'message_riverpod.dart';

part 'message_controller.g.dart';

/// Holds state for a single chat’s detail (partner + messages)
@riverpod
class MessageController extends _$MessageController {
  @override
  AsyncValue<ChatDetailEntity?> build() {
    // Start with null: no chat loaded yet.
    return const AsyncData(null);
  }

  /// Load full chat detail for [chatGroupId], with [limit] & [cursor]
  Future<void> loadChatDetail({
    required String chatGroupId,
    required String limit,
    required String cursor,
  }) async {
    state = const AsyncLoading();

    final Either<ResponseFailure, ChatDetailEntity> result = await ref.read(fetchChatDetailUseCaseProvider)(
      chatGroupId: chatGroupId,
      limit: limit,
      cursor: cursor,
    );

    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (chatDetailEntity) => AsyncData(chatDetailEntity),
    );
  }
}
