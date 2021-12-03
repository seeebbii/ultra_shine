import 'package:get/get.dart';
import 'package:ultra_shine/app/api/api_client.dart';
import 'package:ultra_shine/models/home/choose_vehicle_paintwork_model.dart';

class VehiclePaintWorkController extends GetxController {
  static VehiclePaintWorkController instance = Get.find();

  var vehiclePaintWorkList = <ChooseVehiclePaintworkModel>[].obs;
 // var vehiclePainWorkSelected = false.obs;
  var selectedVehiclePaintWork = ChooseVehiclePaintworkModel().obs;

  void getVehiclePaintWork() async {
    vehiclePaintWorkList.value =
        await ApiClient.conditionService.getVehiclePaintWorkList();
  }

  @override
  void onInit() {
    getVehiclePaintWork();
    super.onInit();
  }
}// write a function to get average 
