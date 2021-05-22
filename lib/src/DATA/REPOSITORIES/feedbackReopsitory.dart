import 'package:campus_pro/src/DATA/API_SERVICES/feedbackApi.dart';
import 'package:campus_pro/src/DATA/MODELS/feedbackModel.dart';

abstract class FeedBackRespositoryAbs {
  Future<FeedBackModel> feedBackData(Map<String, String> feedBackData);
}

class FeedBackRespository extends FeedBackRespositoryAbs {
  final FeedBackApi _api;
  FeedBackRespository(this._api);

  @override
  Future<FeedBackModel> feedBackData(Map<String, String> feedBackData) async {
    final data = await _api.feedBackData(feedBackData);
    //await UserUtils.cacheLoginData(data);
    return data;
  }
  
}