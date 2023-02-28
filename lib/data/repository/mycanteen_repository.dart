import 'package:dartz/dartz.dart';
import 'package:penjual/domian/model/my_canteen.dart';
import 'package:penjual/domian/model/work_status.dart';

abstract class MyCanteenRepository {
  Future<Either<String, MyCanteen>> getMycanteen();
  Future<Either<String, WorkStatus>> openCantin(bool open);
}
