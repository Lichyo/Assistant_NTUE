import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:assistant/models/note/note.dart';

class NoteDB {
  static final NoteDB instance = NoteDB._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB('note.db'); // 內部資料夾
    return _database!;
  }

  Future<Database> initDB(String filePath) async {
    final dbPath = await getDatabasesPath(); // OS內建資料夾
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    await db.execute(''' CREATE TABLE $noteTable ( 
  ${NoteField.id} $idType, 
  ${NoteField.title} $textType,
  ${NoteField.description} $textType,
  ${NoteField.subject} $textType,
  ${NoteField.deadTime} $textType
  )
''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;
    final id = await db.insert(noteTable, note.toJson());
    return note.copy(id: id);
  }

  Future<Note> readNote(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      noteTable,
      columns: NoteField.values,
      where: '${NoteField.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw ('Id $id not found');
    }
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    const orderBy = '${NoteField.deadTime} ASC';
    final result = await db.query(noteTable, orderBy: orderBy);
    return result
        .map((json) => Note.fromJson(json))
        .toList(); // where i s the json
  }

  Future<int> update(Note note) async {
    // why int?
    final db = await instance.database;
    return db.update(
      noteTable,
      note.toJson(),
      where: '${NoteField.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db.delete(noteTable, where: '${NoteField.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    _database = null;
    db.close();
  }

  NoteDB._init();
}
