import 'package:on_track_app/core/constants/app_keys.dart';
import 'package:on_track_app/domains/mappers/rating_mapper.dart';
import 'package:on_track_app/domains/models/rating_model.dart';
import '../entities/product.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.category,
      required super.image,
      required super.rating,
      required super.description});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json[AppKeys.idKey],
        title: json[AppKeys.titleKey],
        price: json[AppKeys.priceKey].toInt(),
        category: json[AppKeys.categoryKey],
        image: json[AppKeys.imageKey],
        rating: RatingModel.fromJson(
          json[AppKeys.ratingKey] ?? {},
        ),
        description: json[AppKeys.descriptionKey],
      );

  Map<String, dynamic> toJson() => {
        AppKeys.idKey : id,
        AppKeys.titleKey : title,
        AppKeys.priceKey : price,
        AppKeys.categoryKey : category,
        AppKeys.imageKey : image,
        AppKeys.ratingKey : rating?.toModel().toJson(),
        AppKeys.descriptionKey : description,
      };
}
