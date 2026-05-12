// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/constant.dart';
import 'package:chat_app/core/utils/app_assets.dart';
import 'package:chat_app/core/utils/extensions/context_extension.dart';
import 'package:chat_app/core/utils/extensions/double_extension.dart';
import 'package:chat_app/core/utils/theme/app_color.dart';
import 'package:chat_app/core/utils/theme/app_text_style.dart';
import 'package:chat_app/features/auth/presentation/login/widgets/social_login_button.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/signup_page.dart';
import 'package:chat_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../helper/show_snack_bar.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/highlighted_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: context.width*.064),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text.rich(
                    TextSpan(style: context.textTheme.headlineMedium, children: [
                      WidgetSpan(child: HighlightedText(text: "Log in")),
                      TextSpan(
                        text: ' to Chatbox', // Unstyled text
                      )
                    ]),
                    textAlign: TextAlign.center,
                  ),
                  (context.height * .019).verticalSpace(),
                  Text(
                    "Welcome back! Sign in using your social\naccount or email to continue us",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.grey14BookCircular,
                  ),
                  (context.height * .037).verticalSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialLoginButton(
                        imagePath: AppAssets.facebookIcon,
                      ),
                      (context.width * .053).horizontalSpace(),
                      SocialLoginButton(
                        imagePath: AppAssets.googleIcon,
                      ),
                      (context.width * .053).horizontalSpace(),
                      SocialLoginButton(
                        isLight: Theme.of(context).brightness == Brightness.light,
                        imagePath: AppAssets.appleIcon,
                      ),
                    ],
                  ),
                  (context.height * .037).verticalSpace(),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: AppColor.grey,
                      )),
                      (context.width * .042).horizontalSpace(),
                      Text(
                        "OR",
                        style: AppTextStyle.grey14BookCircular,
                      ),
                      (context.width * .042).horizontalSpace(),
                      Expanded(
                          child: Divider(
                        color: AppColor.grey,
                      )),
                    ],
                  ),
                  (context.height * .037).verticalSpace(),
                  CustomTextFormField(
                    label: "Your email",
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  (context.height * .037).verticalSpace(),
                  CustomTextFormField(
                    label: "Password",
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  (context.height * .218).verticalSpace(),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser();
                          showSnackBar(context, 'welcome! to our chat');
                          Navigator.pushNamed(context, ChatPage.id,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(context, 'user-not-found');
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context, 'wrong-password');
                          }
                        } catch (e) {
                          showSnackBar(context, 'there is an error, try later!');
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                    text: 'Log in',
                  ),

                  TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, SignupPage.id);
                    },
                    child: const Text(
                      "Forgot password?",
                      style: AppTextStyle.lightGreen14MediumCircular,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
