import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      AppConfigsBloc.get(context).add(ChangeAppLocaleEvent(context));
    },
        child: AutoSizeText(AppStrings.languageBtnTxt,style: AppStyles.getSemiBoldStyle(
          color: Theme.of(context).colorScheme.error,
          fontSize: 20.s(),
        ),));
  }
}