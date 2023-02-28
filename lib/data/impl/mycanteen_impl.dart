import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:penjual/const/local_data.dart';
import 'package:penjual/data/repository/mycanteen_repository.dart';
import 'package:penjual/domian/model/my_canteen.dart';
import 'package:penjual/domian/model/work_status.dart';

import '../../const/api_app.dart';

class MyCanteenImpl implements MyCanteenRepository {
  final Client _http = Client();
  final LocalData _localData = LocalData();

  @override
  Future<Either<String, MyCanteen>> getMycanteen() async {
    try {
      final token = await _localData.loadToken();
      final api = Uri.parse(ApiApp.myCanteen + (token ?? ''));
      final res =
          await _http.get(api, headers: {"Authorization": ApiApp.basicAuth});

      final json = jsonDecode(res.body);
      log(json);
      if (res.statusCode == 200) {
        return Right(MyCanteen.fromJson(json['data']));
      } else if (json["msg"] != null) {
        return Left(json['msg']);
      } else {
        return Left(json["data"][0]["msg"]);
      }
    } catch (e) {
      return const Left("Aplikasi error");
    }
  }

  @override
  Future<Either<String, WorkStatus>> openCantin(bool open) async {
    // try {
    final token = await _localData.loadToken();
    final id = await _localData.loadId();
    final api = Uri.parse(ApiApp.openClose + (token ?? ''));

    final res = await _http.post(api,
        body: {"canteen": id, 'open': (open ? '1' : '0')},
        headers: {"Authorization": ApiApp.basicAuth});

    final json = jsonDecode(res.body);
    if (res.statusCode == 201) {
      return Right(WorkStatus.fromJson(json['data']));
    } else if (json["msg"] != null) {
      return Left(json['msg']);
    } else if (json["error"] != null) {
      return Left(json['error']);
    } else {
      return Left(json["data"][0]["msg"]);
    }
    // } catch (e) {
    //   return const Left("Aplikasi error");
    // }
  }
}
