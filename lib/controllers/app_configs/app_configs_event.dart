part of 'app_configs_bloc.dart';

@immutable
abstract class AppConfigsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeAppLocaleEvent extends AppConfigsEvent {
  final BuildContext context;

  ChangeAppLocaleEvent(this.context);

  @override
  List<Object?> get props => [
        context,
      ];
}

class ChangeConnectionStatueEvent extends AppConfigsEvent {
  final InternetConnectionStatus statue;

  ChangeConnectionStatueEvent({required this.statue});

  @override
  List<Object?> get props => [
        statue,
      ];
}

class LightModeEvent extends AppConfigsEvent {}

class DarkModeEvent extends AppConfigsEvent {}

class NotificationPermissionRequestEvent extends AppConfigsEvent {}
