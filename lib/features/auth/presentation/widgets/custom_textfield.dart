import 'package:chat_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
    CustomTextFormField( {required this.label, this.onChanged,super.key});
  final String label;
  final Function(String)?onChanged;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
          validator: (data){
            if(data!.isEmpty){
              return 'field is required';
            }
            return null;
          },
          onChanged: onChanged,
      maxLines: 2,
          style: const TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
            label: Text(label),
              labelStyle: AppTextStyle.lightGreen14MediumCircular,
              hintStyle: const TextStyle(
                  color: Colors.white
              )
          ),
        );


  }
}
