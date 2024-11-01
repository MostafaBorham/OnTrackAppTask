import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/ui/resources/app_colors.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class CategoriesDropdown extends StatelessWidget {
  const CategoriesDropdown({super.key, required this.categories, required this.selectedCategory, this.onCategoryChanged, this.addIconLabelToListTitle=false});

  final List<String> categories;
  final String selectedCategory;
  final bool? addIconLabelToListTitle;
  final ValueChanged<String?>? onCategoryChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      style: AppStyles.getBoldStyle(
          color: AppColors.white,
          fontSize: 15.s()
      ),
      icon: Icon(Icons.arrow_drop_down_circle,color: Theme.of(context).colorScheme.surface,),
      underline: const SizedBox(),
      value: selectedCategory,
      padding: EdgeInsets.zero,
      dropdownColor: Theme.of(context).colorScheme.surface,
      elevation: 10,
      selectedItemBuilder: (BuildContext context) {
        return categories.map((String item) {
          return Align(
            alignment: AlignmentDirectional.centerStart,
            child: AutoSizeText(
              item,
              style: AppStyles.getBoldStyle(
                color: Theme.of(context).colorScheme.onPrimaryFixed,
                fontSize: 15.s()
              ),
            ),
          );
        }).toList();
      },
      items: categories
          .map<DropdownMenuItem<String>>(
            (category) => DropdownMenuItem(
            value: category, child: Row(
              children: [
                AutoSizeText(category,),
                addIconLabelToListTitle! && category==categories.first? Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.w()),
                  child: const Icon(Icons.arrow_downward,color: AppColors.white,),
                ) : const SizedBox()
              ],
            )),
      )
          .toList(),
      onChanged: onCategoryChanged,
    );
  }
}
