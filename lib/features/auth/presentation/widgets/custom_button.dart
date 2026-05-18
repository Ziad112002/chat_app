
import 'package:chat_app/core/utils/extensions/context_extension.dart';
import 'package:chat_app/core/utils/theme/app_color.dart';
import 'package:chat_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
    CustomButton( {this.onTap,required this.text, this.backgroundColor,this.textStyle, super.key});
    final VoidCallback? onTap;
   final String text;
   final Color? backgroundColor;
   final TextStyle? textStyle;
   @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor?? (context.isLightMode?AppColor.lightGrey:AppColor.lightBlack),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(vertical: context.height*.017),
      ),
      onPressed: onTap,
      child:Text(text,style: textStyle??AppTextStyle.grey16BoldCaros,),
    );
  }
}
