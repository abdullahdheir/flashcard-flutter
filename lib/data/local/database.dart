import 'dart:async';
import 'package:flashcard/data/local/entities/card.dart';
import 'package:flashcard/data/local/entities/language.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


import 'package:flashcard/data/local/daos/card_dao.dart';
import 'package:flashcard/data/local/daos/language_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Language, Card])
abstract class AppDatabase  extends FloorDatabase {
  LanguageDao get languageDao;
  CardDao get cardDao;
}

class DatabaseHelper {
  static Future<AppDatabase> createDatabase() async {
    final database = await $FloorFlutterDatabase
        .databaseBuilder('app_database.db')
        .build();
    return database;
  }
}
