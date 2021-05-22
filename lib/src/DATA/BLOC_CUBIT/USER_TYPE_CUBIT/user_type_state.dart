part of 'user_type_cubit.dart';

abstract class UserTypeState extends Equatable {
  const UserTypeState();
}

class UserTypeInitial extends UserTypeState {
  @override
  List<Object> get props => [];
}

class UserTypeInProgress extends UserTypeState {
  @override
  List<Object> get props => [];
}

class UserTypeLoadSuccess extends UserTypeState {
  final List<UserTypeModel> userTypeList;

  UserTypeLoadSuccess(this.userTypeList);
  @override
  List<Object> get props => [userTypeList];
}

class UserTypeLoadFail extends UserTypeState {
  final String failReason;
  UserTypeLoadFail(this.failReason);
  @override
  List<Object> get props => [failReason];
}
