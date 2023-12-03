import 'package:flashcard/core/classes/tables.dart';
import 'package:floor/floor.dart';

@Entity(tableName: FloorDatabaseTable.languageTableName)
class Language {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final String? image;
  final String code;
  // Combine 'id' and 'name' to form a composite primary key
  @PrimaryKey(autoGenerate: false)
  final String compositeKey;

  Language({this.id, required this.name, this.image, required this.code})
      : compositeKey = '$id$name';
}
