import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_track_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:on_track_app/controllers/auth/auth_bloc.dart';
import 'package:on_track_app/controllers/product/product_bloc.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/core/routing/app_navigation_observer.dart';
import 'package:on_track_app/core/routing/app_routes.dart';
import 'package:on_track_app/core/routing/router.dart';
import 'package:on_track_app/core/utils/di.dart';
import 'ui/resources/app_responsive.dart';
import 'ui/resources/app_themes.dart';

class OnTrackApp extends StatelessWidget {
  const OnTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Responsive Init
    AppResponsive.context = context;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => DependencyInjector.instance<AuthBloc>()),
        BlocProvider(create: (context) {
          return DependencyInjector.instance<AppConfigsBloc>()
            ..listenToInternet();
        }),
        BlocProvider(create: (context) {
          return DependencyInjector.instance<ProductBloc>();
        }),
      ],
      child: BlocBuilder<AppConfigsBloc, AppConfigsState>(
        builder: (BuildContext context, AppConfigsState state) {
          return MaterialApp(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            locale: context.locale,
            theme: AppThemes.getLightModeTheme(),
            darkTheme: AppThemes.getDarkModeTheme(),
            themeMode: AppConfigsBloc.appMode,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            onGenerateRoute: AppRouter.onGenerate,
            initialRoute: AppRoutes.splashScreen,
            navigatorObservers: [
              AppNavigationObserver(),
            ],
          );
        },
      ),
    );
  }
}
