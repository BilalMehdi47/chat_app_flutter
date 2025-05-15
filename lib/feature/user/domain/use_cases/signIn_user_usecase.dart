
import 'package:dartz/dartz.dart';
import '../../../../core/error/response_failure.dart';
import '../../data/models/user_model.dart';
import '../entities/user_entity.dart';
import '../repository/user_repository.dart';

class SignInUserUseCase {
  final UserRepository repository;

  SignInUserUseCase({required this.repository});

  Future<Either<ResponseFailure, UserModel>> call(UserEntity user) async {
    return repository.signInUser(user);
  }
}