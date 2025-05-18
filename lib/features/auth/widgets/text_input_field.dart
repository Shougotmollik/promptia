import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    super.key,
    required this.labelText,
    required this.textEditingController,
    required this.errorMsg,
    required this.hintText,
    required this.prefixIcon,
    this.showToggle = false,
  });

  final String labelText;
  final String hintText;
  final TextEditingController textEditingController;
  final String errorMsg;
  final IconData prefixIcon;
  final bool showToggle;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool secureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.showToggle ? secureText : !secureText,
      controller: widget.textEditingController,
      validator: (value) => value!.isEmpty ? widget.errorMsg : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.showToggle
            ? IconButton(
                onPressed: () {
                  setState(() {
                    secureText = !secureText;
                  });
                },
                icon:
                    Icon(secureText ? Icons.visibility_off : Icons.visibility))
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            width: 2,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
