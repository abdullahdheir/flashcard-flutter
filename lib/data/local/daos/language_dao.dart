import 'package:flashcard/core/classes/tables.dart';
import 'package:flashcard/data/local/entities/language.dart';
import 'package:floor/floor.dart';

@dao
abstract class LanguageDao {
  @Query("SELECT * FROM ${FloorDatabaseTable.languageTableName}")
  Future<List<Language>> getAllLang();

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<void> insertLanguage(Language language);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateLanguage(Language language);

  @delete
  Future<void> deleteLanguage(Language language);

}
