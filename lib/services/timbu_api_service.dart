import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class TimbuApiService {
  static const String apiKey =
      'ea4b1a47f0274910bd93b479a15c441120240707192707403385';
  static const String appId = 'XFYR9SHT5EK6AMM';
  static const String organizationId = '839d5ee98cf74b6083ba0b8c4ebbc9e6';
  static const String baseUrl = 'https://api.timbu.cloud/products';

  Future<List<Product>> fetchProducts() async {
    final url = Uri.parse(
        '$baseUrl?organization_id=$organizationId&reverse_sort=false&page=1&size=25&Appid=$appId&Apikey=$apiKey');
    print('Fetching products from URL: $url');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('Response received: ${response.body}');
      try {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('items')) {
          List<dynamic> items = jsonResponse['items'];
          List<Product> products =
              items.map((dynamic item) => Product.fromJson(item)).toList();
          return products;
        } else {
          print('Error: JSON response does not contain "items" key');
          throw Exception('Failed to parse products');
        }
      } catch (e) {
        print('Error parsing JSON: $e');
        throw Exception('Failed to parse products');
      }
    } else {
      print(
          'Failed to load products: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load products');
    }
  }
}
