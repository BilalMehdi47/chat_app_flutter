
import 'package:dartz/dartz.dart';
import '../../../../core/error/response_failure.dart';
import '../repository/user_repository.dart';

class SignOutUserUseCase {
  final UserRepository repository;

  SignOutUserUseCase({required this.repository});

  Future<Either<ResponseFailure, String>> call() async {
    return repository.signOutUser();
  }
}