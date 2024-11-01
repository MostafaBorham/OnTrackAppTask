import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/core/enums/sort_types.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class SortTypeHeader extends StatefulWidget {
  const SortTypeHeader({
    super.key,
    required this.sortType,
  });

  final SortTypes sortType;

  @override
  State<SortTypeHeader> createState() => _SortTypeHeaderState();
}

class _SortTypeHeaderState extends State<SortTypeHeader> {
  late IconData icon;
  late String title;

  _initSortVariables() {
    switch (widget.sortType) {
      case SortTypes.nameSort:
        {
          icon = Icons.person;
          title = '${AppStrings.sortByName} :';
          break;
        }
      case SortTypes.priceSort:
        {
          icon = Icons.attach_money;
          title = '${AppStrings.sortByPrice} :';
          break;
        }
      default:
        {
          icon = Icons.remove;
          title = '';
          break;
        }
    }
  }

  @override
  void initState() {
    super.initState();
    _initSortVariables();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 5,
        ),
        AutoSizeText(
          title,
          style: AppStyles.getBoldStyle(
              color: Theme.of(context).colorScheme.onPrimaryFixed,
              fontSize: 15.s()),
        ),
      ],
    );
  }
}
