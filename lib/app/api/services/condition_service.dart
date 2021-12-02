import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ultra_shine/app/api/api.endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:ultra_shine/models/home/choose_vehicle_paintwork_model.dart';

class ConditionService {
  final _client = http.Client();

  Future<List<ChooseVehiclePaintworkModel>> getVehiclePaintWorkList() async{
    var url = Uri.parse('$baseUrl/conditions');
    List<ChooseVehiclePaintworkModel> temp = <ChooseVehiclePaintworkModel>[];
    try {
      http.Response response = await _client.get(url);
      if (response.statusCode == 200) {
        Iterable paintList = jsonDecode(response.body)['data'];
        List<ChooseVehiclePaintworkModel> temp = paintList.map((e) => ChooseVehiclePaintworkModel.fromJson(e)).toList();
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