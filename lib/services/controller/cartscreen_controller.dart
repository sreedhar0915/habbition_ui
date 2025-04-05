import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:habbition_ui/models/Homescreenmodel.dart';
import 'package:sqflite/sqflite.dart';

class MyCartController with ChangeNotifier {
  static late Database database;
  dynamic totalcartvalue = 0.00;

  List<Map> storedProducts = [];

  static Future initDb() async {
    database = await openDatabase("cartdb1.db", version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Cart (id INTEGER PRIMARY KEY, name TEXT, qty INTEGER, Amount REAL, image TEXT)');
    });
  }

  Future getAllProducts() async {
    storedProducts = await database.rawQuery('SELECT * FROM Cart');
    log(storedProducts.toString());
    calculatetotalamount();
    notifyListeners();
  }

  Future addProduct(Homescreenmodel selectedProduct) async {
    bool alreadyCart = storedProducts.any(
      (element) => selectedProduct.id == element["productId"],
    );

    if (alreadyCart) {
      log("already in cart");
    } else {
      await database.rawInsert(
          'INSERT INTO Cart(name, qty, Amount, image) VALUES(?, ?, ?, ?)', [
        selectedProduct.title,
        1,
        selectedProduct.price,
        selectedProduct.image
      ]);
    }
    notifyListeners();
  }

  incrementQty({required int qty, required int id}) async {
    await database
        .rawUpdate('UPDATE Cart SET  qty = ? WHERE id = ?', [++qty, id]);
    getAllProducts();
  }

  decrementQty({required int qty, required int id}) {
    if (qty > 1) {
      database.rawUpdate('UPDATE Cart SET  qty = ? WHERE id = ?', [--qty, id]);
      getAllProducts();
    } else {}
  }

  removeProduct(int id) async {
    await database.rawDelete('DELETE FROM Cart WHERE id = ?', [id]);
    getAllProducts();
  }

  calculatetotalamount() {
    totalcartvalue = 0.00;
    for (int i = 0; i < storedProducts.length; i++) {
      totalcartvalue = totalcartvalue +
          (storedProducts[i]["qty"] * storedProducts[i]["Amount"]);
    }
    log(totalcartvalue.toString());
  }
}
