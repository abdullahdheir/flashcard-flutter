import 'package:flashcard/core/classes/tables.dart';
import 'package:flashcard/data/local/entities/language.dart';
import 'package:floor/floor.dart';

@dao
abstract class LanguageDao {
  @Query("SELECT * FROM ${FloorDatabaseTable.languageTableName}")
  Future<List<Language>> getAllLang();

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<int> insertLanguage(Language language);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateLanguage(Language language);

  @delete
  Future<int> deleteLanguage(Language language);

}
