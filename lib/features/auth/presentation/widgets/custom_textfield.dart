import 'dart:ui';

import 'package:chat_app/core/utils/extensions/context_extension.dart';
import 'package:chat_app/core/utils/theme/app_color.dart';
import 'package:chat_app/core/utils/theme/app_fonts.dart';
import 'package:chat_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({required this.label, this.onChanged, super.key});
  final String label;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .0714,
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          }
          return null;
        },
        onChanged: onChanged,
        style: context.textTheme.headlineSmall!
            .copyWith(fontWeight: FontWeightManager.book),
        textInputAction: TextInputAction.done,
        selectionHeightStyle: BoxHeightStyle.max,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle:WidgetStateTextStyle.resolveWith(
                  (state) {
                if(state.contains(WidgetState.error)) return AppTextStyle.lightGreen14MediumCircular.copyWith(color: AppColor.red);
                return AppTextStyle.lightGreen14MediumCircular;
              }) ,
          errorStyle: AppTextStyle.grey12BookCircular.copyWith(
            color: AppColor.red,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.red),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.red),
          ),
        ),
      ),
    );
  }
}
