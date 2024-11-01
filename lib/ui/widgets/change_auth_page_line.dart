import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class ChangeAuthPageLine extends StatelessWidget {
  const ChangeAuthPageLine({
    super.key, required this.question, required this.authType, this.changeAuthEvent,
  });
  final String question;
  final String authType;
  final VoidCallback? changeAuthEvent;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(question.tr(),style: AppStyles.getSemiBoldStyle(color: Theme.of(context).colorScheme.onPrimaryFixed,fontSize: 15.s()),),
        TextButton(onPressed: changeAuthEvent, child: AutoSizeText(authType.tr(),style: AppStyles.getBoldStyle(color: Theme.of(context).colorScheme.surface,fontSize: 15.s()),),)
      ],
    );
  }
}