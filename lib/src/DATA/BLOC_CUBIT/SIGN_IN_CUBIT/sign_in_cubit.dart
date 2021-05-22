import 'package:bloc/bloc.dart';
import 'package:campus_pro/src/CONSTANTS/stringConstants.dart';
import 'package:campus_pro/src/DATA/MODELS/signInModel.dart';
import 'package:campus_pro/src/DATA/REPOSITORIES/signInRepository.dart';
import 'package:equatable/equatable.dart';

import '../../../UTILS/internetCheck.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  //Dependency
  final SignInRepository _repository;

  SignInCubit(this._repository) : super(SignInInitial());

  Future<void> signInCubitCall(Map<String, String> credentials) async {
    if (await isInternetPresent()) {
      try {
        emit(SignInLoadInProgress());
        final data = await _repository.checkUserData(credentials);
        emit(SignInLoadSuccess(data));
      } catch (e) {
        emit(SignInLoadFail("$e"));
      }
    } else {
      emit(SignInLoadFail(NO_INTERNET));
    }
  }
}
