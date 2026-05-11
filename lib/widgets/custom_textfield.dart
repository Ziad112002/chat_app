import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
   CustomTextFormField( { required this.hintText, this.onChanged,super.key});
  String hintText;
  Function(String)?onChanged;


  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (data){
        if(data!.isEmpty){
          return 'field is required';
        }
      },
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
          enabledBorder:const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),

          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.white
          )
      ),
    );
  }
}
