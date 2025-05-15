import 'package:dartz/dartz.dart';
import 'package:project/core/error/response_failure.dart';
import 'package:project/feature/user/data/models/user_model.dart';
import 'package:project/feature/user/domain/entities/user_entity.dart';
import 'package:project/feature/user/domain/repository/user_repository.dart';

import '../data_sources/remote/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ResponseFailure, UserModel>> signInUser(UserEntity user) async => remoteDataSource.signInUser(user);

  @override
  Future<Either<ResponseFailure, String>> signOutUser() async => remoteDataSource.signOutUser();

  @override
  Future<Either<ResponseFailure, UserModel>> signUpUser(UserEntity user) async => remoteDataSource.signUpUser(user);
}
