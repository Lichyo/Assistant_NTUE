import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Todo {
  final String id;
  final String name;
  final int isCompleted;
  Todo({required this.id, required this.name, required this.isCompleted});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isCompleted': isCompleted,
    };
  }
}

class TodoDB {
  static late Database database;

  static Future<Database> getDBConnect() async {
    if (database != null) {
      return database;
    }
    return await initDatabase();
  }

  static Future<Database> initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE todos(id TEXT PRIMARY KEY, name TEXT, isCompleted INTEGER)",
        );
      },
      version: 1,
    );
    return database;
  }

  // get database
  static Future<List<Todo>> getTodos() async {
    final Database db = await getDBConnect();
    final List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        name: maps[i]['name'],
        isCompleted: maps[i]['isCompleted'],
      );
    });
  }

  static Future<void> addTodo(Todo todo) async {
    final Database db = await getDBConnect();
    await db.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
