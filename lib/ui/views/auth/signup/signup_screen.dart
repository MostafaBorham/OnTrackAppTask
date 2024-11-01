import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:on_track_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:on_track_app/ui/views/auth/signup/signup_desktop_layout.dart';
import 'package:on_track_app/ui/views/auth/signup/signup_mobile_layout.dart';
import 'package:on_track_app/ui/views/auth/signup/signup_tablet_layout.dart';
import 'package:on_track_app/ui/widgets/adaptive_layout_builder.dart';
import 'package:on_track_app/ui/widgets/custom_app_bar.dart';
import 'package:on_track_app/ui/widgets/no_internet_view.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigsBloc, AppConfigsState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const CustomAppBar(),
          body: SafeArea(
            child: AppConfigsBloc.currentConnectionStatue ==
                    InternetConnectionStatus.disconnected
                ? const Center(child: NoInternetView())
                : AdaptiveLayout(
                    mobileLayout: (context) => const SignUpMobileLayout(),
                    tabletLayout: (context) => const SignUpTabletLayout(),
                    desktopLayout: (context) => const SignUpDesktopLayout(),
                  ),
          ),
        );
      },
    );
  }
}
