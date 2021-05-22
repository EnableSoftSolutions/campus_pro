import 'package:campus_pro/src/DATA/API_SERVICES/getUserTokenApi.dart';
import 'package:campus_pro/src/DATA/userUtils.dart';

abstract class GetUserTokenRespositoryAbs {
  Future<String> getUserToken(Map<String, String> tokenData);
}

class GetUserTokenRepository extends GetUserTokenRespositoryAbs {
  final GetUserTokenApi _api;

  GetUserTokenRepository(this._api);
  @override
  Future<String> getUserToken(Map<String, String> tokenData) async {
    final data = await _api.getUserToken(tokenData);
    await UserUtils.cacheUserToken(data);
    return data;
  }
}
