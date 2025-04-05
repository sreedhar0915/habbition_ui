import 'package:flutter/material.dart';
import 'package:habbition_ui/models/Homescreenmodel.dart';
import 'package:http/http.dart' as http;

class HomescreenController with ChangeNotifier {
  List<Homescreenmodel> productlist = [];
  bool isloading = false;
  Future<void> fetchproduct() async {
    isloading = true;
    notifyListeners();

    final url = Uri.parse("https://fakestoreapi.com/products");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        var resobj = homescreenmodelFromJson(response.body);
        productlist = resobj;
        print(productlist);
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching products: $e");
    }

    isloading = false;
    notifyListeners();
  }
}
