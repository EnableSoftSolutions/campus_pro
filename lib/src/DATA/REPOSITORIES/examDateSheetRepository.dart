import 'package:campus_pro/src/DATA/API_SERVICES/examDateSheetApi.dart';
import 'package:campus_pro/src/DATA/MODELS/examDateSheetModel.dart';

abstract class ExamDateSheetRepoAbs{
 Future<List<DateSheetModel>> getDateSheet(
      Map<String, String> getOurSchoolRequest);

}

class ExamDateRepository extends ExamDateSheetRepoAbs{
  
  final ExamDateSheetApi _api;  
 ExamDateRepository(this._api);
  @override
  Future<List<DateSheetModel>> getDateSheet(
      Map<String, String> dateSheetRequest) async {
    final data = await _api.getDateSheet(dateSheetRequest);
    return data;
  }

}