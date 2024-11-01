part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

/// SignUp States
class WaitingSignUpState extends AuthState {}

class FailSignUpState extends AuthState {
  final String failMessage;

  FailSignUpState({required this.failMessage});

  @override
  List<Object?> get props => [
        failMessage,
      ];
}

class SuccessSignUpState extends AuthState {}

/// SignIn States
class WaitingSignInState extends AuthState {}

class FailSignInState extends AuthState {
  final String failMessage;

  FailSignInState({required this.failMessage});

  @override
  List<Object?> get props => [
        failMessage,
      ];
}

class SuccessSignInState extends AuthState {}

/// SignOut States
class WaitingSignOutState extends AuthState {}

class FailSignOutState extends AuthState {
  final String failMessage;

  FailSignOutState({required this.failMessage});

  @override
  List<Object?> get props => [
        failMessage,
      ];
}

class SuccessSignOutState extends AuthState {}

class GetSigninEmailState extends AuthState {
  final String email;

  GetSigninEmailState({
    required this.email,
  });

  @override
  List<Object?> get props => [
        email,
      ];
}

class GetSigninPasswordState extends AuthState {
  final String password;

  GetSigninPasswordState({
    required this.password,
  });

  @override
  List<Object?> get props => [
        password,
      ];
}

class GetSignupNameState extends AuthState {
  final String name;

  GetSignupNameState({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}

class GetSignupEmailState extends AuthState {
  final String email;

  GetSignupEmailState({
    required this.email,
  });

  @override
  List<Object?> get props => [
        email,
      ];
}

class GetSignupPasswordState extends AuthState {
  final String password;

  GetSignupPasswordState({
    required this.password,
  });

  @override
  List<Object?> get props => [
        password,
      ];
}
