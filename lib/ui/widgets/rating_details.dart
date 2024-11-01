import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:on_track_app/domains/entities/rating.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class RatingDetails extends StatelessWidget {
  const RatingDetails({super.key, required this.rating});

  final Rating rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBar.builder(
          initialRating: rating.rate??0,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 25.s(),
          unratedColor:
          Theme.of(context).colorScheme.onSecondaryFixed,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          onRatingUpdate: (rating) {
          },
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
              rating.count.toString(),
              style: AppStyles.getSemiBoldStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryFixed,
                  fontSize: 15.s()),
            ),
          ],
        )
      ],
    );
  }
}
