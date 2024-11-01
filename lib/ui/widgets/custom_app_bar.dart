import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_track_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:on_track_app/ui/resources/app_colors.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/widgets/app_mode_button.dart';
import 'package:on_track_app/ui/widgets/language_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.leading});

  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: leading,
      leadingWidth: double.infinity,
      surfaceTintColor: AppColors.transparent,
      backgroundColor: AppColors.transparent,
      actions: [
        BlocBuilder<AppConfigsBloc, AppConfigsState>(builder: (context, state) {
          return const LanguageButton();
        }),
        const SizedBox(
          width: 10,
        ),
        const AppModeButton(),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50.w());
}
