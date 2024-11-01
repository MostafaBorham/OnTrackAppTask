import 'package:on_track_app/core/constants/app_constants.dart';

extension StringExt on String {
  String generateGuestUserNameById() {
    final trimId = trim();
    final idLength = trimId.length ~/ 2;
    final newId = trimId.substring(idLength);
    return "${AppConstants.anonymousName} $newId";
  }
}
