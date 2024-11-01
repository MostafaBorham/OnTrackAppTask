import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class ProductDataInputField extends StatelessWidget {
  ProductDataInputField({super.key,required this.controller,this.obsecureText=false,this.label,this.enabled,this.hint,this.prefix,this.suffix,this.inputType,this.validator,this.maxLength,this.maxLines,this.minLines,this.inputFormatters,this.onChanged});

  bool? enabled;
  bool? obsecureText;
  String? label;
  String? hint;
  int? maxLength;
  int? maxLines;
  int? minLines;
  Widget? prefix;
  Widget? suffix;
  TextInputType? inputType;
  FormFieldValidator<String>? validator;
  TextEditingController controller;
  List<TextInputFormatter>? inputFormatters;
  ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText!,
      inputFormatters: inputFormatters,
      validator: validator,
      autovalidateMode: AutovalidateMode.always,
      onChanged: onChanged,
      maxLength: maxLength,
      maxLines: maxLines??1,
      minLines: minLines??1,
      cursorWidth: 2,
      style: AppStyles.getSemiBoldStyle(color: Theme.of(context).colorScheme.onPrimaryFixed,fontSize: 20.s()),
      cursorColor: Theme.of(context).colorScheme.surface,
      cursorErrorColor: Theme.of(context).colorScheme.error,
      keyboardType: inputType?? TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: suffix,
        hintText: hint?.tr(),
        hintStyle: AppStyles.getSemiBoldStyle(color: Theme.of(context).colorScheme.onSurface,fontSize: 20.s()),
        enabled: enabled??true,
        enabledBorder: _buildOutlineInputBorder(Theme.of(context).colorScheme.onPrimaryFixed),
        border: _buildOutlineInputBorder(Theme.of(context).colorScheme.surface),
        focusedBorder: _buildOutlineInputBorder(Theme.of(context).colorScheme.surface),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(Color borderColor) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.s()),
        borderSide: BorderSide(
          color: borderColor,
          width:2,
        )
    );
  }
}