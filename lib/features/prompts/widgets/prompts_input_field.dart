import 'package:flutter/material.dart';

class PromptsInputField extends StatefulWidget {
  const PromptsInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPrompts = false,
    required this.validator,
  });

  final String hintText;
  final TextEditingController controller;
  final bool isPrompts;
  final FormFieldValidator<String>? validator;

  @override
  State<PromptsInputField> createState() => _PromptsInputFieldState();
}

class _PromptsInputFieldState extends State<PromptsInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: widget.hintText,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),
      maxLength: widget.isPrompts ? 500 : 50,
      minLines: widget.isPrompts ? 7 : 1,
      maxLines: widget.isPrompts ? 14 : 1,
    );
  }
}
