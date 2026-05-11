// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'chat_page.dart';
// ignore: must_be_immutable
class SignupPage extends StatefulWidget {
    const SignupPage({super.key});
   static String id='SignupPage';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
   String? email;

   String? password;

   bool isLoading=false;

   GlobalKey<FormState>formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(

      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body:SafeArea(
         child: Form(
          key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 100,),
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 100,
                  ),
                 const Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        'Scholar Chat',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Pacifico'
                        ),),
                    ],
                  ),
                  const SizedBox(height: 80,),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Pacifico'
                        ),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFormField(
                  onChanged:(data){
                    email=data;
                  },
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFormField(
                    onChanged:(data){
                      password=data;
                    },
                     hintText: 'Password',
                      ),
                  const SizedBox(height: 15,),
                   CustomButton(
                     onTap: ()async{
                      if (formKey.currentState!.validate()) {
                        isLoading=true;
                        setState(() {

                        });
                        try {
                          await signupUser();
                          showSnackBar(context,"Success, we're happy to have you");
                          Navigator.pushNamed(context, ChatPage.id,arguments: email);

                        }  on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBar(context,'weak-password');
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context, 'email-already-in-use');
                          }
                        } catch (e) {
                          showSnackBar(context,e.toString());
                        }
                        isLoading=false;
                        setState(() {

                        });
                      }else{

                      }

                     },
                     text: 'Sign up',
                   ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text (
                        "already have an account?",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,

                        ),),
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }
                        ,
                        child: const Text(
                          "Sign In" ,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.blue,

                          ),
                        ),

                      ),
                    ],
                  ),
                ],
              ),
         ),

          ),

      ),
    );
  }


  Future<void> signupUser() async {
     UserCredential user =await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: email!, password: password!
    );
  }
}
