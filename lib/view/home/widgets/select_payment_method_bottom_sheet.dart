import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/controller/payment/model/payment_model.dart';

class SelectPaymentMethodBottomSheet extends StatefulWidget {
  const SelectPaymentMethodBottomSheet({Key? key}) : super(key: key);

  @override
  _SelectPaymentMethodBottomSheetState createState() =>
      _SelectPaymentMethodBottomSheetState();
}

class _SelectPaymentMethodBottomSheetState
    extends State<SelectPaymentMethodBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5.sh,
      width: double.infinity.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 8,
            blurRadius: 20,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.03.sh,
            ),
            Text(
              "Choose Method",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(fontSize: 25.sp),
            ),
            SizedBox(
              height: 0.03.sh,
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemBuilder: (_, index) {
                      PaymentModel model =
                          paymentController.paymentModel[index];
                      return ListTile(
                        onTap: () {
                          paymentController.selectedMethod.value =
                              paymentController.paymentModel[index];
                          navigationController.goBack();
                        },
                        leading: CachedNetworkImage(
                          imageUrl: model.imageUrl.toString(),
                          fit: BoxFit.contain,
                          width: 50.sp,
                          height: 30.sp,
                        ),
                        title: Text(
                          model.paymentMethodEn.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  color: paymentController.selectedMethod.value
                                              .paymentMethodEn ==
                                          paymentController.paymentModel[index]
                                              .paymentMethodEn
                                      ? primaryColor
                                      : Colors.black, fontWeight: FontWeight.bold, fontSize: 14.sp),
                        ),
                      );
                    },
                    itemCount: paymentController.paymentModel.length,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
