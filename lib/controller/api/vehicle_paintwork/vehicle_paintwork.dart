import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:ultra_shine/app/api/api_client.dart';
import 'package:ultra_shine/models/home/choose_vehicle_model.dart';

class VehiclePaintWorkController extends GetxController {
  static VehiclePaintWorkController instance = Get.find();

  var vehiclePainWorkSelected = false.obs;

  void getVehiclePaintWork() async{
    ApiClient.vehicleTypeService.getVehicleTypes();
  }

  @override
  void onInit() {
    getVehiclePaintWork();
    super.onInit();
  }

}