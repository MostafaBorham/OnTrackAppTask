import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/ui/resources/app_images.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key, this.imgW, this.imgH, this.imgColor});
  final double? imgW;
  final double? imgH;
  final Color? imgColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppImages.imagesNoInternet,
          fit: BoxFit.contain,
          height: imgH ?? 100.s(),
          width: imgW ?? 100.s(),
          colorFilter: ColorFilter.mode(
              imgColor ?? Theme.of(context).colorScheme.onPrimaryFixed,
              BlendMode.srcIn),
        ),
        const SizedBox(
          height: 10,
        ),
        AutoSizeText(
          AppStrings.noInternetConnection,
          style: AppStyles.getBoldStyle(
            color: Theme.of(context).colorScheme.error,
            fontSize: 20.s(),
          ),
        ),
      ],
    );
  }
}
