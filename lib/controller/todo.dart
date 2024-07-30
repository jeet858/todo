import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

Future createDatabase() async {
  var databasesPath = await getDatabasesPath();
  String path = p.join(databasesPath, 'todo.db');
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        'CREATE TABLE tasks id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(255) NOT NULL, description TEXT, due_date DATE, priority VARCHAR(50), status VARCHAR(50), assigned_user VARCHAR(255))');
  });
}
