import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_track_app/controllers/product/product_bloc.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/ui/resources/app_colors.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';
import 'package:on_track_app/ui/widgets/sort_view.dart';

class ProductSearchWidget extends StatefulWidget {
  const ProductSearchWidget({super.key, required this.onSearch});

  final ValueChanged<String>? onSearch;
  @override
  ProductSearchWidgetState createState() => ProductSearchWidgetState();
}

class ProductSearchWidgetState extends State<ProductSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      autovalidateMode: AutovalidateMode.always,
      cursorColor: Theme.of(context).colorScheme.surface,
      style: AppStyles.getSemiBoldStyle(
          color: Theme.of(context).colorScheme.onPrimaryFixed,
          fontSize: 20.s()),
      decoration: InputDecoration(
        hintText: AppStrings.searchInProducts,
        hintStyle: AppStyles.getSemiBoldStyle(
            color: Theme.of(context).colorScheme.onSecondary, fontSize: 20.s()),
        suffixIcon: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => BlocProvider<ProductBloc>.value(
                  value: ProductBloc.get(context),
                  child: Container(
                    height: 200.w(),
                    color: AppColors.white_b2c2c2,
                    child: const SortView(),
                  ),
                ),
            );
          },
          icon: const Icon(Icons.sort),
          color: Theme.of(context).colorScheme.surface,
        ),
        prefixIcon: const Icon(Icons.search),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surface, width: 3)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimaryFixed)),
      ),
      onChanged: widget.onSearch,
    );
  }
}
