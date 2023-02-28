import 'package:dartz/dartz.dart';

import '../../domian/respone/lupa_password_res.dart';

abstract class AuthRepository {
  // Future<Either<String, int>> register(
  //     String nama, String email, String password);
  Future<Either<String, String>> login(String email, String password);
  Future<Either<String, ResponeLupaPassword>> lupaPassword(String email);
  // Future<Either<String, String>> verifikasiToken(String email, String code);
  Future<Either<String, String>> updatePossword(
      String email, String password, String token);
}
