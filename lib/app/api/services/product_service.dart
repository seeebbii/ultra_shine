import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:ultra_shine/app/api/api.endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:ultra_shine/models/home/product_model.dart';

class ProductService {
  final _client = http.Client();

  Future<List<ProductsModel>> getProduct() async {
    var url = Uri.parse('$baseUrl/shop/items/');
    List<ProductsModel> temp = <ProductsModel>[];
    try {
      http.Response response = await _client.get(url);
      if (response.statusCode == 200) {
        Iterable productList = jsonDecode(response.body)['data'];
        List<ProductsModel> temp =
            productList.map((e) => ProductsModel.fromJson(e)).toList();
        return temp;
      } else {
        return temp;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
