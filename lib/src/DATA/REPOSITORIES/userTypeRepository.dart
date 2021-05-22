import 'package:campus_pro/src/DATA/API_SERVICES/userTypeApi.dart';
import 'package:campus_pro/src/DATA/MODELS/userTypeModel.dart';

abstract class UserTypeRepositoryAbs {
  Future<List<UserTypeModel>> getUserType(Map<String, String> userTypeData);
}

class UserTypeRepository extends UserTypeRepositoryAbs {
  final UserTypeApi _api;
  UserTypeRepository(this._api);

  @override
  Future<List<UserTypeModel>> getUserType(
      Map<String, String> userTypeData) async {
    final data = await _api.getUserType(userTypeData);
    return data;
  }
}
