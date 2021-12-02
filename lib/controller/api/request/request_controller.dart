import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ultra_shine/app/api/api_client.dart';

class RequestController extends GetxController {
  static RequestController instance = Get.find();
  var assets = <XFile>[].obs;

  void requestSubmit({
    required name,
    required email,
    required contact,
    required yearMake,
    required model,
    required polished,
    required city,
    required country,
    required manufacturer,
    required address,
  }) async {
    ApiClient.postRequest.postRequest(
      name,
      email,
      contact,
      yearMake,
      model,
      polished,
      city,
      country,
      manufacturer,
      address,
    );
  }
}
    