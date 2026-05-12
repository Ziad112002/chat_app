import 'package:chat_app/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButton extends StatelessWidget {
    SocialLoginButton({super.key,required this.imagePath, this.isLight});
  final String imagePath;
   final bool? isLight;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
backgroundColor: context.secondaryColor,
      radius: 21,
      child: CircleAvatar(
        backgroundColor: context.surfaceColor,
        radius: 20,
        child: SvgPicture.asset(imagePath,colorFilter:isLight==true&&isLight!=null?ColorFilter.mode(
          Colors.black,
          BlendMode.srcIn,
        ):null ,),
      ),
    );
  }
}
