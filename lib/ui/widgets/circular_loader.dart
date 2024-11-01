import 'package:flutter/material.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key, this.size,this.color});
  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size??15.s(),
        width: size??15.s(),
        child: CircularProgressIndicator(
          color: color?? Theme.of(context).colorScheme.outline,
          strokeWidth: 3.s(),
        ),
      ),
    );
  }
}
