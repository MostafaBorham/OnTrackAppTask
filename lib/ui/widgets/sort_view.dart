import 'package:flutter/material.dart';
import 'package:on_track_app/controllers/product/product_bloc.dart';
import 'package:on_track_app/core/enums/sort_options.dart';
import 'package:on_track_app/core/enums/sort_types.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';
import 'package:on_track_app/ui/widgets/sort_expansion_widget.dart';
import 'package:on_track_app/ui/widgets/sort_type_header.dart';

class SortView extends StatefulWidget {
  const SortView({super.key});

  @override
  State<SortView> createState() => _SortViewState();
}

class _SortViewState extends State<SortView> {
  void _onSortOptionChanged(SortOption? value) {
    Navigator.pop(context);
    ProductBloc.get(context).add(SortProductsEvent(sortOption: value!));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SortExpansionWidget(
            title: const SortTypeHeader(sortType: SortTypes.nameSort),
            children: [
              RadioListTile<SortOption>(
                title: Text(
                  AppStrings.aToZ,
                  style: AppStyles.getMediumStyle(
                      color: Theme.of(context).colorScheme.onPrimaryFixed,
                      fontSize: 15.s()),
                ),
                activeColor: Theme.of(context).colorScheme.surface,
                value: SortOption.nameAToZ,
                groupValue: ProductBloc.get(context).selectedSortOption,
                onChanged: _onSortOptionChanged,
              ),
              RadioListTile<SortOption>(
                title: Text(
                  AppStrings.zToA,
                  style: AppStyles.getMediumStyle(
                      color: Theme.of(context).colorScheme.onPrimaryFixed,
                      fontSize: 15.s()),
                ),
                activeColor: Theme.of(context).colorScheme.surface,
                value: SortOption.nameZToA,
                groupValue: ProductBloc.get(context).selectedSortOption,
                onChanged: _onSortOptionChanged,
              ),
            ]),
        SizedBox(
          height: 10.w(),
        ),
        SortExpansionWidget(
            title: const SortTypeHeader(sortType: SortTypes.priceSort),
            children: [
              RadioListTile<SortOption>(
                title: Text(
                  AppStrings.lowToHigh,
                  style: AppStyles.getMediumStyle(
                      color: Theme.of(context).colorScheme.onPrimaryFixed,
                      fontSize: 15.s()),
                ),
                activeColor: Theme.of(context).colorScheme.surface,
                value: SortOption.priceLowToHigh,
                groupValue: ProductBloc.get(context).selectedSortOption,
                onChanged: _onSortOptionChanged,
              ),
              RadioListTile<SortOption>(
                title: Text(
                  AppStrings.highToLow,
                  style: AppStyles.getMediumStyle(
                      color: Theme.of(context).colorScheme.onPrimaryFixed,
                      fontSize: 15.s()),
                ),
                activeColor: Theme.of(context).colorScheme.surface,
                value: SortOption.priceHighToLow,
                groupValue: ProductBloc.get(context).selectedSortOption,
                onChanged: _onSortOptionChanged,
              ),
            ]),
      ],
    );
  }
}
