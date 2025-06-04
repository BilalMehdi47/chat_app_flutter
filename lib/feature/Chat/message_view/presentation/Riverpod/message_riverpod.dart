import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/feature/Chat/message_view/data/data_source/message_remote_data_source.dart';
import 'package:project/feature/Chat/message_view/data/data_source/message_remote_data_source_impl.dart';
import 'package:project/feature/Chat/message_view/domain/usecases/fetch_chat_detail_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

import '../../data/repository/message_repository_impl.dart';
import '../../domain/repository/message_repository.dart';

part 'message_riverpod.g.dart';

/// 1. Expose MessageRemoteDataSource
@riverpod
MessageRemoteDataSource messageRemoteDataSource(Ref ref) {
  return MessageRemoteDataSourceImpl(client: http.Client());
}

/// 2. Expose MessageRepository
@riverpod
MessageRepository messageRepository(Ref ref) {
  return MessageRepositoryImpl(
    remoteDataSource: ref.read(messageRemoteDataSourceProvider),
  );
}

/// 3. Expose FetchChatDetailUseCase
@riverpod
FetchChatDetailUseCase fetchChatDetailUseCase(Ref ref) {
  return FetchChatDetailUseCase(
    repository: ref.read(messageRepositoryProvider),
  );
}
