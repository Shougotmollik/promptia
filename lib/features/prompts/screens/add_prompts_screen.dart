import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompita/features/prompts/controller/prompts_controller.dart';
import 'package:prompita/features/prompts/widgets/add_prompts_button.dart';
import 'package:prompita/features/prompts/widgets/prompts_input_field.dart';

class AddPromptsScreen extends StatefulWidget {
  const AddPromptsScreen({super.key});

  @override
  State<AddPromptsScreen> createState() => _AddPromptsScreenState();
}

class _AddPromptsScreenState extends State<AddPromptsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _promptsTitleTEController =
      TextEditingController();
  final TextEditingController _promptsTEController = TextEditingController();

  final PromptsController controller = Get.put(PromptsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promptia'),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 18,
              children: [
                PromptsInputField(
                  hintText: 'Enter Your Prompts Title',
                  controller: _promptsTitleTEController,
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'The field must be 10 characters long'
                      : null,
                ),
                PromptsInputField(
                  hintText: 'Enter Your Prompts ...',
                  controller: _promptsTEController,
                  isPrompts: true,
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'The field must be 20 characters long'
                      : null,
                ),
                Obx(
                  () => AddPromptsButton(
                      onTap: _addButton,
                      buttonText: controller.isLoading.value
                          ? 'Loading...'
                          : 'Add Prompts'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addButton() {
    if (_formKey.currentState!.validate() &&
        controller.isLoading.value == false) {
      controller.createPrompt(
        _promptsTitleTEController.text,
        _promptsTEController.text,
      );
    }
  }

  @override
  void dispose() {
    _promptsTitleTEController.dispose();
    _promptsTEController.dispose();
    super.dispose();
  }
}
