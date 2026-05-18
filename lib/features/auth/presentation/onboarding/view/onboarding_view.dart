import 'package:chat_app/core/utils/app_assets.dart';
import 'package:chat_app/core/utils/extensions/context_extension.dart';
import 'package:chat_app/core/utils/extensions/double_extension.dart';
import 'package:chat_app/core/utils/theme/app_color.dart';
import 'package:chat_app/core/utils/theme/app_text_style.dart';
import 'package:chat_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:chat_app/features/auth/presentation/widgets/or_separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/theme/app_fonts.dart';
import '../../login/view/login_view.dart';
import '../../register/view/register_view.dart';
import '../../widgets/social_auth_options.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static String id = 'OnboardingPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkBlack,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: context.width * .076),
        decoration: const BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [
              AppColor.darkBlack,
              AppColor.darkBlack,
              Color(0xFF43116A),
              Color(0xFF0A1832),
              AppColor.darkBlack,
              AppColor.darkBlack,
            ],
          ),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            (context.height * .054).verticalSpace(),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Connect\nfriends\n",
                  style: AppTextStyle.heading1
                      .copyWith(fontSize: 68, fontWeight: FontWeight.normal)),
              TextSpan(
                  text: "easily &\nquickly",
                  style: AppTextStyle.heading1.copyWith(
                      fontSize: 68, fontWeight: FontWeightManager.medium)),
            ])),
            (context.height * .019).verticalSpace(),
            Text(
              "Our chat app is the perfect way to stay\nconnected with friends and family.",
              style: AppTextStyle.grey14BookCircular
                  .copyWith(fontSize: FontSize.s16),
            ),
            (context.height * .047).verticalSpace(),
            SocialAuthOptions(
              borderColor: AppColor.white,
              backgroundColor: AppColor.darkBlack,
            ),
            (context.height * .037).verticalSpace(),
            OrSeparator(),
            (context.height * .037).verticalSpace(),
            CustomButton(
              backgroundColor: AppColor.white,
              text: "Sign up within mail",
              textStyle: AppTextStyle.grey16MediumCaros.copyWith(color: AppColor.darkBlack),
              onTap: (){
                Navigator.pushNamed(context, RegisterView.id);
              },
            ),
            Spacer(),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Existing account?",
                      style: AppTextStyle.grey14BookCircular),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,

                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginView.id);
                      },
                      child: Text(
                        "Log in",
                        style: AppTextStyle.lightGreen14MediumCircular
                            .copyWith(color: AppColor.white),
                      ),
                    ),
                  ),
                ])),
          ],
        )),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset(
        AppAssets.appIcon,
        height: context.height * .0236,
      ),
      6.0.horizontalSpace(),
      Text(
        "Chatbox",
        style: AppTextStyle.paragraph2.copyWith(color: AppColor.white),
      )
    ]);
  }
}
