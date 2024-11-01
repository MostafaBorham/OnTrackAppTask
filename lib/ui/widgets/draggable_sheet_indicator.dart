import 'package:flutter/material.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';

import 'separate_line.dart';

class DraggableSheetIndicator extends StatelessWidget {
  const DraggableSheetIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50.w(),
        margin: const EdgeInsetsDirectional.only(top: 2),
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.vertical(
              bottom: Radius.circular(5)),
        ),
        child: SeparateLine(
          height: 6.w(),
          thickness: 6.w(),
        ));
  }
}