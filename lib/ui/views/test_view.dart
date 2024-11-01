import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:on_track_app/core/constants/app_constants.dart';
import 'package:on_track_app/core/constants/app_durations.dart';
import 'package:on_track_app/domains/entities/product.dart';
import 'package:on_track_app/domains/entities/rating.dart';
import 'package:on_track_app/ui/resources/app_colors.dart';
import 'package:on_track_app/ui/resources/app_images.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';
import 'package:on_track_app/ui/widgets/separate_line.dart';

class TestView extends StatelessWidget {
  TestView({super.key});

  final product = Product(
    id: 1,
    title: 'title',
    price: 10,
    category: 'category',
    image: 'image',
    rating: Rating(rate: 3, count: 10),
    description: 'description',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: Stack(
            children: [
              // Background Image
              FractionallySizedBox(
                heightFactor: 0.7,
                widthFactor: 1,
                child: Image.network(
                  AppImages.notImageFoundPlaceholder,
                  fit: BoxFit.cover,
                ),
              ),
              // Draggable Scrollable Details Sheet
              DraggableScrollableSheet(
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
                        Center(
                          child: Container(
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
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Product Name
                        AutoSizeText(
                          product.title ?? '',
                          style: AppStyles.getBoldStyle(
                              color:
                                  Theme.of(context).colorScheme.onPrimaryFixed,
                              fontSize: 25.s()),
                        ),
                        const SizedBox(height: 15),

                        // Product Price
                        Row(
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
                        ),
                        const SizedBox(height: 30),

                        // Product Description
                        AutoSizeText(
                          product.description ?? '',
                          style: AppStyles.getMediumStyle(
                            fontSize: 15.s(),
                            color:
                                Theme.of(context).colorScheme.onSecondaryFixed,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Rating
                        Row(
                          children: [
                            Icon(
                              Icons.rate_review,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AutoSizeText(
                              'Rating',
                              style: AppStyles.getBoldStyle(
                                  fontSize: 20.s(),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryFixed),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 25.s(),
                              unratedColor: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryFixed,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                AutoSizeText(
                                  product.rating!.count.toString(),
                                  style: AppStyles.getSemiBoldStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryFixed,
                                      fontSize: 15.s()),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
