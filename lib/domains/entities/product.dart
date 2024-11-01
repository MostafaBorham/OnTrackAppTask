import 'package:equatable/equatable.dart';
import 'package:on_track_app/domains/entities/rating.dart';

class Product extends Equatable {
  int? id;
  String? title;
  int? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
    required this.description,
  });

  Product copyWith({
    int? newId,
    String? newTitle,
    int? newPrice,
    String? newCategory,
    String? newImage,
    String? newDescription,
    Rating? newRating,
  }) =>
      Product(
        id: newId ?? id,
        title: newTitle ?? title,
        price: newPrice ?? price,
        description: newDescription ?? description,
        category: newCategory ?? category,
        image: newImage ?? image,
        rating: newRating ?? rating,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        category,
        image,
        rating,
        description,
      ];
}
