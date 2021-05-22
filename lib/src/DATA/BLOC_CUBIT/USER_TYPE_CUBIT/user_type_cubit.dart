import 'package:bloc/bloc.dart';
import 'package:campus_pro/src/DATA/MODELS/userTypeModel.dart';
import 'package:campus_pro/src/DATA/REPOSITORIES/userTypeRepository.dart';
import 'package:campus_pro/src/UTILS/internetCheck.dart';
import 'package:equatable/equatable.dart';
import 'package:campus_pro/src/CONSTANTS/stringConstants.dart';
part 'user_type_state.dart';

class UserTypeCubit extends Cubit<UserTypeState> {
  final UserTypeRepository _repository;

  UserTypeCubit(this._repository) : super(UserTypeInitial());

  Future<void> userTypeCubitCall(Map<String, String> userTypeData) async {
    if (await isInternetPresent()) {
      try {
        emit(UserTypeInProgress());
        final data = await _repository.getUserType(userTypeData);
        print("Cubit Data: $data");
        emit(UserTypeLoadSuccess(data));
      } catch (e) {
        emit(UserTypeLoadFail("$e"));
      }
    } else {
      emit(UserTypeLoadFail(NO_INTERNET));
    }
  }
}
