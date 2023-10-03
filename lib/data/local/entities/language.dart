import 'package:flashcard/core/classes/tables.dart';
import 'package:floor/floor.dart';

@Entity(tableName: FloorDatabaseTable.languageTableName)
class Language {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String name;
  final String? image;

  Language(this.id, this.name, this.image);
}
