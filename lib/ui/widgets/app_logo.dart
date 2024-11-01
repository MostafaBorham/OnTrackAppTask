import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_track_app/ui/resources/app_images.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.logoW, this.logoH, this.logoColor});
  final double? logoW;
  final double? logoH;
  final Color? logoColor;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppImages.assetsImagesAppIcon,
      fit: BoxFit.contain,
      height: logoH ?? 24.s(),
      width: logoW ?? 24.s(),

    );
  }
}