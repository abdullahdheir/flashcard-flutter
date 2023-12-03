// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  LanguageDao? _languageDaoInstance;

  CardDao? _cardDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `languages` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `image` TEXT, `code` TEXT NOT NULL, `compositeKey` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cards` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `question` TEXT NOT NULL, `answer` TEXT NOT NULL, `is_flip` INTEGER NOT NULL, `lang_id` INTEGER NOT NULL, FOREIGN KEY (`lang_id`) REFERENCES `languages` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  LanguageDao get languageDao {
    return _languageDaoInstance ??= _$LanguageDao(database, changeListener);
  }

  @override
  CardDao get cardDao {
    return _cardDaoInstance ??= _$CardDao(database, changeListener);
  }
}

class _$LanguageDao extends LanguageDao {
  _$LanguageDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _languageInsertionAdapter = InsertionAdapter(
            database,
            'languages',
            (Language item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'code': item.code,
                  'compositeKey': item.compositeKey
                }),
        _languageUpdateAdapter = UpdateAdapter(
            database,
            'languages',
            ['id'],
            (Language item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'code': item.code,
                  'compositeKey': item.compositeKey
                }),
        _languageDeletionAdapter = DeletionAdapter(
            database,
            'languages',
            ['id'],
            (Language item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'code': item.code,
                  'compositeKey': item.compositeKey
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Language> _languageInsertionAdapter;

  final UpdateAdapter<Language> _languageUpdateAdapter;

  final DeletionAdapter<Language> _languageDeletionAdapter;

  @override
  Future<List<Language>> getAllLang() async {
    return _queryAdapter.queryList('SELECT * FROM languages',
        mapper: (Map<String, Object?> row) => Language(
            id: row['id'] as int?,
            name: row['name'] as String,
            image: row['image'] as String?,
            code: row['code'] as String));
  }

  @override
  Future<int> insertLanguage(Language language) {
    return _languageInsertionAdapter.insertAndReturnId(
        language, OnConflictStrategy.rollback);
  }

  @override
  Future<int> updateLanguage(Language language) {
    return _languageUpdateAdapter.updateAndReturnChangedRows(
        language, OnConflictStrategy.replace);
  }

  @override
  Future<int> deleteLanguage(Language language) {
    return _languageDeletionAdapter.deleteAndReturnChangedRows(language);
  }
}

class _$CardDao extends CardDao {
  _$CardDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _cardInsertionAdapter = InsertionAdapter(
            database,
            'cards',
            (Card item) => <String, Object?>{
                  'id': item.id,
                  'question': item.question,
                  'answer': item.answer,
                  'is_flip': item.isFlip ? 1 : 0,
                  'lang_id': item.langId
                }),
        _cardUpdateAdapter = UpdateAdapter(
            database,
            'cards',
            ['id'],
            (Card item) => <String, Object?>{
                  'id': item.id,
                  'question': item.question,
                  'answer': item.answer,
                  'is_flip': item.isFlip ? 1 : 0,
                  'lang_id': item.langId
                }),
        _cardDeletionAdapter = DeletionAdapter(
            database,
            'cards',
            ['id'],
            (Card item) => <String, Object?>{
                  'id': item.id,
                  'question': item.question,
                  'answer': item.answer,
                  'is_flip': item.isFlip ? 1 : 0,
                  'lang_id': item.langId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Card> _cardInsertionAdapter;

  final UpdateAdapter<Card> _cardUpdateAdapter;

  final DeletionAdapter<Card> _cardDeletionAdapter;

  @override
  Future<List<Card>> getAllLang() async {
    return _queryAdapter.queryList('SELECT * FROM cards',
        mapper: (Map<String, Object?> row) => Card(row['id'] as int?,
            question: row['question'] as String,
            answer: row['answer'] as String,
            isFlip: (row['is_flip'] as int) != 0,
            langId: row['lang_id'] as int));
  }

  @override
  Future<int?> isCompleteLearnLangCard(int id) async {
    return _queryAdapter.query(
        'SELECT COUNT(id) FROM cards WHERE lang_id = ?1 AND is_flip = false',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int> insertCard(Card card) {
    return _cardInsertionAdapter.insertAndReturnId(
        card, OnConflictStrategy.rollback);
  }

  @override
  Future<int> updateCard(Card card) {
    return _cardUpdateAdapter.updateAndReturnChangedRows(
        card, OnConflictStrategy.replace);
  }

  @override
  Future<int> deleteCard(Card card) {
    return _cardDeletionAdapter.deleteAndReturnChangedRows(card);
  }
}
