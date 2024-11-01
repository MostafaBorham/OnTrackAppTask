part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFilteredProductsEvent extends ProductEvent {
  final String category;

  GetFilteredProductsEvent({required this.category});
}

class LoadMoreProductsEvent extends ProductEvent {
  final String category;

  LoadMoreProductsEvent({required this.category});
}

class GetCategoriesEvent extends ProductEvent {}

class ChangeProductsCategoryEvent extends ProductEvent {
  final String category;

  ChangeProductsCategoryEvent({required this.category});
}

class ChangeNewProductsCategoryEvent extends ProductEvent {
  final String category;

  ChangeNewProductsCategoryEvent({required this.category});
}

class SortProductsEvent extends ProductEvent {
  final SortOption sortOption;

  SortProductsEvent({
    required this.sortOption,
  });
}

class SearchInProductsEvent extends ProductEvent {
  final String searchKey;

  SearchInProductsEvent({
    required this.searchKey,
  });
}

class PickProductImageEvent extends ProductEvent {
  final ImageSource source;

  PickProductImageEvent({
    required this.source,
  });
}

class ResetAddProductEvent extends ProductEvent {}

class AddProductEvent extends ProductEvent {
  final String name;
  final String price;
  final String description;

  AddProductEvent(
      {required this.name, required this.price, required this.description});
}
