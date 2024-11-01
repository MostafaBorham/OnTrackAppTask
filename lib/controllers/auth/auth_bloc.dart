import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_user;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:on_track_app/domains/entities/user.dart' as user;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_track_app/data/network/repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static AuthBloc get(BuildContext context) =>
      BlocProvider.of<AuthBloc>(context);
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(_signUp);
    on<SignInEvent>(_signIn);
    on<SignOutEvent>(_signOut);
  }

  FutureOr<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(WaitingSignUpState());
    final result = await NetworkRepo.signUpUser(
        userInfo: user.User(
            name: event.userName,
            email: event.userEmail,
            password: event.userPassword));
    await result.fold(
      (failure) {
        emit(FailSignUpState(failMessage: failure.message!));
      },
      (user) async {
        emit(SuccessSignUpState());
      },
    );
  }

  FutureOr<void> _signIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(WaitingSignInState());
    final result = await NetworkRepo.signInUser(
        userInfo: user.User(
      email: event.userEmail,
      password: event.userPassword,
    ));
    await result.fold(
      (failure) {
        emit(FailSignInState(failMessage: failure.message!));
      },
      (user) async {
        emit(SuccessSignInState());
      },
    );
  }

  FutureOr<void> _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(WaitingSignOutState());

    final removeResult = await NetworkRepo.signOutUser();
    await removeResult.fold(
      (failure) {
        emit(FailSignOutState(failMessage: failure.message!));
      },
      (user) async {
        emit(SuccessSignOutState());
      },
    );
  }
}
