import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class AddProductTabletLayout extends StatefulWidget {
  const AddProductTabletLayout({super.key});

  @override
  AddProductTabletLayoutState createState() => AddProductTabletLayoutState();
}

class AddProductTabletLayoutState extends State<AddProductTabletLayout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText('Add Product Tablet Layout',style: AppStyles.getBoldStyle(),),
    );
  }
}
