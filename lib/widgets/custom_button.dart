
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
    CustomButton( {this.onTap,required this.text,super.key});
    VoidCallback? onTap;
   String text;
   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration:const  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),

        width: 400,
        height: 40,
        child:  Center(
          child:  Text(
            text,
            style: const TextStyle(
                fontSize: 20,
                color: Color(0xff274460),
                fontFamily: 'Pacifico'
            ),),
        ),
      ),
    );
  }
}
