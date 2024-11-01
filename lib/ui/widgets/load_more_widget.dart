import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

import 'separate_line.dart';

class LoadMoreWidget extends StatelessWidget {
  const LoadMoreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 10.w(), child: const SeparateLine()),
        SizedBox(
          width: 10.w(),
        ),
        AutoSizeText(
          AppStrings.showMore,
          style: AppStyles.getSemiBoldStyle(
              fontSize: 15.s(),
              color: Theme.of(context).colorScheme.onPrimaryFixed),
        ),
        SizedBox(
          width: 10.w(),
        ),
        SizedBox(width: 10.w(), child: const SeparateLine()),
      ],
    );
  }
}