import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:on_track_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:on_track_app/controllers/auth/auth_bloc.dart';
import 'package:on_track_app/controllers/product/product_bloc.dart';
import 'package:uuid/uuid.dart';

abstract class DependencyInjector {
  static final instance = GetIt.instance;

  static void init() {

    ///Blocs
    ///-> AppConfigsBloc
    instance.registerLazySingleton<AppConfigsBloc>(() => AppConfigsBloc());
    ///-> ProductBloc
    instance.registerLazySingleton<ProductBloc>(() => ProductBloc());
    ///-> AuthBloc
    instance.registerLazySingleton<AuthBloc>(() => AuthBloc());

    ///Network Connection
    instance.registerLazySingleton<InternetConnectionChecker>(
        () => InternetConnectionChecker());

    ///Image Picker
    instance.registerLazySingleton<ImagePicker>(
            () => ImagePicker());

    ///UUID
    instance.registerLazySingleton<Uuid>(
            () => const Uuid());
  }
}
