import 'package:flashcard/core/classes/tables.dart';
import 'package:flashcard/data/local/entities/language.dart';
import 'package:floor/floor.dart';


@Entity(tableName: FloorDatabaseTable.cardTableName, foreignKeys: [
  ForeignKey(
    childColumns: ['lang_id'],
    parentColumns: ['id'],
    entity: Language,
  ),
])
class Card {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String question;
  final String answer;
  @ColumnInfo(name: "is_flip")
  final bool isFlip;
  @ColumnInfo(name: "lang_id")
  final int langId;

  Card(this.id, this.question, this.answer, this.langId, this.isFlip);
}
