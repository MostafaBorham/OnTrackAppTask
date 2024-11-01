import 'package:on_track_app/core/constants/app_keys.dart';
import 'package:on_track_app/domains/entities/rating.dart';

class RatingModel extends Rating {
  RatingModel({required super.rate, required super.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: (json[AppKeys.rateKey]??0).toDouble(),
        count: json[AppKeys.countKey]??0,
      );

  Map<String, dynamic> toJson() => {
        AppKeys.rateKey : rate,
        AppKeys.countKey : count,
      };
}