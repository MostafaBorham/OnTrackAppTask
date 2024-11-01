import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/ui/resources/app_images.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20.s(),
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundImage: const AssetImage(
            AppImages.profilePhotoPlaceholder,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        AutoSizeText.rich(TextSpan(
            text: '${AppStrings.hi}, ',
            style: AppStyles.getSemiBoldStyle(
              color: Theme.of(context).colorScheme.onPrimaryFixed,
              fontSize: 15.s(),
            ),
            children: [
              TextSpan(
                text: FirebaseAuth.instance.currentUser?.displayName ??
                    AppStrings.anonymousUser,
                style: AppStyles.getBoldStyle(
                  color: Theme.of(context).colorScheme.onPrimaryFixed,
                  fontSize: 15.s(),
                ),
              )
            ])),
      ],
    );
  }
}
