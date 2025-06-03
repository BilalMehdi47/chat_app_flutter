import 'package:dartz/dartz.dart';
import 'package:project/core/error/response_failure.dart';
import 'package:project/feature/Chat/presentation/Riverpod/chat_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/chat_entity.dart';

part 'chat_controller.g.dart';

/// Holds chat state: loading, data, or error
@riverpod
class ChatController extends _$ChatController {
  @override
  AsyncValue<List<ChatEntity>> build() {
    // Start with empty chat list; UI can call loadChats().
    return const AsyncData(<ChatEntity>[]);
  }

  /// Fetch all user chats
  Future<void> loadChats() async {
    state = const AsyncLoading();
    final Either<ResponseFailure, List<ChatEntity>> result =
    await ref.read(fetchUserChatsUseCaseProvider)();

    state = result.fold(
          (failure) => AsyncError(failure, StackTrace.current),
          (chats) => AsyncData(chats),
    );
  }
}
