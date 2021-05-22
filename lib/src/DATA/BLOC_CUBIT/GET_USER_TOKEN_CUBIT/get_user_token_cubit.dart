import 'package:bloc/bloc.dart';
import 'package:campus_pro/src/CONSTANTS/stringConstants.dart';
import 'package:campus_pro/src/DATA/REPOSITORIES/getUserTokenRepository.dart';
import 'package:campus_pro/src/UTILS/internetCheck.dart';
import 'package:equatable/equatable.dart';

part 'get_user_token_state.dart';

class GetUserTokenCubit extends Cubit<GetUserTokenState> {
  //Dependency
  final GetUserTokenRepository _repository;

  GetUserTokenCubit(this._repository) : super(GetUserTokenInitial());

  Future<void> getUserTokenCubitCall(Map<String, String> tokenData) async {
    if (await isInternetPresent()) {
      try {
        emit(GetUserTokenLoadInProgress());
        final data = await _repository.getUserToken(tokenData);
        emit(GetUserTokenLoadSuccess(data));
      } catch (e) {
        emit(GetUserTokenLoadFail("$e"));
      }
    } else {
      emit(GetUserTokenLoadFail(NO_INTERNET));
    }
  }
}
