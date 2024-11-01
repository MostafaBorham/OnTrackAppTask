import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:on_track_app/core/connection/connection_checker.dart';
import 'package:on_track_app/core/constants/app_keys.dart';
import 'package:on_track_app/core/constants/network_constants.dart';
import 'package:on_track_app/core/errors/failures.dart';
import 'package:on_track_app/core/services/network/dio_helper.dart';
import 'package:on_track_app/core/services/network/firebase_helper.dart';
import 'package:on_track_app/data/network/endpoints.dart';
import 'package:on_track_app/domains/entities/product.dart';
import 'package:on_track_app/domains/entities/user.dart' as u;
import 'package:on_track_app/domains/mappers/product_mapper.dart';
import 'package:on_track_app/domains/models/product_model.dart';

abstract class NetworkRepo {
  static Future<Either<Failure, List<ProductModel>>> getAllProducts(
      {required int limit}) async {
    if (await ConnectionChecker.isConnected) {
      try {
        final productsResponse = await DioHelper.getProductData(
            endPoint: NetworkEndpoints.allProductsEndpoint,
            params: {
              AppKeys.limitKey: limit,
            });
        if (productsResponse.statusCode != NetworkConstants.successStatusCode) {
          return Left(Failure(message: productsResponse.statusMessage));
        }
        final productsList = productsResponse.data.map<ProductModel>(
          (productJson) {
            return ProductModel.fromJson(productJson);
          },
        ).toList();
        return Right(productsList);
      } on DioException catch (_) {
        return Left(ServerFailure());
      } catch (ex) {
        return Left(Failure(message: ex.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, ProductModel>> getSingleProduct(
      {required int id}) async {
    if (await ConnectionChecker.isConnected) {
      try {
        final productResponse = await DioHelper.getProductData(
          endPoint: NetworkEndpoints.allProductsEndpoint + id.toString(),
        );
        if (productResponse.statusCode != NetworkConstants.successStatusCode) {
          return Left(Failure(message: productResponse.statusMessage));
        }
        final product =
            ProductModel.fromJson(productResponse.data as Map<String, dynamic>);
        return Right(product);
      } on DioException catch (_) {
        return Left(ServerFailure());
      } catch (ex) {
        return Left(Failure(message: ex.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, List<ProductModel>>> sortProductsByName(
      {required int limit, required String name}) async {
    if (await ConnectionChecker.isConnected) {
      try {
        final productsResponse = await DioHelper.getProductData(
            endPoint: NetworkEndpoints.allProductsEndpoint,
            params: {
              NetworkConstants.sortKey : name,
            });
        if (productsResponse.statusCode != NetworkConstants.successStatusCode) {
          return Left(Failure(message: productsResponse.statusMessage));
        }
        final productsList = productsResponse.data.map<ProductModel>(
          (productJson) {
            return ProductModel.fromJson(productJson);
          },
        ).toList();
        return Right(productsList);
      } on DioException catch (_) {
        return Left(ServerFailure());
      } catch (ex) {
        return Left(Failure(message: ex.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, List<String>>> getCategories() async {
    if (await ConnectionChecker.isConnected) {
      try {
        final categoriesResponse = await DioHelper.getProductData(
          endPoint: NetworkEndpoints.allCategoriesEndpoint,
        );
        if (categoriesResponse.statusCode !=
            NetworkConstants.successStatusCode) {
          return Left(Failure(message: categoriesResponse.statusMessage));
        }
        final categoriesList = categoriesResponse.data
            .map<String>(
              (cat) => cat.toString(),
            )
            .toList();
        return Right(categoriesList);
      } on DioException catch (_) {
        return Left(ServerFailure());
      } catch (ex) {
        return Left(Failure(message: ex.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, List<ProductModel>>>
      getFilteredProductsByCategory(
          {required int limit, required String category}) async {
    if (await ConnectionChecker.isConnected) {
      try {
        final productsResponse = await DioHelper.getProductData(
            endPoint: NetworkEndpoints.singleCategoryEndpoint + category,
            params: {
              AppKeys.limitKey: limit,
            });
        if (productsResponse.statusCode != NetworkConstants.successStatusCode) {
          return Left(Failure(message: productsResponse.statusMessage));
        }
        final productsList = productsResponse.data.map<ProductModel>(
          (productJson) {
            return ProductModel.fromJson(productJson);
          },
        ).toList();
        return Right(productsList);
      } on DioException catch (_) {
        return Left(ServerFailure());
      } catch (ex) {
        return Left(Failure(message: ex.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, ProductModel>> addNewProduct(
      {required Product newProduct}) async {
    if (await ConnectionChecker.isConnected) {
      try {
        final newProductResponse = await DioHelper.postProductData(
          endPoint: NetworkEndpoints.allProductsEndpoint,
          body: newProduct.toModel().toJson(),
        );
        if (newProductResponse.statusCode !=
            NetworkConstants.successStatusCode) {
          return Left(Failure(message: newProductResponse.statusMessage));
        }
        final product = ProductModel.fromJson(
            newProductResponse.data as Map<String, dynamic>);
        return Right(product);
      } on DioException catch (_) {
        return Left(ServerFailure());
      } catch (ex) {
        return Left(Failure(message: ex.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, String>> uploadProductImage({
    required String imagePath,
    required String imageStoragePath,
  }) async {
    if (await ConnectionChecker.isConnected) {
      try {
        final imageUrl = await FirebaseHelper.uploadFileToFirebaseStorage(
            storagePath:
                '${NetworkConstants.imagesFolder}/${FirebaseAuth.instance.currentUser?.uid ?? ''}/$imageStoragePath',
            filePath: imagePath);
        return Right(imageUrl);
      } on FirebaseException catch (e) {
        return Left(Failure(message: e.code));
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, void>> signUpUser({
    required u.User userInfo,
  }) async {
    if (await ConnectionChecker.isConnected) {
      try {
        await FirebaseHelper.registerUserWithEmailPassword(
            email: userInfo.email!, password: userInfo.password!);
        await FirebaseHelper.updateUser(displayName: userInfo.name);
        return const Right(null);
      } on FirebaseAuthException catch (e) {
        return Left(Failure(message: e.code));
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, void>> signInUser({
    required u.User userInfo,
  }) async {
    if (await ConnectionChecker.isConnected) {
      try {
        await FirebaseHelper.signInUserWithEmailPassword(
            email: userInfo.email!, password: userInfo.password!);
        return const Right(null);
      } on FirebaseAuthException catch (e) {
        return Left(Failure(message: e.code));
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  static Future<Either<Failure, void>> signOutUser() async {
    if (await ConnectionChecker.isConnected) {
      try {
        final logoutResult = await FirebaseHelper.logout();
        return Right(logoutResult);
      } on FirebaseAuthException catch (e) {
        return Left(Failure(message: e.code));
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
