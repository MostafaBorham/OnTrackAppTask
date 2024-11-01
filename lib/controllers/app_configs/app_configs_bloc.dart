import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:on_track_app/core/connection/connection_checker.dart';
import 'package:on_track_app/core/services/local/cache_helper.dart';
import '../../core/localization/localization_constants.dart';

part 'app_configs_event.dart';
part 'app_configs_state.dart';

class AppConfigsBloc extends Bloc<AppConfigsEvent, AppConfigsState> {
  static late ThemeMode appMode;
  static InternetConnectionStatus currentConnectionStatue =
      InternetConnectionStatus.connected;

  static AppConfigsBloc get(BuildContext context) =>
      BlocProvider.of<AppConfigsBloc>(context);

  AppConfigsBloc() : super(AppConfigsInitial()) {
    on<ChangeAppLocaleEvent>(_changeAppLocale);
    on<LightModeEvent>(_setLightMode);
    on<DarkModeEvent>(_setDarkMode);
    on<ChangeConnectionStatueEvent>(_changeConnectionStatue);
  }

  void listenToInternet() {
    ConnectionChecker.listenToConnection().listen(
      (statue) {
        add(ChangeConnectionStatueEvent(statue: statue));
      },
    );
  }

  Future<FutureOr<void>> _changeAppLocale(
      ChangeAppLocaleEvent event, Emitter<AppConfigsState> emit) async {
    if (event.context.locale == LocalizationConstants.englishLocale) {
      await event.context.setLocale(LocalizationConstants.arabicLocale);
      emit(ArabicLocaleState());
    } else if (event.context.locale == LocalizationConstants.arabicLocale) {
      await event.context.setLocale(LocalizationConstants.englishLocale);
      emit(EnglishLocaleState());
    }
  }

  Future<FutureOr<void>> _setLightMode(
      LightModeEvent event, Emitter<AppConfigsState> emit) async {
    appMode = ThemeMode.light;
    await CacheHelper.saveAppMode(mode: appMode).then((value) {
      emit(LightModeState());
    });
  }

  Future<FutureOr<void>> _setDarkMode(
      DarkModeEvent event, Emitter<AppConfigsState> emit) async {
    appMode = ThemeMode.dark;
    await CacheHelper.saveAppMode(mode: appMode);
    emit(DarkModeState());
  }

  FutureOr<void> _changeConnectionStatue(
      ChangeConnectionStatueEvent event, Emitter<AppConfigsState> emit) {
    currentConnectionStatue = event.statue;
    switch (event.statue) {
      case InternetConnectionStatus.connected:
        emit(OnlineStatueState());
      case InternetConnectionStatus.disconnected:
        emit(OfflineStatueState());
    }
  }
}
