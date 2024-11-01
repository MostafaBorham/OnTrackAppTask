import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class SignBtn extends StatelessWidget {
  const SignBtn(
      {super.key,
      required this.color,
      required this.title,
      required this.onPressed});

  final Color color;
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: color,
      borderRadius: BorderRadius.circular(10.s()),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.infinity,
        height: 40.w(),
        child: AutoSizeText(
          title,
          style: AppStyles.getBoldStyle(),
        ),
      ),
    );
  }
}
