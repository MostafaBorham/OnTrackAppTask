import 'package:flutter/material.dart';
import 'package:on_track_app/ui/resources/app_colors.dart';

class SortExpansionWidget extends StatefulWidget {
  const SortExpansionWidget(
      {super.key, required this.title, required this.children});

  final Widget title;
  final List<Widget> children;
  @override
  State<SortExpansionWidget> createState() => _SortExpansionWidgetState();
}

class _SortExpansionWidgetState extends State<SortExpansionWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: widget.title,
      shape: Border.all(color: AppColors.transparent),
      collapsedIconColor: Theme.of(context).colorScheme.outline,
      iconColor: Theme.of(context).colorScheme.surface,
      textColor: Theme.of(context).colorScheme.onPrimaryFixed,
      collapsedTextColor: Theme.of(context).colorScheme.onPrimaryContainer,
      children: widget.children,
    );
  }
}
