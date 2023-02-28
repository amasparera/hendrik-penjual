import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../domian/model/menu.dart';
import '../../domian/model/menu_category.dart';

abstract class MenuRepository {
  Future<Either<String, MenuCategory>> getMenuCategory();
  Future<Either<String, Menu>> getMenu();
  Future<Either<String, String>> createMenu(
      String name, String category, String price, String desc, File photo);
  Future<Either<String, Menu>> editMenu(Menu menu);
  Future<Either<String, String>> stockMenu(String id, String stock);
  Future<Either<String, String>> deleteMenu(String id);
}
