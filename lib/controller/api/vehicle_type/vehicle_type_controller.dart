import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:ultra_shine/app/api/api_client.dart';
import 'package:ultra_shine/models/home/choose_vehicle_model.dart';

class VehicleTypeController extends GetxController {
  static VehicleTypeController instance = Get.find();
  var vehicleTypes = <ChooseVehicleModel>[].obs;

  void getVehicleTypes() async{
    vehicleTypes.value = await ApiClient.vehicleTypeService.getVehicleTypes();
  }

  @override
  void onInit() {
    getVehicleTypes();
    super.onInit();
  }

}