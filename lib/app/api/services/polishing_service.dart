import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ultra_shine/app/api/api.endpoints.dart';
import 'package:http/http.dart' as http;

import 'package:ultra_shine/models/home/polishing_types.dart';

class PolishingTypeService {
  final _client = http.Client();

  Future<List<Polishtypes>> getPolishTypes(int? cvid, int? cpid) async {
    var url = Uri.parse(
        '$baseUrl/polishings?vehicle_type_id=$cvid&condition_id=$cpid');
    List<Polishtypes> temp = <Polishtypes>[];
    try {
      http.Response response = await _client.get(url);
      if (response.statusCode == 200) {
        Iterable types = jsonDecode(response.body)['data'];
        List<Polishtypes> temp =
            types.map((e) => Polishtypes.fromJson(e)).toList();
        return temp;
      } else {
        return temp;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Future<List<Polishtypes>> getPolishTypes() async{
  //   var url = Uri.parse('$baseUrl/polishings?is_interior');
  //   List<Polishtypes> temp = <Polishtypes>[];
  //   try {
  //     http.Response response = await _client.get(url);
  //     if (response.statusCode == 200) {
  //       Iterable types = jsonDecode(response.body)['data'];
  //       List<Polishtypes> temp = types.map((e) => Polishtypes.fromJson(e)).toList();
  //       return temp;
  //     }else{
  //       return temp;
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     rethrow;
  //   }
  // }

}
