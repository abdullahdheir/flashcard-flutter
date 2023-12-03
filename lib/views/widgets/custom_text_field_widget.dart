import 'package:flutter/material.dart';

typedef ValidatorTextField = String? Function(String? input);

class CustomTextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final ValidatorTextField? validator;
  const CustomTextFieldWidget(
      {super.key,
      required this.title,
      required this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            label: Text(title),
            floatingLabelStyle: const TextStyle(fontSize: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          style: Theme.of(context).textTheme.titleLarge,
          validator: validator,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
