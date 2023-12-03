import 'package:flashcard/providers/language_provider.dart';
import 'package:flashcard/views/widgets/custom_text_field_widget.dart';
import 'package:flashcard/views/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddLanguageScreen extends StatelessWidget {
  const AddLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add New Language"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Form(
          key: Provider.of<LanguageProvider>(context).formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CustomTextFieldWidget(
                  title: "Language Name",
                  controller: Provider.of<LanguageProvider>(context)
                      .languageNameContoller,
                  validator: (input) {
                    if (input!.isEmpty) return "This field is required";
                    return null;
                  },
                ),
                CustomTextFieldWidget(
                  title: "Language Code",
                  controller: Provider.of<LanguageProvider>(context)
                      .languageCodeContoller,
                  validator: (input) {
                    if (input!.isEmpty) return "This field is required";
                    return null;
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Consumer<LanguageProvider>(
                    builder: (ctx, p, w) => ElevatedButton(
                      onPressed: () {
                        p.submitForm();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                      ),
                      child: p.isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Add",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
