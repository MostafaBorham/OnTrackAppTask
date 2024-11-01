import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class SignUpDesktopLayout extends StatelessWidget {
  const SignUpDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText('SignUp Desktop Layout',style: AppStyles.getBoldStyle(),),
    );
  }
}
