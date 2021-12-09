import 'package:get/get.dart';
import 'package:ultra_shine/app/api/api_client.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/models/home/polishing_types.dart';

class PolishTypeController extends GetxController {
  static PolishTypeController instance = Get.find();
  var polishTypes = <Polishtypes>[].obs;
  var selectedPolishType = Polishtypes().obs;
  //RxInt index = 0.obs;
  var selectedPolishTypeId = "".obs;
  var optionSelected = false.obs;
  var isLoading = false.obs;
  //var packageSelected = false.obs;

  void getPolishTypes(int? cvid, int? cpid) async {
    polishTypes.value = [];
    polishTypes.value = await ApiClient.polishTypeService
        .getPolishTypes(cvid, cpid)
        .whenComplete(() => {
              isLoading.value = true,
              
            });
  }

  // @override
  // void onInit() {
  //   getPolishTypes();
  //   super.onInit();
  // }
}
