
import 'package:chat_app/core/utils/extensions/context_extension.dart';
import 'package:chat_app/core/utils/theme/app_color.dart';
import 'package:chat_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
    CustomButton( {this.onTap,required this.text,super.key});
    final VoidCallback? onTap;
   final String text;
   @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: context.height*.017),
      ),
      onPressed: onTap,
      child:Text(text,style: AppTextStyle.grey16BoldCaros,),
    );
  }
}
