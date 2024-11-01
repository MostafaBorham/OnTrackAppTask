part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

/// Get Products States
class LoadingProductsState extends ProductState {}

class FailGetProductsState extends ProductState {
  final String failMessage;

  FailGetProductsState({required this.failMessage});

  @override
  List<Object?> get props => [
        failMessage,
      ];
}

class SuccessGetProductsState extends ProductState {}

/// Load More Products States
class LoadingMoreProductsState extends ProductState {}

class FailLoadMoreProductsState extends ProductState {
  final String failMessage;

  FailLoadMoreProductsState({required this.failMessage});

  @override
  List<Object?> get props => [
        failMessage,
      ];
}

class SuccessLoadMoreProductsState extends ProductState {}

/// Get Categories States
class LoadingCategoriesState extends ProductState {}

class FailGetCategoriesState extends ProductState {
  final String failMessage;

  FailGetCategoriesState({required this.failMessage});

  @override
  List<Object?> get props => [
        failMessage,
      ];
}

class SuccessGetCategoriesState extends ProductState {}

/// Sort Products States
class ShowSortedProductsState extends ProductState {
  final String uid;

  ShowSortedProductsState({required this.uid});

  @override
  List<Object?> get props => [
        uid,
      ];
}

/// Search In Products States
class ShowSearchedProductsState extends ProductState {
  final String uid;

  ShowSearchedProductsState({required this.uid});

  @override
  List<Object?> get props => [
        uid,
      ];
}

class NewSelectedCategoryChangedState extends ProductState {
  final String uid;

  NewSelectedCategoryChangedState({required this.uid});

  @override
  List<Object?> get props => [
        uid,
      ];
}

/// Pick Product Image States
class LoadingProductImageState extends ProductState {}

class FailPickProductImageState extends ProductState {
  final String failMessage;

  FailPickProductImageState({required this.failMessage});

  @override
  List<Object?> get props => [
        failMessage,
      ];
}

class SuccessPickProductImageState extends ProductState {}

/// Add Product States
class WaitingAddProductState extends ProductState {}

class FailAddProductState extends ProductState {
  final String failMessage;
  final String uid;

  FailAddProductState({required this.failMessage, required this.uid});

  @override
  List<Object?> get props => [
        failMessage,
        uid,
      ];
}

class SuccessAddProductState extends ProductState {}

