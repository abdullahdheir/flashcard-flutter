import 'package:flashcard/data/local/entities/language.dart';
import 'package:flashcard/data/local/repos/language_repo.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  final _langRepo = LanguageRepo();

  List<Language> languagesList = [];

  MainProvider() {
    _initializeLanguagesList();
  }
  Future<void> refreshLanguagesList() async {
    _initializeLanguagesList();
  }

  Future<void> _initializeLanguagesList() async {
    languagesList = await _langRepo.getAllLang();
    notifyListeners(); // Notify listeners that the data has been loaded
  }
}
