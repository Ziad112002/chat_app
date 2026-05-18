// import 'package:chat_app/core/utils/extensions/context_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class SocialLoginButton extends StatelessWidget {
//   SocialLoginButton(
//       {super.key,
//       required this.imagePath,
//       this.isLight,
//       this.borderColor,
//       this.backgroundColor});
//   final String imagePath;
//   final bool? isLight;
//   final Color? borderColor;
//   final Color? backgroundColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return buildCircleAvatar(context);
//   }
//
//   CircleAvatar buildCircleAvatar(BuildContext context) {
//     return CircleAvatar(
//       backgroundColor: borderColor ?? context.secondaryColor,
//       radius: 21,
//       child: CircleAvatar(
//         backgroundColor: backgroundColor ?? context.surfaceColor,
//         radius: 20,
//         child: SvgPicture.asset(
//           imagePath,
//           colorFilter: isLight == true && isLight != null
//               ? ColorFilter.mode(
//                   Colors.black,
//                   BlendMode.srcIn,
//                 )
//               : null,
//         ),
//       ),
//     );
//   }
// }
