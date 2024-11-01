import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_track_app/controllers/product/product_bloc.dart';
import 'package:on_track_app/core/constants/app_constants.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';
import 'package:on_track_app/ui/widgets/categories_dropdown.dart';
import 'package:on_track_app/ui/widgets/circular_loader.dart';

class ProductCategoryFilterWidget extends StatelessWidget {
  const ProductCategoryFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AutoSizeText(
          AppStrings.filterByCategory,
          style: AppStyles.getMediumStyle(
              fontSize: 15.s(),
              color: Theme.of(context).colorScheme.onPrimaryFixed),
        ),
        const SizedBox(width: 10),
        BlocBuilder<ProductBloc, ProductState>(
          buildWhen: (previous, current) {
            if (previous is LoadingCategoriesState &&
                current is! FailGetCategoriesState &&
                current is! SuccessGetCategoriesState) {
              return false;
            }
            return true;
          },
          builder: (context, state) {
            return state is LoadingCategoriesState
                ? CircularLoader(
                    color: Theme.of(context).colorScheme.surface,
                  )
                : CategoriesDropdown(
                    selectedCategory: ProductBloc.get(context).selectedCategory,
                    categories: ProductBloc.get(context).categoriesList,
                    onCategoryChanged: (selectedCategory) {
                      ProductBloc.get(context).add(ChangeProductsCategoryEvent(
                          category: selectedCategory ?? AppConstants.all));
                    },
                  );
          },
        ),
      ],
    );
  }
}
