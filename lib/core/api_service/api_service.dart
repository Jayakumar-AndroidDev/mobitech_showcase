import 'dart:convert';
import 'package:mobitech_task/screens/home_screen/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl =
      "https://makeup-api.herokuapp.com/api/v1/products.json";

  static Future<List<ProductModel>> getProductList() async {
    try {
      final response = await http.get(
        Uri.parse("${Uri.parse(_baseUrl)}?brand=maybelline"),
      );
      if (response.statusCode == 200) {
        final result = json.decode(response.body) as List<dynamic>;

        List<ProductModel> list = [];

        result.forEach((item) => list.add(ProductModel.fromJson(item)));

        return list;
      } else { 
        throw "Unable to fetch response ${response.statusCode}";
      }
    } catch (err) {
      throw "Unable to fetch response $err";
    }
  }
}
