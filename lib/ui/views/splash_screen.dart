import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/core/routing/app_routes.dart';
import 'package:on_track_app/ui/widgets/app_logo_animation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: AppLogoAnimation(
            onAnimationEnd: () {
              if (FirebaseAuth.instance.currentUser != null) {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.productsScreen,
                );
              } else {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.signinScreen,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
