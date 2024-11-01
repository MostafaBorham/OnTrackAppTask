import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';
import 'package:on_track_app/ui/widgets/dialogs/logout_dialog.dart';

class SignOutBtn extends StatelessWidget {
  const SignOutBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        icon: Icon(Icons.logout_rounded,color: Theme.of(context).colorScheme.error,
          size: 20.s(),),
        onPressed: (){
      showDialog(context: context, builder: (context) => const LogoutDialog(),);
    },
        label: AutoSizeText(AppStrings.logout,style: AppStyles.getSemiBoldStyle(
          color: Theme.of(context).colorScheme.error,
          fontSize: 20.s(),
        ),
        ));
  }
}