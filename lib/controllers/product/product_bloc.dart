import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_track_app/core/constants/app_constants.dart';
import 'package:on_track_app/core/enums/sort_options.dart';
import 'package:on_track_app/core/errors/failures.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/core/utils/di.dart';
import 'package:on_track_app/core/utils/functions/image_picker.dart';
import 'package:on_track_app/data/network/repo.dart';
import 'package:on_track_app/domains/entities/product.dart';
import 'package:on_track_app/domains/entities/rating.dart';
import 'package:on_track_app/domains/mappers/product_mapper.dart';
import 'package:on_track_app/domains/models/product_model.dart';
import 'package:uuid/uuid.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  int currentLimit = 4;
  final int pageSize = 4;
  bool isMoreProducts = true;
  String productImagePath = '';
  String selectedCategory = AppConstants.all;
  String newSelectedCategory = AppConstants.selectCategory;
  SortOption selectedSortOption = SortOption.nameAToZ;
  String currentSearchKey = '';
  List<Product> mainProductsList = [];
  List<Product> searchedProductsList = [];
  List<Product> addedProductsList = [];
  List<String> categoriesList = [];
  List<String> newCategoriesList = [];
  /////////////////////////////////////////////////////////////////
  static ProductBloc get(BuildContext context) =>
      BlocProvider.of<ProductBloc>(context);

  ProductBloc() : super(ProductInitial()) {
    on<GetFilteredProductsEvent>(_getFilteredProducts);
    on<LoadMoreProductsEvent>(_loadMoreProducts);
    on<ChangeProductsCategoryEvent>(_changeProductsCategory);
    on<ChangeNewProductsCategoryEvent>(_changeNewProductsCategory);
    on<GetCategoriesEvent>(_getCategories);
    on<SortProductsEvent>(_sortProducts);
    on<SearchInProductsEvent>(_searchInProducts);
    on<PickProductImageEvent>(_pickProductImage);
    on<AddProductEvent>(_addProduct);
    on<ResetAddProductEvent>(_resetAddProduct);
  }

///////////////////////////////////////////////////////////////////////////

  FutureOr<void> _getFilteredProducts(
      GetFilteredProductsEvent event, Emitter<ProductState> emit) async {
    if (state is! LoadingProductsState) {
      emit(LoadingProductsState());
      final result =
          await _handleFilteredProductDataRequest(category: event.category);
      await result.fold(
        (failure) {
          emit(FailGetProductsState(failMessage: failure.message!));
        },
        (productsModelsList) async {
          if (productsModelsList.length - mainProductsList.length < pageSize) {
            isMoreProducts = false;
          }
          mainProductsList = productsModelsList
              .map<Product>(
                (productModel) => productModel.toEntity(),
              )
              .toList();

          searchedProductsList = productsModelsList
              .map<Product>(
                (productModel) => productModel.toEntity(),
              )
              .toList();
          add(SearchInProductsEvent(searchKey: currentSearchKey));
          emit(SuccessGetProductsState());
        },
      );
    }
  }

  FutureOr<void> _changeProductsCategory(
      ChangeProductsCategoryEvent event, Emitter<ProductState> emit) async {
    if (event.category != selectedCategory) {
      selectedCategory = event.category;
      isMoreProducts = true;
      currentLimit = pageSize;
      mainProductsList.clear();
      searchedProductsList.clear();
      add(GetFilteredProductsEvent(category: event.category));
    }
  }

  FutureOr<void> _getCategories(
      GetCategoriesEvent event, Emitter<ProductState> emit) async {
    if (state is! LoadingCategoriesState) {
      emit(LoadingCategoriesState());
      final result = await NetworkRepo.getCategories();
      await result.fold(
        (failure) {
/*          categoriesList.clear();
          categoriesList.insert(0, AppConstants.all);
          selectedCategory = categoriesList.first;*/
          emit(FailGetCategoriesState(failMessage: failure.message!));
        },
        (categories) async {
          categoriesList.clear();
          newCategoriesList.clear();
          categoriesList = categories
              .map<String>(
                (cat) => cat,
              )
              .toList();
          newCategoriesList = categories
              .map<String>(
                (cat) => cat,
              )
              .toList();
          categoriesList.insert(0, AppConstants.all);
          newCategoriesList.insert(0, AppConstants.selectCategory);
          selectedCategory = categoriesList.first;
          newSelectedCategory = newCategoriesList.first;
          emit(SuccessGetCategoriesState());
        },
      );
    }
  }

  FutureOr<void> _sortProducts(
      SortProductsEvent event, Emitter<ProductState> emit) {
    selectedSortOption = event.sortOption;
    _startSortInProducts(event.sortOption);
    emit(ShowSortedProductsState(uid: event.sortOption.toString()));
  }

  FutureOr<void> _searchInProducts(
      SearchInProductsEvent event, Emitter<ProductState> emit) {
    currentSearchKey = event.searchKey;
    _startSearchInProducts();
    emit(ShowSearchedProductsState(uid: event.searchKey));
    add(SortProductsEvent(sortOption: selectedSortOption));
  }

  void _startSearchInProducts() {
    searchedProductsList = mainProductsList.where(
      (product) {
        return product.title!
                .toLowerCase()
                .startsWith(currentSearchKey.toLowerCase()) ||
            product.price!
                .toString()
                .toLowerCase()
                .startsWith(currentSearchKey.toLowerCase()) ||
            product.description!
                .toLowerCase()
                .startsWith(currentSearchKey.toLowerCase());
      },
    ).toList();
  }

  void _startSortInProducts(SortOption sortOption) {
    switch (sortOption) {
      case SortOption.priceLowToHigh:
        {
          searchedProductsList.sort(
            (p1, p2) {
              return p1.price!.compareTo(p2.price!.toInt());
            },
          );
          break;
        }
      case SortOption.priceHighToLow:
        {
          searchedProductsList.sort(
            (p1, p2) {
              return p2.price!.compareTo(p1.price!.toInt());
            },
          );
          break;
        }
      case SortOption.nameAToZ:
        {
          searchedProductsList.sort(
            (p1, p2) {
              return p1.title!.compareTo(p2.title!);
            },
          );
          break;
        }
      case SortOption.nameZToA:
        {
          searchedProductsList.sort(
            (p1, p2) {
              return p2.title!.compareTo(p1.title!);
            },
          );
          break;
        }
    }
  }

  FutureOr<void> _loadMoreProducts(
      LoadMoreProductsEvent event, Emitter<ProductState> emit) async {
    if (state is! LoadingMoreProductsState) {
      emit(LoadingMoreProductsState());
      currentLimit += pageSize;
      final result =
          await _handleFilteredProductDataRequest(category: event.category);
      await result.fold(
        (failure) {
          currentLimit -= pageSize;
          emit(FailLoadMoreProductsState(failMessage: failure.message!));
        },
        (productsModelsList) async {
          if (productsModelsList.length - mainProductsList.length < pageSize) {
            isMoreProducts = false;
          }
          mainProductsList = productsModelsList
              .map<Product>(
                (productModel) => productModel.toEntity(),
              )
              .toList();
          searchedProductsList = productsModelsList
              .map<Product>(
                (productModel) => productModel.toEntity(),
              )
              .toList();
          add(SearchInProductsEvent(searchKey: currentSearchKey));
          emit(SuccessLoadMoreProductsState());
        },
      );
    }
  }

  Future<Either<Failure, List<ProductModel>>> _handleFilteredProductDataRequest(
      {required String category}) async {
    Either<Failure, List<ProductModel>> result;
    if (category == AppConstants.all) {
      result = await NetworkRepo.getAllProducts(limit: currentLimit);
    } else {
      result = await NetworkRepo.getFilteredProductsByCategory(
          limit: currentLimit, category: category);
    }

    return result;
  }

  FutureOr<void> _changeNewProductsCategory(
      ChangeNewProductsCategoryEvent event, Emitter<ProductState> emit) {
    newSelectedCategory = event.category;

    emit(NewSelectedCategoryChangedState(uid: event.category));
  }

  FutureOr<void> _pickProductImage(
      PickProductImageEvent event, Emitter<ProductState> emit) async {
    if (state is! LoadingProductImageState) {
      emit(LoadingProductImageState());
      final pickResult = await pickImage(source: event.source);
      await pickResult.fold(
        (failure) {
          emit(FailPickProductImageState(failMessage: failure.message!));
        },
        (imagePath) async {
          productImagePath = imagePath;
          emit(SuccessPickProductImageState());
        },
      );
    }
  }

  FutureOr<void> _resetAddProduct(
      ResetAddProductEvent event, Emitter<ProductState> emit) {
    productImagePath = '';
    newSelectedCategory = AppConstants.selectCategory;
  }

  FutureOr<void> _addProduct(
      AddProductEvent event, Emitter<ProductState> emit) async {
    if (newSelectedCategory == AppConstants.selectCategory) {
      emit(FailAddProductState(
          failMessage: AppStrings.productCategoryIsRequired,
          uid: state.hashCode.toString()));
    } else if (productImagePath.isEmpty) {
      emit(FailAddProductState(
          failMessage: AppStrings.productImageIsRequired,
          uid: state.hashCode.toString()));
    } else if (state is! WaitingAddProductState) {
      emit(WaitingAddProductState());
      final uploadProductImageResult = await NetworkRepo.uploadProductImage(
          imagePath: productImagePath,
          imageStoragePath: DependencyInjector.instance<Uuid>().v4());
      await uploadProductImageResult.fold(
        (failure) {
          emit(FailAddProductState(
            failMessage: failure.message!,
            uid: state.hashCode.toString(),
          ));
        },
        (productImageUrl) async {
          final newProduct = Product(
            id: -1,
            title: event.name,
            price: int.parse(event.price),
            category: newSelectedCategory,
            image: productImageUrl,
            rating: Rating(rate: 1.0, count: 100),
            description: event.description,
          );
          final addProductResult =
              await NetworkRepo.addNewProduct(newProduct: newProduct);
          addProductResult.fold(
            (failure) {
              emit(FailAddProductState(
                  failMessage: failure.message!,
                  uid: state.hashCode.toString()));
            },
            (productModel) {
              addedProductsList.add(productModel.toEntity());
              if (selectedCategory == productModel.category ||
                  selectedCategory == AppConstants.all) {
                mainProductsList.add(productModel.toEntity());
                add(SearchInProductsEvent(searchKey: currentSearchKey));
              }
              emit(SuccessAddProductState());
            },
          );
        },
      );
    }
  }
}
