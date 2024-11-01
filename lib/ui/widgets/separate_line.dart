import 'package:flutter/material.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';

class SeparateLine extends StatelessWidget {
  const SeparateLine({super.key, this.height, this.thickness});

  final double? height;
  final double? thickness;
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height?? 2.w(),
      thickness: thickness?? 2.w(),
      color: Theme.of(context).colorScheme.surface,
    );
  }
}