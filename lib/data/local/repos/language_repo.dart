import 'package:flashcard/data/local/database.dart';
import 'package:flashcard/data/local/entities/language.dart';

class LanguageRepo {
  Future<int> deleteLanguage(Language language) async {
    final db = await DatabaseHelper.createDatabase();
    return await db.languageDao.deleteLanguage(language);
  }

  Future<List<Language>> getAllLang() async {
    final db = await DatabaseHelper.createDatabase();
    return await db.languageDao.getAllLang();
  }

  Future<int> insertLanguage(Language language) async {
    final db = await DatabaseHelper.createDatabase();
    return await db.languageDao.insertLanguage(language);
  }

  Future<int> updateLanguage(Language language) async {
    final db = await DatabaseHelper.createDatabase();
    return await db.languageDao.updateLanguage(language);
  }
}
