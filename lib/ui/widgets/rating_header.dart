import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class RatingHeader extends StatelessWidget {
  const RatingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.rate_review,
          color: Theme.of(context).colorScheme.surface,
        ),
        const SizedBox(
          width: 5,
        ),
        AutoSizeText(
          AppStrings.rating,
          style: AppStyles.getBoldStyle(
              fontSize: 20.s(),
              color: Theme.of(context).colorScheme.onPrimaryFixed),
        ),
      ],
    );
  }
}
