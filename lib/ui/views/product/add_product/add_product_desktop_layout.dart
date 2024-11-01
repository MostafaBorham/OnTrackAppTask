import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class AddProductDesktopLayout extends StatefulWidget {
  const AddProductDesktopLayout({super.key});

  @override
  AddProductDesktopLayoutState createState() => AddProductDesktopLayoutState();
}

class AddProductDesktopLayoutState extends State<AddProductDesktopLayout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText('Add Product Desktop Layout',style: AppStyles.getBoldStyle(),),
    );
  }
}
