import 'package:flutter/material.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

void showNormalSnackBar({required BuildContext context, String? message}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message ?? AppStrings.noMessage,
          style: AppStyles.getBoldStyle(
              fontSize: 15.s(),
              color: Theme.of(context).colorScheme.onPrimaryFixed),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
}

void showSuccessSnackBar({required BuildContext context, String? message}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message ?? AppStrings.noMessage,
          style: AppStyles.getBoldStyle(
              fontSize: 15.s(),
              color: Theme.of(context).colorScheme.onPrimaryFixed),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
}

void showErrorSnackBar({required BuildContext context, String? message}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message ?? AppStrings.noMessage,
          style: AppStyles.getBoldStyle(
              fontSize: 15.s(),
              color: Theme.of(context).colorScheme.onPrimaryFixed),
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
}
