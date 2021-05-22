part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInLoadInProgress extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInLoadSuccess extends SignInState {
  final bool status;

  SignInLoadSuccess(this.status);
  @override
  List<Object> get props => [status];
}

class SignInLoadFail extends SignInState {
  final String failReason;

  SignInLoadFail(this.failReason);
  @override
  List<Object> get props => [failReason];
}
