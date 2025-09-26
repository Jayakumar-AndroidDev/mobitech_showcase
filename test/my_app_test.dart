import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;


void main() {
  test("product list api test", () async {
    
    final response = await http.get(
        Uri.parse("${Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline")}?brand=maybelline"),
      );

      final statusCode = response.statusCode;

      expect(statusCode, 200);
  },);
}