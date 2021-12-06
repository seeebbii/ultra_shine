import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
import 'package:ultra_shine/app/constant/imp.dart';
import 'model/payment_model.dart';

class PaymentController extends GetxController {
  static PaymentController instance = Get.find();

  var paymentModel = <PaymentModel>[].obs;
  Rx<PaymentModel> selectedMethod = PaymentModel().obs;


  @override
  void onInit() {
    MFSDK.init(myFatoorahTestUrl, myFatoorahTestToken);
    var request = MFInitiatePaymentRequest(0.100, MFCurrencyISO.UNITED_STATE_USD);
    MFSDK.initiatePayment(request, MFAPILanguage.EN,
            (MFResult<MFInitiatePaymentResponse> result) {
          if (result.isSuccess()) {
            Iterable data = result.response!.paymentMethods!;
            paymentModel.value = data.map((e) => PaymentModel.fromJson(e.toJson())).toList();
            selectedMethod.value = paymentModel[0];
          } else {
            debugPrint(result.error?.message);
          }
        });

    super.onInit();
  }


}
