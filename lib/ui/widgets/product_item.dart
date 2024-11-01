import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/domains/entities/product.dart';
import 'package:on_track_app/ui/resources/app_colors.dart';
import 'package:on_track_app/ui/resources/app_images.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            height: 150.w(),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(
                  product.image ?? AppImages.notImageFoundPlaceholder,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Title
                AutoSizeText(
                  product.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.getBoldStyle(
                      color: Theme.of(context).colorScheme.onPrimaryFixed,
                      fontSize: 15.s()),
                ),
                const SizedBox(height: 5),
                // Product Price
                AutoSizeText(
                  '${product.price}\$',
                  style: AppStyles.getSemiBoldStyle(
                      color: AppColors.yellow_887B06, fontSize: 10.s()),
                ),
                const SizedBox(height: 5),
                // Product Description
                AutoSizeText(
                  product.description!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.getMediumStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 10.s()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
