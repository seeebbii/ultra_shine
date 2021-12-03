import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ultra_shine/app/api/api_client.dart';
import 'package:ultra_shine/app/constant/controllers.dart';

class RequestController extends GetxController {
  static RequestController instance = Get.find();
  var assets = <XFile>[].obs;

  Rx<double> totalAmount = 0.00.obs;

  double exteriorAmount = 0.00;
  double interiorAmount = 0.00;
  double filmsAmount = 0.00;
  double paintProtectionAmount = 0.00;

  double exteriorPrevAmount = 0.00;
  double interiorPrevAmount = 0.00;
  double filmsPrevAmount = 0.00;
  double paintProtectionPrevAmount = 0.00;


  void calculateTotalAmount(){
    totalAmount.value = exteriorAmount + interiorAmount + filmsAmount + paintProtectionAmount;
    debugPrint("TOTAL AMOUNT: $totalAmount");
  }

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
    