import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '/models/item_model.dart';

class NewsDbProvider {
  late Database db;

  init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // a reference to the directory on our device
    final path = join(documentsDirectory.path, 'items.db');
    // a reference to the db itself
    db = await openDatabase(
      // either create a newDb or open one that already exists
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        // """""" = multiline string
        newDb.execute("""
          CREATE TABLE Items
          (
            id INTEGER PRIMARY KEY,
            type TEXT,
            by TEXT,
            time INTEGER,
            text TEXT,
            parent INTEGER,
            kids BLOB,
            dead INTEGER,
            deleted INTEGER,
            url TEXT,
            score INTEGER,
            title TEXT,
            descendants INTEGER
          )
      """);
      },
    );
  }

  fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      // columns: ['id'] = just one column; null = all columns
      where: "id = ?",
      // to prevent sql-injection attacks
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      // maps.length > 0
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  addItem(ItemModel item) {
    return db.insert('Items', item.toMapForDb());
  }
}
