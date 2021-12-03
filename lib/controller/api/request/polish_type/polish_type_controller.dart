import 'package:get/get.dart';
import 'package:ultra_shine/app/api/api_client.dart';
import 'package:ultra_shine/models/home/polishing_types.dart';

class PolishTypeController extends GetxController {
  static PolishTypeController instance = Get.find();
  var polishTypes = <Polishtypes>[].obs;
  var selectedPolishType = Polishtypes().obs;
  RxInt index = 0.obs;
 // var opt ionSelected = false.obs;
 // var packageSelected = false.obs;

  void getPolishTypes() async {
    polishTypes.value = await ApiClient.polishTypeService.getPolishTypes();
  }

  @override
  void onInit() {
    getPolishTypes();
    super.onInit();
  }
}
