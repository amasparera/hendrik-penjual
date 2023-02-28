import 'dart:convert';

class ApiApp {
//
  static String baseUrl = "https://ekantin.amazeglam.id/api";
  static String basicAuth =
      'Basic ${base64.encode(utf8.encode('e-kantin:e-kantin2023'))}';

// login
  static String login = "$baseUrl/canteen/login/auth";
  static String lupaPassword = "$baseUrl/canteen/login/reset_password";
  // static String verifikasi = "$baseUrl/canteen/login/code_verification";
  static String updatePassword =
      "$baseUrl/canteen/login/update_password?token_user=";
  // static String regiter = "$baseUrl/canteen/login/register";

// profile
  // static String updateProfile = "$baseUrl/customer/update?token_user=";
  // static String getFavorite =
  //     "$baseUrl/customer/menu/favorite_menu?token_user=";
  // static String addFavorite = "$baseUrl/customer/menu/set_favorite?token_user=";

  static String myCanteen = "$baseUrl/canteen/my_canteen?token_user=";
  static String openClose = "$baseUrl/canteen/open_canteen?token_user=";

  // menu
  static String createMenu = '$baseUrl/canteen/menu/create?token_user=';
  static String menuCategory =
      '$baseUrl/canteen/menu/category_menu?token_user=';
  static String listMenu = '$baseUrl/canteen/menu/list_menu?token_user=';
  static String editMenu = '$baseUrl/canteen/menu/update?token_user=';
  static String stockMenu = '$baseUrl/canteen/menu/update?token_user=';
  static String deleteMenu = '$baseUrl/canteen/menu/update?token_user=';

  // order
  static String listOrder = "$baseUrl/canteen/order/list_order?token_user=";
  static String setConfirm = "$baseUrl/canteen/order/confirm?token_user=";
  static String setPickup = "$baseUrl/canteen/order/pickup?token_user=";
  static String history = "$baseUrl/canteen/order/history?token_user=";

  // report
  static String orderRacap = "$baseUrl/canteen/report/order_recap?token_user=";
}
