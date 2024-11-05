import '../localization/strings.dart';

abstract class AppErrors {
  static String offlineErrorMessage = AppStrings.offlineError;
  static String serverErrorMessage = AppStrings.serverError;
  static String cacheErrorMessage = AppStrings.cacheError;
  static String invalidPageNumberMessage = AppStrings.invalidPageNumberError;
  static String timeoutMessage = AppStrings.timeoutError;
  static String noCurrentUserMessage = AppStrings.noCurrentUserError;
  static String noDeviceTokenMessage = AppStrings.noDeviceTokenError;
  static String noUserMessage = AppStrings.noCurrentUserError;
  static String userPermanentMessage = AppStrings.noCurrentUserError;
  static String unknownErrorMessage = AppStrings.noCurrentUserError;
  static String noImagePickedMessage = AppStrings.noImagePickedError;
}