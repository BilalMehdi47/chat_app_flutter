import 'package:project/core/error/response_failure.dart';

import '../../data/models/user_model.dart';
import '../../domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<ResponseFailure, UserModel>> signUpUser(UserEntity user);
  Future<Either<ResponseFailure, UserModel>> signInUser(UserEntity user);
  Future<Either<ResponseFailure, String>> signOutUser();
}


