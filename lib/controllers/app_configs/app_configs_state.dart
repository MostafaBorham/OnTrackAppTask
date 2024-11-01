part of 'app_configs_bloc.dart';

@immutable
abstract class AppConfigsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class AppConfigsInitial extends AppConfigsState {}


class EnglishLocaleState extends AppConfigsState{
}

class ArabicLocaleState extends AppConfigsState{
}

class LightModeState extends AppConfigsState{
}

class DarkModeState extends AppConfigsState{
}

class OnlineStatueState extends AppConfigsState{
}

class OfflineStatueState extends AppConfigsState{
}

class SuccessGetNotificationPermissionState extends AppConfigsState{
  final String successMessage;

  SuccessGetNotificationPermissionState({required this.successMessage});

  @override
  List<Object?> get props => [
    successMessage,
  ];
}
class FailGetNotificationPermissionState extends AppConfigsState{
  final String failMessage;

  FailGetNotificationPermissionState({required this.failMessage});

  @override
  List<Object?> get props => [
    failMessage,
  ];
}