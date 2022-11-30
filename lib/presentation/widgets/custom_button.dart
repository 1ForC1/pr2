import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.content,
  });
  final Function()? onPressed;
  final String content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 10,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          minimumSize: const Size(100.0, 35.0),
        ),
        onPressed: onPressed,
        child: Text(
          content,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
