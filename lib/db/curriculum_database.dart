import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:assistant/models/curriculum/curriculum.dart';
import 'package:assistant/constant.dart';

class ClassDatabase {
  static final ClassDatabase instance = ClassDatabase._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB('class.db'); // 內部資料夾
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
    await db.execute(''' CREATE TABLE $classTable ( 
  ${ClassField.id} $idType, 
  ${ClassField.subject} $textType,
  ${ClassField.location} $textType,
  ${ClassField.week} $textType,
  ${ClassField.time} $textType,
  ${ClassField.teacher} $textType
  )
''');
  }

  Future<Curriculum> create(Curriculum _class) async {
    final db = await instance.database;
    final id = await db.insert(classTable, _class.toJson());
    return _class.copy(id: id);
  }

  List<Curriculum> getWeekData({required List<Curriculum> curriculums, required Week week}) {
    List<Curriculum> newCurriculum = [];
    for(int index = 0; index < curriculums.length; index++) {
      if(curriculums[index].week == week) {
        newCurriculum.add(curriculums[index]);
      }
    }
    return newCurriculum;
  }

  Future<Curriculum> readCurriculum(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      classTable,
      columns: ClassField.values,
      where: '${ClassField.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Curriculum.fromJson(maps.first);
    } else {
      throw ('Id $id not found');
    }
  }

  Future<List<Curriculum>> readAllCurriculum() async {
    final db = await instance.database;
    const orderBy = '${ClassField.time} ASC';
    final result = await db.query(classTable, orderBy: orderBy);
    return result
        .map((json) => Curriculum.fromJson(json))
        .toList(); // where i s the json
  }

  Future<int> update(Curriculum _class) async {
    final db = await instance.database;
    return db.update(
      classTable,
      _class.toJson(),
      where: '${ClassField.id} = ?',
      whereArgs: [_class.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db
        .delete(classTable, where: '${ClassField.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }



  ClassDatabase._init();
}
