import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  bool isUppercase = true;
   CustomButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: MaterialButton(
        color: Theme.of(context).appBarTheme.backgroundColor,
        onPressed: () {
          onTap();
        },
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );

  }
}