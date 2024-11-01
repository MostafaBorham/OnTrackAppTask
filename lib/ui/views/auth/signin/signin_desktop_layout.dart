import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class SignInDesktopLayout extends StatelessWidget {
  const SignInDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText('SignIn Desktop Layout',style: AppStyles.getBoldStyle(),),
    );
  }
}
