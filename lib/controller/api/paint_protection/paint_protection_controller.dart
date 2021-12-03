import 'package:get/get.dart';
import 'package:ultra_shine/app/api/api_client.dart';
import 'package:ultra_shine/models/home/paint_protection_models.dart';

class PaintProtectionController extends GetxController {
  static PaintProtectionController instance = Get.find();

  var isSelected = false.obs;

  var paintProtectionList = <PaintProtectionModel>[].obs;
  var paintProtectionID = "".obs;
  void getPaintProtectionList() async {
    paintProtectionList.value =
        await ApiClient.paintProtectionService.getPaintProtection();
  }

  @override
  void onInit() {
    getPaintProtectionList();
    super.onInit();
  }
}
