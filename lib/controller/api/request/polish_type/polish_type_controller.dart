
import 'package:get/get.dart';

import 'package:ultra_shine/app/api/api_client.dart';
import 'package:ultra_shine/models/home/polishing_types.dart';

class PolishTypeController extends GetxController {
  static PolishTypeController instance = Get.find();
  var polishTypes = <Polishtypes>[].obs;

  var optionSelected = false.obs;
  var packageSelected = false.obs;

  void getPolishTypes() async{
    polishTypes.value = await ApiClient.polishTypeService.getPolishTypes();
  }

  @override
  void onInit() {
    getPolishTypes();
    super.onInit();
  }

}