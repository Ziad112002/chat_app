import 'package:chat_app/core/utils/app_assets.dart';
import 'package:chat_app/core/utils/extensions/context_extension.dart';
import 'package:chat_app/core/utils/extensions/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../login/widgets/social_login_button.dart';

class SocialAuthOptions extends StatelessWidget {
  const SocialAuthOptions({
    super.key,
    this.isLight,
    this.borderColor,
    this.backgroundColor
  });
  final bool? isLight;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        buildCircleAvatar(
          context,
          imagePath: AppAssets.facebookIcon,
        ),
        (context.width * .053).horizontalSpace(),
        buildCircleAvatar(
          context,
          imagePath: AppAssets.googleIcon,
        ),
        (context.width * .053).horizontalSpace(),
        buildCircleAvatar(
          context,
          isLight: isLight,
          imagePath: AppAssets.appleIcon,
        ),
      ],
    );
  }
  CircleAvatar buildCircleAvatar(BuildContext context,{required String imagePath, bool? isLight}) {
    return CircleAvatar(
      backgroundColor: borderColor??context.secondaryColor,
      radius: 21,
      child: CircleAvatar(
        backgroundColor: backgroundColor??context.surfaceColor,
        radius: 20,
        child: SvgPicture.asset(imagePath,colorFilter:isLight==true&&isLight!=null?ColorFilter.mode(
          Colors.black,
          BlendMode.srcIn,
        ):null ,),
      ),
    );
  }

}
