import 'package:mynote/ui/views/note/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class localRepository {
  //xây dựng 1 hàm tạo privite
  localRepository._intrenal();

  //xây dựng hàm tạo đối tượng
  static final _cache = <String, localRepository>{};

  static localRepository get instance =>
      _cache.putIfAbsent('localPersistence', () => localRepository._intrenal());

  bool isInitialized = false;
  Database _database;

  Future<Database> databse() async {
    if (!isInitialized) await _init();
    return _database;
  }

  Future _init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'note_app.db');

    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(Note.createTable);
    });
    isInitialized = true;
  }
}
