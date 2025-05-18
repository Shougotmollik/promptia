import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prompita/common/model/prompt_model.dart';
import 'package:prompita/utils/helper.dart';
import 'package:prompita/utils/widgets_constant.dart';

class PromptCard extends StatefulWidget {
  final PromptModel prompt;
  const PromptCard({super.key, required this.prompt});

  @override
  State<PromptCard> createState() => _PromptCardState();
}

class _PromptCardState extends State<PromptCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.prompt.user!.metadata!.name!,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              formatDateTime(widget.prompt.createdAt!),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing:
                IconButton(onPressed: _copyButton, icon: Icon(Icons.copy)),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.prompt.title!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.prompt.prompt!,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _copyButton() {
    Clipboard.setData(ClipboardData(text: widget.prompt.prompt!));
    getSnack('Woo!', 'Your Prompt copied!');
  }
}
