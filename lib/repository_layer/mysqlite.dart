import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDB {

  createDB() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'cart.db');
      
      // open the database
      return await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute("CREATE TABLE IF NOT EXISTS cart ( "
            "id INTEGER PRIMARY KEY,"
            "product_id INTEGER,"
            "quantity INTEGER,"
            "create_at DATETIME DEFAULT CURRENT_TIMESTAMP)");
      });

    } catch (e) {
      print("ERRR >>>>");
      print(e);
    }
  }

  Future<int> insertItem(int productId, int quantity) async {
    Database _db = await createDB();
    return await _db
        .insert("cart", {"product_id": productId, "quantity": quantity});
  }

  Future<List<Map>> getCart() async {
    Database _db = await createDB();
    var result = await _db.rawQuery('SELECT * FROM Cart');
    if (result != null) {
      return result.toList();
    }
    return null;
  }

  Future<int> deleteItem(int id) async {
    Database _db = await createDB();
    return await _db.rawDelete('DELETE FROM Cart WHERE id = $id');
  }

  Future<int> updateItem(int id, int productId, int quantity) async {
    Database _db = await createDB();
    return await _db.rawUpdate(
        'UPDATE Cart SET product_id = ?, quantity = ? WHERE id = ?',
        [productId, quantity, id]);
  }

  Future<Map> getItem(int id) async {
    Database _db = await createDB();
    var res = await _db.query("Cart", where: "product_id = ?", whereArgs: [id]);
    return res.isNotEmpty ? res.first : null;
  }

  Future<void> deleteTable() async {
    Database _db = await createDB();
    await _db.rawDelete('DELETE FROM cart');
  }
}
