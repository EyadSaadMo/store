import 'package:flutter/material.dart';

class CustomTF extends StatelessWidget {
  final TextInputType textInputType;
  Widget? suffixIcon;
  String? hintText;
  Function? onChange;
  CustomTF({Key? key, required this.textInputType,this.suffixIcon,this.hintText,this.onChange}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  TextField(
      onChanged: (value){onChange;},
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: textInputType,
      decoration: InputDecoration(
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(style: BorderStyle.none),
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,hintStyle: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}