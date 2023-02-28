import 'package:dartz/dartz.dart';

import '../../domian/model/recap_menu.dart';

abstract class ReportRepository {
  Future<Either<String, List<RecapMenu>>> getRecap(String year, String moth);
}
