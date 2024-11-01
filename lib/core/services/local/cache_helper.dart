import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:on_track_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:on_track_app/core/constants/app_keys.dart';
import 'package:on_track_app/core/extensions/theme_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  //////////////////////////////////////////////////////////////////
  static SharedPreferences? _preferences;
  static FlutterSecureStorage? _secureStorage;
  ///////////////////////////////////////////////////////////////////
  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
    _secureStorage = const FlutterSecureStorage();
    AppConfigsBloc.appMode = await getAppMode();
  }

/////////////////////////////////////////////////////////////////////
  static Future saveUserToken({required String token}) async =>
      await _secureStorage?.write(
        key: AppKeys.userTokenKey,
        value: token,
      );
  static Future saveAppMode({required ThemeMode mode}) async {
    var modeValue = mode.name.toString();
    return await _secureStorage?.write(
        key: AppKeys.appModeKey, value: modeValue);
  }

  static Future<bool?> saveAccountUpgradeStatus(
      {required bool isUpgrade}) async {
    return await _preferences?.setBool(AppKeys.accountUpgradeKey, isUpgrade);
  }

  static bool getAccountUpgradeStatus() {
    var isUpgrade = _preferences?.getBool(AppKeys.accountUpgradeKey) ?? false;
    return isUpgrade;
  }

  static Future<String> getUserToken() async =>
      await _secureStorage?.read(key: AppKeys.userTokenKey) ?? '';
  static Future<ThemeMode> getAppMode() async {
    var modeJson = await _secureStorage?.read(key: AppKeys.appModeKey) ?? '';
    return modeJson.getThemeMode();
  }

  static Future<void> removeToken() async =>
      await _secureStorage?.delete(key: AppKeys.userTokenKey);

  static Future<void> removeAccountUpgrade() async =>
      await _preferences?.remove(AppKeys.accountUpgradeKey);

  static Future<void> removeCurrentUserInfo() async =>
      await _preferences?.remove(AppKeys.userInfoKey);

  static Future saveSigninEmail({required String email}) async =>
      await _secureStorage?.write(
        key: AppKeys.signinEmailKey,
        value: email,
      );
  static Future saveSigninPassword({required String password}) async =>
      await _secureStorage?.write(
        key: AppKeys.signinPasswordKey,
        value: password,
      );
  static Future saveSignupEmail({required String email}) async =>
      await _secureStorage?.write(
        key: AppKeys.signupEmailKey,
        value: email,
      );
  static Future saveSignupPassword({required String password}) async =>
      await _secureStorage?.write(
        key: AppKeys.signupPasswordKey,
        value: password,
      );
  static Future saveSignupName({required String name}) async =>
      await _secureStorage?.write(
        key: AppKeys.signupNameKey,
        value: name,
      );
  static Future saveChatInputMessage({required String input}) async =>
      await _secureStorage?.write(
        key: AppKeys.chatInputMessageKey,
        value: input,
      );

  static Future<String> getSigninEmail() async =>
      await _secureStorage?.read(key: AppKeys.signinEmailKey) ?? '';
  static Future<String> getSigninPassword() async =>
      await _secureStorage?.read(key: AppKeys.signinPasswordKey) ?? '';
  static Future<String> getSignupEmail() async =>
      await _secureStorage?.read(key: AppKeys.signupEmailKey) ?? '';
  static Future<String> getSignupPassword() async =>
      await _secureStorage?.read(key: AppKeys.signupPasswordKey) ?? '';
  static Future<String> getSignupName() async =>
      await _secureStorage?.read(key: AppKeys.signupNameKey) ?? '';
  static Future<String> getChatInputMessage() async =>
      await _secureStorage?.read(key: AppKeys.chatInputMessageKey) ?? '';

  static Future<void> removeSigninEmail() async =>
      await _secureStorage?.delete(key: AppKeys.signinEmailKey);

  static Future<void> removeSigninPassword() async =>
      await _preferences?.remove(AppKeys.signinPasswordKey);

  static Future<void> removeSignupEmail() async =>
      await _preferences?.remove(AppKeys.signupEmailKey);

  static Future<void> removeSignupName() async =>
      await _preferences?.remove(AppKeys.signupNameKey);

  static Future<void> removeSignupPassword() async =>
      await _preferences?.remove(AppKeys.signupPasswordKey);

  static Future<void> removeChatInputTxt() async =>
      await _preferences?.remove(AppKeys.chatInputMessageKey);
}
