part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpEvent extends AuthEvent {
  final String userName;
  final String userEmail;
  final String userPassword;

  SignUpEvent({
    required this.userName,
    required this.userEmail,
    required this.userPassword,
  });

  @override
  List<Object?> get props => [
        userName,
        userEmail,
        userPassword,
      ];
}

class SignInEvent extends AuthEvent {
  final String userEmail;
  final String userPassword;

  SignInEvent({
    required this.userEmail,
    required this.userPassword,
  });

  @override
  List<Object?> get props => [
        userEmail,
        userPassword,
      ];
}

class SignOutEvent extends AuthEvent {}

class SaveSigninEmailEvent extends AuthEvent {
  final String email;

  SaveSigninEmailEvent({
    required this.email,
  });

  @override
  List<Object?> get props => [
        email,
      ];
}

class SaveSigninPasswordEvent extends AuthEvent {
  final String password;

  SaveSigninPasswordEvent({
    required this.password,
  });

  @override
  List<Object?> get props => [
        password,
      ];
}

class SaveSignupNameEvent extends AuthEvent {
  final String name;

  SaveSignupNameEvent({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}

class SaveSignupEmailEvent extends AuthEvent {
  final String email;

  SaveSignupEmailEvent({
    required this.email,
  });

  @override
  List<Object?> get props => [
        email,
      ];
}

class SaveSignupPasswordEvent extends AuthEvent {
  final String password;

  SaveSignupPasswordEvent({
    required this.password,
  });

  @override
  List<Object?> get props => [
        password,
      ];
}

class GetSigninEmailEvent extends AuthEvent {}

class GetSigninPasswordEvent extends AuthEvent {}

class GetSignupNameEvent extends AuthEvent {}

class GetSignupEmailEvent extends AuthEvent {}

class GetSignupPasswordEvent extends AuthEvent {}
