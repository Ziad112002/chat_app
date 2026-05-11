// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/constant.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/signup_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_textfield.dart';
class LoginPage extends StatefulWidget {
   const LoginPage({super.key});
   static String id='LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool isLoading=false;
  GlobalKey<FormState>formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
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
                      'Sign in',
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
                    hintText: 'Password'
                ),
                const SizedBox(height: 15,),
                CustomButton(
                  onTap:  ()async{
                    if (formKey.currentState!.validate()) {
                      isLoading=true;
                      setState(() {

                      });
                      try {
                        await loginUser();
                        showSnackBar(context,'welcome! to our chat');
                        Navigator.pushNamed(context, ChatPage.id,arguments: email);
                      }  on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(context,'user-not-found');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context, 'wrong-password');
                        }
                      } catch (e) {
                        showSnackBar(context,'there is an error, try later!');
                      }
                      isLoading=false;
                      setState(() {

                      });
                    }else{

                    }
                  },
                  text: 'Login',),
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text (
                      "don't have account",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,

                      ),),
                    TextButton(
                      onPressed: (){
                       Navigator.pushNamed(context,SignupPage.id);
                      }
                      ,
                     child: const Text(
                       "Sign Up" ,
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


  Future<void> loginUser() async {
    UserCredential user =await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email!, password: password!
    );
  }

}

