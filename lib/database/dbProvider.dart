import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database? _database;

  Future<Database?> get database async{
    if(_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async{
    return await openDatabase(join(await getDatabasesPath(), "notas_com_compartilhamento.db"),
    onCreate: (db, version) async{
      await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT
      )
      ''');
    }, version:1);
  }

}