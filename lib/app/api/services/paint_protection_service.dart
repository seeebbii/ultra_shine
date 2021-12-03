import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:ultra_shine/app/api/api.endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:ultra_shine/models/home/paint_protection_models.dart';


class PaintProtectionService {
  final _client = http.Client();

  Future<List<PaintProtectionModel>> getPaintProtection() async{
    var url = Uri.parse('$baseUrl/paint-options');
    List<PaintProtectionModel> temp = <PaintProtectionModel>[];
    try {
      http.Response response = await _client.get(url);
      if (response.statusCode == 200) {
        Iterable paintList = jsonDecode(response.body)['data'];
        List<PaintProtectionModel> temp = paintList.map((e) => PaintProtectionModel.fromJson(e)).toList();
        return temp;
      }else{
        return temp;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

}