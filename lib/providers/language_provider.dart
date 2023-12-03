import 'package:flashcard/core/routes/navigator.dart';
import 'package:flashcard/data/local/entities/language.dart';
import 'package:flashcard/data/local/repos/language_repo.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController languageNameContoller = TextEditingController();
  TextEditingController languageCodeContoller = TextEditingController();
  final _languageRepo = LanguageRepo();
  var isLoading = false;

  setIsLoading({bool value = true}) {
    isLoading = value;
    notifyListeners();
  }

  submitForm() async {
    setIsLoading();
    if (formKey.currentState!.validate()) {
      final languageName = languageNameContoller.text;
      final languageCode = languageCodeContoller.text;
      await _languageRepo
          .insertLanguage(Language(name: languageName, code: languageCode));
      setIsLoading(value: false);
      languageNameContoller.clear();
      languageCodeContoller.clear();
      AppRoute.back();
    } else {
      print("Can't submit form");
    }
  }
}
