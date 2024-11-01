import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';
import 'package:on_track_app/ui/widgets/app_logo.dart';

class AppLogoAnimation extends StatefulWidget {
  const AppLogoAnimation({
    super.key,
    required this.onAnimationEnd,
  });

  final Function onAnimationEnd;

  @override
  State<AppLogoAnimation> createState() => _AppLogoAnimationState();
}

class _AppLogoAnimationState extends State<AppLogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
    animationController.forward();
    animationController.addListener(_animationListener);
  }

  @override
  void dispose() {
    animationController.removeListener(_animationListener);
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ScaleTransition(
           scale: animation,
            child:  AppLogo(
              logoH: 100.w(),
              logoW: 100.w(),
            )),
        const SizedBox(
          height: 30,
        ),
        AutoSizeText(
          AppStrings.appName,
          style: AppStyles.getBoldStyle(
              color: Theme.of(context).colorScheme.surface, fontSize: 50.s()),
        ),
      ],
    );
  }

  _animationListener() {
    if (animationController.isCompleted) {
      widget.onAnimationEnd();
    }
  }
}
