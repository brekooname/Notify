import 'package:dartz/dartz.dart';
import 'package:notify/core/network/error/failures.dart';
import 'package:notify/core/utils/usecases/usecase.dart';
import 'package:notify/features/auth/domin/entities/user_model.dart';
import 'package:notify/features/auth/domin/repository/auth_repository.dart';

class Signup extends UseCase<UserModel, SignUpParams> {
  final AuthRepository repository;

  Signup(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(SignUpParams params) async {
    final result = await repository.signup(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}

class SignUpParams {
 final  String email;
 final String password;
 final String firstName;
  final String lastName;
  final String userName;
  const SignUpParams({required this.firstName,required this.lastName,required this.userName, required this.email,required this.password});
}
