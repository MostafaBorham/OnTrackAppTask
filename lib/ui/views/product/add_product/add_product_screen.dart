import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:on_track_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:on_track_app/ui/views/product/add_product/add_product_desktop_layout.dart';
import 'package:on_track_app/ui/views/product/add_product/add_product_mobile_layout.dart';
import 'package:on_track_app/ui/views/product/add_product/add_product_tablet_layout.dart';
import 'package:on_track_app/ui/widgets/adaptive_layout_builder.dart';
import 'package:on_track_app/ui/widgets/custom_app_bar.dart';
import 'package:on_track_app/ui/widgets/no_internet_view.dart';
import 'package:on_track_app/ui/widgets/signout_btn.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  AddProductScreenState createState() => AddProductScreenState();
}

class AddProductScreenState extends State<AddProductScreen> {
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
          appBar: CustomAppBar(
            leading: Align(
                alignment: AlignmentDirectional.centerStart,
                child: AppConfigsBloc.currentConnectionStatue ==
                    InternetConnectionStatus.disconnected
                    ?null : const SignOutBtn()),
          ),
          body: SafeArea(
            child: AppConfigsBloc.currentConnectionStatue ==
                    InternetConnectionStatus.disconnected
                ? const Center(child: NoInternetView())
                : AdaptiveLayout(
                    mobileLayout: (context) => const AddProductMobileLayout(),
                    tabletLayout: (context) => const AddProductTabletLayout(),
                    desktopLayout: (context) => const AddProductDesktopLayout(),
                  ),
          ),
        );
      },
    );
  }
}
