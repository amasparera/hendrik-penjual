// ignore_for_file: prefer_final_fields, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../const/api_app.dart';
import '../../domian/respone/lupa_password_res.dart';
import '../repository/auth_repository.dart';

class AuthImpl implements AuthRepository {
  Client _http = Client();

  @override
  Future<Either<String, String>> login(String email, String password) async {
    try {
      final api = Uri.parse(ApiApp.login);
      print(1);
      final res = await _http.post(api,
          body: {"email": email, "password": password},
          headers: {"Authorization": ApiApp.basicAuth});

      final json = jsonDecode(res.body);
      print(json);
      if (res.statusCode == 200) {
        return Right(json["data"]["token_user"]);
      } else if (json["msg"] != null) {
        return Left(json['msg']);
      } else {
        return Left(json["data"][0]["msg"]);
      }
    } on SocketException catch (_) {
      return const Left("Internet error");
    } catch (e) {
      print(e.toString());
      return const Left("Aplikasi error");
    }
  }

  // @override
  // Future<Either<String, int>> register(
  //     String nama, String email, String password) async {
  //   print(1);
  //   try {
  //     final api = Uri.parse('');
  //     final res = await _http.post(api, body: {
  //       "email": email,
  //       "password": password,
  //       "name": nama,
  //     }, headers: {
  //       "Authorization": ApiApp.basicAuth
  //     });
  //     print(res.body);
  //     final json = jsonDecode(res.body);
  //     print(json);
  //     if (res.statusCode == 200) {
  //       return const Right(200);
  //     } else if (json["msg"] != null) {
  //       return Left(json['msg']);
  //     } else {
  //       return const Left("server error");
  //     }
  //   } catch (e) {
  //     return const Left("Aplikasi error");
  //   }
  // }

  @override
  Future<Either<String, ResponeLupaPassword>> lupaPassword(String email) async {
    try {
      final api = Uri.parse(ApiApp.lupaPassword);
      final res = await _http.post(api,
          body: {"email": email}, headers: {"Authorization": ApiApp.basicAuth});

      final json = jsonDecode(res.body);
      print(json);
      if (res.statusCode == 200) {
        return Right(ResponeLupaPassword.fromJson(json));
      } else if (json["msg"] != null) {
        return Left(json['msg']);
      } else {
        return const Left("server tidak merespone");
      }
    } catch (e) {
      return const Left("Aplikasi error");
    }
  }

  @override
  Future<Either<String, String>> updatePossword(
      String email, String password, String token) async {
    try {
      final api = Uri.parse("${ApiApp.updatePassword}$token");
      final res = await _http.post(api,
          body: {"email": email, "password": password},
          headers: {"Authorization": ApiApp.basicAuth});

      final json = jsonDecode(res.body);
      print(json);
      if (res.statusCode == 201) {
        return Right(json["msg"]);
      } else if (json["msg"] != null) {
        return Left(json['msg']);
      } else {
        return const Left("server tidak merespone");
      }
    } catch (e) {
      return const Left("Aplikasi error");
    }
  }
}
