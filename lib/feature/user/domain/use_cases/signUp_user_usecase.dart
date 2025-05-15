
import 'package:dartz/dartz.dart';
import '../../../../core/error/response_failure.dart';
import '../../data/models/user_model.dart';
import '../entities/user_entity.dart';
import '../repository/user_repository.dart';

class SignUpUserUseCase {
  final UserRepository repository;

  SignUpUserUseCase({required this.repository});

  Future<Either<ResponseFailure, UserModel>> call(UserEntity user) async {
    return repository.signUpUser(user);
  }
}