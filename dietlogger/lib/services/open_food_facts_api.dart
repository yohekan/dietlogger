import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenFoodFactsApi {
  static const String baseUrl = 'https://world.openfoodfacts.org/api/v0/product/';

  // バーコードでAPIリクエストを送信
  Future<Map<String, dynamic>?> fetchProduct(String barcode) async {
    final response = await http.get(Uri.parse('$baseUrl$barcode.json'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 1) {
        return data['product'];
      } else {
        return null; // 該当商品なし
      }
    } else {
      throw Exception('APIリクエストに失敗しました');
    }
  }
}
