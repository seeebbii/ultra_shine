import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ultra_shine/app/api/api.endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:ultra_shine/models/home/choose_vehicle_model.dart';
import 'package:ultra_shine/models/home/choose_vehicle_paintwork_model.dart';

class VehicleTypeService {
  final _client = http.Client();

  Future<List<ChooseVehicleModel>> getVehicleTypes() async{
    var url = Uri.parse('$baseUrl/vehicle-types');
    List<ChooseVehicleModel> temp = <ChooseVehicleModel>[];
    try {
      http.Response response = await _client.get(url);
      if (response.statusCode == 200) {
        Iterable types = jsonDecode(response.body)['data'];
        List<ChooseVehicleModel> temp = types.map((e) => ChooseVehicleModel.fromJson(e)).toList();
        return temp;
      }else{
        return temp;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<List<ChooseVehiclePaintworkModel>> getVehiclePaintWork() async{
    var url = Uri.parse('$baseUrl/');
    List<ChooseVehiclePaintworkModel> temp = <ChooseVehiclePaintworkModel>[];
    try {
      http.Response response = await _client.get(url);
      if (response.statusCode == 200) {
        Iterable paintWork = jsonDecode(response.body)['data'];

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