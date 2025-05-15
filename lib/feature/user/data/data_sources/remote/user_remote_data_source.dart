import 'package:dartz/dartz.dart';

import '../../../../../core/error/response_failure.dart';
import '../../../domain/entities/user_entity.dart';
import '../../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<Either<ResponseFailure, UserModel>> signUpUser(UserEntity user);
  Future<Either<ResponseFailure, UserModel>> signInUser(UserEntity user);
  Future<Either<ResponseFailure, String>> signOutUser();

}