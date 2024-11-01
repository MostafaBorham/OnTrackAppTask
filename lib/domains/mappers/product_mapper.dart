import 'package:on_track_app/domains/entities/product.dart';
import 'package:on_track_app/domains/models/product_model.dart';

extension ProductModelExt on ProductModel {
  Product toEntity() => Product(
        id: id,
        title: title,
        price: price,
        category: category,
        image: image,
        rating: rating,
        description: description,
      );
}

extension ProductExt on Product {
  ProductModel toModel() => ProductModel(
        id: id,
        title: title,
        price: price,
        category: category,
        image: image,
        rating: rating,
        description: description,
      );
}
