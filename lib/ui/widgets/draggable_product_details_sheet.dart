import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/core/constants/app_durations.dart';
import 'package:on_track_app/domains/entities/product.dart';
import 'package:on_track_app/ui/resources/app_colors.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';
import 'package:on_track_app/ui/widgets/draggable_sheet_indicator.dart';
import 'package:on_track_app/ui/widgets/product_price_with_category_line.dart';
import 'package:on_track_app/ui/widgets/rating_details.dart';

import 'rating_header.dart';

class DraggableProductDetailsSheet extends StatelessWidget {
  const DraggableProductDetailsSheet({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5, // Initial height as 20% of screen
      minChildSize: 0.5, // Minimum height (collapsed state)
      maxChildSize: 1, // Maximum height (expanded state)
      snap: true,
      snapAnimationDuration: AppDurations.d500Milli,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black_opc20,
                spreadRadius: 15,
                blurRadius: 30,
              ),
            ],
          ),
          child: ListView(
            controller: scrollController,
            padding:
            EdgeInsetsDirectional.symmetric(horizontal: 20.w()),
            children: [
              const Center(
                child: DraggableSheetIndicator(),
              ),
              const SizedBox(
                height: 30,
              ),
              // Product Name
              AutoSizeText(
                product.title ?? '',
                style: AppStyles.getBoldStyle(
                    color: Theme.of(context).colorScheme.onPrimaryFixed,
                    fontSize: 25.s()),
              ),
              const SizedBox(height: 15),

              // Product Price
              ProductPriceWithCategoryLine(product: product),
              const SizedBox(height: 30),

              // Product Description
              AutoSizeText(
                product.description ?? '',
                style: AppStyles.getMediumStyle(
                  fontSize: 15.s(),
                  color: Theme.of(context).colorScheme.onSecondaryFixed,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),

              // Rating
              const RatingHeader(),
              const SizedBox(height: 15),
              RatingDetails(rating: product.rating!),
            ],
          ),
        );
      },
    );
  }
}
