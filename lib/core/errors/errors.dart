import 'package:on_track_app/core/localization/strings.dart';

abstract class AppErrors{
  static String offlineErrorMessage= AppStrings.offlineError;
  static String serverErrorMessage= AppStrings.serverError;
  static String cacheErrorMessage= AppStrings.cacheError;
  static String invalidPageNumberMessage= AppStrings.invalidPageNumberError;
  static String timeoutMessage= AppStrings.timeoutError;
  static String noCurrentUserMessage= AppStrings.noCurrentUser;
  static String noDeviceTokenMessage= AppStrings.noDeviceToken;
  static String noUserMessage= AppStrings.noCurrentUser;
  static String userPermanentMessage= AppStrings.noCurrentUser;
  static String unknownErrorMessage= AppStrings.noCurrentUser;
  static String noImagePickedMessage= AppStrings.noImagePicked;
}