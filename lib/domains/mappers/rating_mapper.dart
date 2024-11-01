import 'package:on_track_app/domains/entities/rating.dart';
import 'package:on_track_app/domains/models/rating_model.dart';

extension RatingModelExt on RatingModel {
  Rating toEntity() => Rating(rate: rate, count: count);
}

extension RatingExt on Rating {
  RatingModel toModel() => RatingModel(rate: rate, count: count);
}
