import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:assistant/models/lesson/lesson.dart';

class LessonDatabase {
  static final LessonDatabase instance = LessonDatabase._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB('lesson.db'); // 內部資料夾
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
    await db.execute(''' CREATE TABLE $lessonTable ( 
  ${LessonField.id} $idType, 
  ${LessonField.subject} $textType,
  ${LessonField.location} $textType,
  ${LessonField.week} $textType,
  ${LessonField.time} $textType,
  ${LessonField.teacher} $textType
  )
''');
  }

  Future<Lesson> create(Lesson lesson) async {
    final db = await instance.database;
    final id = await db.insert(lessonTable, lesson.toJson());
    return lesson.copy(id: id);
  }

  List<Lesson> getWeekData({required List<Lesson> lessons, required String week}) {
    List<Lesson> newLesson = [];
    for(int index = 0; index < lessons.length; index++) {
      if(lessons[index].week == week) {
        newLesson.add(lessons[index]);
      }
    }
    return newLesson;
  }

  Future<Lesson> readLesson(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      lessonTable,
      columns: LessonField.values,
      where: '${LessonField.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Lesson.fromJson(maps.first);
    } else {
      throw ('Id $id not found');
    }
  }

  Future<List<Lesson>> readAllLesson() async {
    final db = await instance.database;
    const orderBy = '${LessonField.time} ASC';
    final result = await db.query(lessonTable, orderBy: orderBy);
    return result
        .map((json) => Lesson.fromJson(json))
        .toList(); // where i s the json
  }

  Future<int> update(Lesson _class) async {
    final db = await instance.database;
    return db.update(
      lessonTable,
      _class.toJson(),
      where: '${LessonField.id} = ?',
      whereArgs: [_class.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db
        .delete(lessonTable, where: '${LessonField.id} = ?', whereArgs: [id]);
  }

  Future deleteAllLesson() async{
    final db = await instance.database;
    db.delete(lessonTable);
  }

  Future close() async {
    final db = await instance.database;
    _database = null;
    db.close();
  }

  LessonDatabase._init();
}
