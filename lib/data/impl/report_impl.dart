import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:penjual/const/local_data.dart';
import 'package:penjual/data/repository/report_repository.dart';
import 'package:penjual/domian/model/recap_menu.dart';

import '../../const/api_app.dart';

class ReportImpl implements ReportRepository {
  final Client _http = Client();
  final LocalData localData = LocalData();
  @override
  Future<Either<String, List<RecapMenu>>> getRecap(
      String year, String moth) async {
    try {
      final token = await localData.loadToken();
      final api = Uri.parse(
          '${ApiApp.orderRacap}${token ?? ''}&year=$year&month=$moth');
      final res =
          await _http.get(api, headers: {"Authorization": ApiApp.basicAuth});

      final json = jsonDecode(res.body);
      print(json);
      if (res.statusCode == 200) {
        return json['total'] != 0
            ? Right((json['data'] as List<dynamic>)
                .map((e) => RecapMenu.fromJson(e))
                .toList())
            : const Right(<RecapMenu>[]);
      } else if (json["msg"] != null) {
        return Left(json['msg']);
      } else {
        return Left(json["data"][0]["msg"]);
      }
    } on SocketException catch (_) {
      return const Left("Internet error");
    } catch (e) {
      return const Left("Aplikasi error");
    }
  }
}
