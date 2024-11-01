import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:on_track_app/app_init.dart';
import 'package:on_track_app/core/localization/configs.dart';
import 'package:on_track_app/core/services/local/cache_helper.dart';
import 'package:on_track_app/core/services/network/dio_helper.dart';
import 'package:on_track_app/core/utils/di.dart';
import 'package:on_track_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DependencyInjector.init();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(const LocalizationInit(child: OnTrackApp())));
}