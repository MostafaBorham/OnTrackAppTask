import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/core/constants/app_constants.dart';
import 'package:on_track_app/domains/entities/product.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class ProductPriceWithCategoryLine extends StatelessWidget {
  const ProductPriceWithCategoryLine({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          '\$${product.price}',
          style: AppStyles.getSemiBoldStyle(
              color: Theme.of(context).colorScheme.surface,
              fontSize: 20.s()),
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.category_rounded,
              size: 20.s(),
              color: Theme.of(context).colorScheme.surface,
            ),
            const SizedBox(
              width: 5,
            ),
            AutoSizeText(
              product.category ?? AppConstants.all,
              style: AppStyles.getSemiBoldStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryFixed,
                  fontSize: 20.s()),
            ),
          ],
        )
      ],
    );
  }
}