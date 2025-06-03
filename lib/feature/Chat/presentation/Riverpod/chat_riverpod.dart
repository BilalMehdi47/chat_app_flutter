import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/feature/Chat/data/data_source/remote/remote_data_source.dart';
import 'package:project/feature/Chat/data/data_source/remote/remote_data_source_impl.dart';
import 'package:project/feature/Chat/data/repository/repository_impl.dart';
import 'package:project/feature/Chat/domain/repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

import '../../domain/usecase/fetch_user_chats_use_case.dart';

part 'chat_riverpod.g.dart';

/// 1. Expose ChatRemoteDataSource
@riverpod
ChatRemoteDataSource chatRemoteDataSource(Ref ref) {
  return ChatRemoteDataSourceImpl(client: http.Client());
}

/// 2. Expose ChatRepository
@riverpod
ChatRepository chatRepository(Ref ref) {
  return ChatRepositoryImpl(
    remoteDataSource: ref.read(chatRemoteDataSourceProvider),
  );
}

/// 3. Expose FetchUserChatsUseCase
@riverpod
FetchUserChatsUseCase fetchUserChatsUseCase(Ref ref) {
  return FetchUserChatsUseCase(repository: ref.read(chatRepositoryProvider));
}
