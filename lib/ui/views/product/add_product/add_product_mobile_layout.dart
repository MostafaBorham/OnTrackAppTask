import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_track_app/controllers/product/product_bloc.dart';
import 'package:on_track_app/core/constants/app_constants.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/core/utils/validation.dart';
import 'package:on_track_app/ui/components/toasts.dart';
import 'package:on_track_app/ui/resources/app_colors.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';
import 'package:on_track_app/ui/widgets/categories_dropdown.dart';
import 'package:on_track_app/ui/widgets/circular_loader.dart';
import 'package:on_track_app/ui/widgets/product_data_input_field.dart';

class AddProductMobileLayout extends StatefulWidget {
  const AddProductMobileLayout({super.key});

  @override
  AddProductMobileLayoutState createState() => AddProductMobileLayoutState();
}

class AddProductMobileLayoutState extends State<AddProductMobileLayout> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.tertiary,
          padding: EdgeInsetsDirectional.only(end: 15.w()),
          height: 70.w(),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.maybePop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).colorScheme.surface,
                  )),
              const SizedBox(
                width: 20,
              ),
              AutoSizeText(
                AppStrings.addProduct,
                style: AppStyles.getBoldStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 20.s()),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  ProductDataInputField(
                    controller: _nameController,
                    validator: AppValidation.validateProductName,
                    maxLength: 30,
                    hint: AppStrings.addProductName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6,
                        child: ProductDataInputField(
                          controller: _priceController,
                          validator: AppValidation.validateProductPrice,
                          inputType: TextInputType.number,
                          maxLength: 10,
                          hint: AppStrings.addProductPrice,
                          suffix: Icon(
                            Icons.attach_money,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 5,
                          child: Container(
                              alignment: AlignmentDirectional.center,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      width: 2,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryFixed)),
                              child: BlocBuilder<ProductBloc, ProductState>(
                                builder: (context, state) {
                                  return CategoriesDropdown(
                                    categories: ProductBloc.get(context)
                                        .newCategoriesList,
                                    selectedCategory: ProductBloc.get(context)
                                        .newSelectedCategory,
                                    addIconLabelToListTitle: true,
                                    onCategoryChanged: (category) {
                                      ProductBloc.get(context).add(
                                          ChangeNewProductsCategoryEvent(
                                              category: category ??
                                                  AppConstants.selectCategory));
                                    },
                                  );
                                },
                              ))),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProductDataInputField(
                    controller: _descriptionController,
                    validator: AppValidation.validateProductDescription,
                    hint: AppStrings.addProductDescription,
                    maxLines: 5,
                    minLines: 5,
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            ProductBloc.get(context).add(PickProductImageEvent(
                                source: ImageSource.gallery));
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                  radius: 50.s(),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryFixed,
                                  backgroundImage: ProductBloc.get(context)
                                          .productImagePath
                                          .isNotEmpty
                                      ? FileImage(
                                          File(ProductBloc.get(context)
                                              .productImagePath),
                                        )
                                      : null,
                                  child: ProductBloc.get(context)
                                          .productImagePath
                                          .isEmpty
                                      ? Icon(
                                          Icons.camera_alt_rounded,
                                          size: 40.s(),
                                        )
                                      : null),
                              const SizedBox(height: 8),
                              Text(
                                AppStrings.uploadImage,
                                style: AppStyles.getSemiBoldStyle(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    fontSize: 15.s()),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocConsumer<ProductBloc, ProductState>(
                    listener: (context, state) {
                      if (state is FailAddProductState) {
                        showErrorToast(
                            context: context, message: state.failMessage);
                      }
                      if (state is SuccessAddProductState) {
                        Navigator.of(context).maybePop();
                      }
                    },
                    builder: (context, state) {
                      return state is WaitingAddProductState
                          ? CircularLoader(size: 25.s(),color: Theme.of(context).colorScheme.surface,)
                          : ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ProductBloc.get(context).add(AddProductEvent(
                                    name: _nameController.text,
                                    price: _priceController.text,
                                    description: _descriptionController.text,
                                  ));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.surface,
                                  side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    width: 3,
                                  ),
                                  elevation: 10,
                                  padding:
                                      EdgeInsets.symmetric(vertical: 20.w())),
                              child: Text(AppStrings.saveAndPublish,
                                  style: AppStyles.getBoldStyle(
                                      color: AppColors.white,
                                      fontSize: 15.s())),
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
