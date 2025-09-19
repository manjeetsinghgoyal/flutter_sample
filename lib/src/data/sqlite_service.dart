import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteService {
  static Database? _db;

  static Future<Database> getDb() async {
    if (_db != null) return _db!;
    final path = join(await getDatabasesPath(), 'tata_power.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''CREATE TABLE readings (
        id TEXT PRIMARY KEY,
        consumerNo TEXT,
        meterNo TEXT,
        reading REAL,
        readingDate TEXT,
        photoPath TEXT,
        remarks TEXT,
        synced INTEGER
      )''');
    });
    return _db!;
  }

  static Future<void> insertReading(Map<String, dynamic> data) async {
    final db = await getDb();
    data['synced'] = 0;
    await db.insert('readings', data, conflictAlgorithm: ConflictAlgorithm.replace);
  }
  //1 --->123456--->768-->19/9/2025->data/data/com.. --> remarks-->0


  static Future<List<Map<String, dynamic>>> getPendingReadings() async {
    final db = await getDb();
    return await db.query('readings', where: 'synced = ?', whereArgs: [0]);
  }
 /* 1 --->123456--->768-->19/9/2025->data/data/com.. --> remarks-->0
  2 --->12345634--->33-->19/9/2025->data/data/com.. --> remarks-->0
  //10 --->234--->55-->19/9/2025->data/data/com.. --> remarks-->1
  12 --->23--->55-->19/9/2025->data/data/com.. --> remarks-->0
*/
  static Future<void> markAsSynced(String id) async {
    final db = await getDb();
    await db.update('readings', {'synced': 1}, where: 'id = ?', whereArgs: [id]);
  }
 /* 1 --->123456--->768-->19/9/2025->data/data/com.. --> remarks-->1
  2 --->12345634--->33-->19/9/2025->data/data/com.. --> remarks-->1
*/}