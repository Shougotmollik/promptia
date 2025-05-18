import 'package:flutter/material.dart';

class AddPromptsButton extends StatelessWidget {
  const AddPromptsButton({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          minimumSize: Size(380, 48)),
      onPressed: onTap,
      child: Text(buttonText),
    );
  }
}
