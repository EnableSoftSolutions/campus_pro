part of 'get_user_token_cubit.dart';

abstract class GetUserTokenState extends Equatable {
  const GetUserTokenState();
}

class GetUserTokenInitial extends GetUserTokenState {
  @override
  List<Object> get props => [];
}

class GetUserTokenLoadInProgress extends GetUserTokenState {
  @override
  List<Object> get props => [];
}

class GetUserTokenLoadSuccess extends GetUserTokenState {
  final String userToken;

  GetUserTokenLoadSuccess(this.userToken);
  @override
  List<Object> get props => [userToken];
}

class GetUserTokenLoadFail extends GetUserTokenState {
  final String failReason;

  GetUserTokenLoadFail(this.failReason);
  @override
  List<Object> get props => [failReason];
}
