import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_themes.dart';
import 'controllers/app_configs/app_configs_bloc.dart';
import 'controllers/auth/auth_bloc.dart';
import 'controllers/product/product_bloc.dart';
import 'core/localization/strings.dart';
import 'core/routing/app_navigation_observer.dart';
import 'core/routing/app_routes.dart';
import 'core/routing/router.dart';
import 'core/utils/di.dart';

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
