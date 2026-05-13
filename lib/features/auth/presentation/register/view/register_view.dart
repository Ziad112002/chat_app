// there is a bug in text field

import 'package:chat_app/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/utils/extensions/double_extension.dart';
import '../../../../../core/utils/theme/app_text_style.dart';
import '../../widgets/highlighted_text.dart';
import '../../../../../helper/show_snack_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../../../../pages/chat_page.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'SignupPage';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
            padding: EdgeInsets.symmetric(horizontal: context.width * .064),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Text.rich(
                      TextSpan(
                          style: context.textTheme.headlineMedium,
                          children: [
                            TextSpan(
                              text: 'Sign up with ',
                            ),
                            WidgetSpan(child: HighlightedText(text: "Email"))
                          ]),
                      textAlign: TextAlign.center,
                    ),
                    (context.height * .019).verticalSpace(),
                    Text(
                      "Get chatting with friends and family today\nby signing up for our chat app!",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.grey14BookCircular,
                    ),
                    (context.height * .074).verticalSpace(),
                    CustomTextFormField(
                      label: "Your name",
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    (context.height * .028).verticalSpace(),
                    CustomTextFormField(
                      label: "Your email",
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    (context.height * .028).verticalSpace(),
                    CustomTextFormField(
                      label: 'Password',
                      onChanged: (data) {
                        password = data;
                      },
                    ),
                    (context.height * .028).verticalSpace(),
                    CustomTextFormField(
                      label: 'Confirm Password',
                      onChanged: (data) {
                        password = data;
                      },
                    ),
                    (context.height * .15).verticalSpace(),
                    CustomButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await signupUser();
                            showSnackBar(
                                context, "Success, we're happy to have you");
                            Navigator.pushNamed(context, ChatPage.id,
                                arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(context, 'weak-password');
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(context, 'email-already-in-use');
                            }
                          } catch (e) {
                            showSnackBar(context, e.toString());
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                      },
                      text: 'Sign up',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signupUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
