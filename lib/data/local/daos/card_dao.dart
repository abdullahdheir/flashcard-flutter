import 'package:flashcard/core/classes/tables.dart';
import 'package:flashcard/data/local/entities/card.dart';
import 'package:floor/floor.dart';

@dao
abstract class CardDao {
  @Query("SELECT * FROM ${FloorDatabaseTable.cardTableName}")
  Future<List<Card>> getAllLang();

  @Insert(onConflict: OnConflictStrategy.rollback)
  Future<int> insertCard(Card card);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateCard(Card card);

  @delete
  Future<int> deleteCard(Card card);

  @Query(
      "SELECT COUNT(id) FROM ${FloorDatabaseTable.cardTableName} WHERE lang_id = :id AND is_flip = false")
  Future<int?> isCompleteLearnLangCard(int id);
}
