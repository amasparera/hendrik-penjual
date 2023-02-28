import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:penjual/const/local_data.dart';
import 'package:penjual/data/repository/menu_repository.dart';
import 'package:penjual/domian/model/menu_category.dart';
import 'package:penjual/domian/model/menu.dart';

import '../../const/api_app.dart';

class MenuImpl implements MenuRepository {
  final Client _http = Client();
  final LocalData _localData = LocalData();

  @override
  Future<Either<String, String>> createMenu(String name, String category,
      String price, String desc, File photo) async {
    try {
      final token = await _localData.loadToken();
      final id = await _localData.loadId();
      final api = Uri.parse(ApiApp.createMenu + (token ?? ''));

      final req = MultipartRequest('POST', api);

      req.headers.addAll({"Authorization": ApiApp.basicAuth});
      req.fields.addAll({
        "canteen": id ?? '',
        "name": name,
        "category": category,
        "price": price,
        "description": desc,
      });
      req.files.add(await MultipartFile.fromPath("photo", photo.path));

      final respone = await req.send();
      final responed = await Response.fromStream(respone);
      final json = jsonDecode(responed.body);

      if (responed.statusCode == 200 || responed.statusCode == 201) {
        return Right(json["msg"]);
      } else if (json["data"][0]["msg"] != null) {
        return Left(json["data"][0]["msg"]);
      } else if (json["msg"] != null) {
        return Left(json["msg"]);
      } else {
        return const Left("Server Error");
      }
    } on SocketException catch (_) {
      return const Left("Internet error");
    } catch (e) {
      return const Left("Aplikasi error");
    }
  }

  @override
  Future<Either<String, String>> deleteMenu(String id) {
    // TODO: implement deleteMenu
    throw UnimplementedError();
  }

  @override
  Future<Either<String, Menu>> editMenu(Menu menu) {
    // TODO: implement editMenu
    throw UnimplementedError();
  }

  @override
  Future<Either<String, Menu>> getMenu() {
    // TODO: implement getMenu
    throw UnimplementedError();
  }

  @override
  Future<Either<String, MenuCategory>> getMenuCategory() {
    // TODO: implement getMenuCategory
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> stockMenu(String id, String stock) {
    // TODO: implement stockMenu
    throw UnimplementedError();
  }
}
