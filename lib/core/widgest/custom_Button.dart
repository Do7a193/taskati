import 'package:flutter/material.dart';
import 'package:taskati/core/utils/appcolors.dart';
import 'package:taskati/core/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.width,
      this.height,
      required this.text,
      required this.onPressed});

  final double? width;
  final double? height;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? 250,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Appcolors.Primary),
          onPressed: onPressed,
          child: Text(
            text,
            style: getSmallTextStyle(colorFree: Appcolors.white),
          )),
    );
  }
}
