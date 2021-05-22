import 'package:campus_pro/src/DATA/API_SERVICES/signInApi.dart';
import 'package:campus_pro/src/DATA/MODELS/signInModel.dart';

import '../userUtils.dart';

abstract class SignInRespositoryAbs {
  Future<bool> checkUserData(Map<String, String> loginData);
}

class SignInRepository extends SignInRespositoryAbs {
  final SignInApi _api;

  SignInRepository(this._api);
  @override
  Future<bool> checkUserData(Map<String, String> loginData) async {
    final data = await _api.checkUserData(loginData);
    // await UserUtils.cacheData(data);
    return data;
  }
}
