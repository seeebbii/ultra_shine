import 'package:cached_network_image/cached_network_image.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/constant/imp.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/view/components/auth_textfield.dart';
import 'package:ultra_shine/view/home/widgets/select_payment_method_bottom_sheet.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final cardController = TextEditingController();
  final expirationController = TextEditingController();
  final cvcController = TextEditingController();

  String cardNumber = '';
  String month = '';
  String year = '';
  String cvc = '';

  bool checkBoxValue = false;
  final _formKey = GlobalKey<FormState>();

  void makeExecutePaymentRequest() {
    var request = MFExecutePaymentRequest(
        paymentController.selectedMethod.value.paymentMethodId!, 0.100);

    var mfCardInfo = MFCardInfo(
        cardNumber: cardNumber,
        expiryMonth: month,
        expiryYear: year,
        securityCode: cvc,
        cardHolderName: 'TEST TEST',
        bypass3DS: true,
        saveToken: true);

    MFSDK.executeDirectPayment(context, request, mfCardInfo, MFAPILanguage.EN,
            (String invoiceId, MFResult<MFDirectPaymentResponse> result) => {

          if(result.isSuccess()) {
            print(result.response?.toJson().toString())
          }
          else {
            print(result.error?.message)
          }
        });

    // var request = MFExecutePaymentRequest( paymentController.selectedMethod.value.paymentMethodId!, 0.100);
    //
    // MFSDK.executePayment(context, request, MFAPILanguage.EN,
    //         (String invoiceId, MFResult<MFPaymentStatusResponse> result) => {
    //
    //       if(result.isSuccess()) {
    //         print(result.response?.toJson().toString())
    //       }
    //       else {
    //         print(result.error?.message)
    //       }
    //     });

  }

  void _tryTransaction() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      if (checkBoxValue) {
        // TODO ::  TRANSACTION

        makeExecutePaymentRequest();
      } else {
        if (!Get.isSnackbarOpen) {
          Get.snackbar(
            "Please accept our Terms and Conditions",
            '',
            backgroundColor: primaryColor,
            colorText: Colors.black54,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    }
  }

  @override
  void initState() {
    MFSDK.setUpAppBar(
        title: "MyFatoorah Payment",
        titleColor: Colors.white, // Color(0xFFFFFFFF)
        backgroundColor: Colors.black, // Color(0xFF000000)
        isShowAppBar: true); // For Android platform only

    super.initState();
  }

  final CreditCardValidator _ccValidator = CreditCardValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Payment Method",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: primaryColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700)),
        leading: InkWell(
            onTap: () => navigationController.goBack(),
            child: Image.asset(
              ImagePaths.backArrow,
            )),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0.03.sh,
                  ),
                  _buildCardField(),
                  _buildExpirationField(),
                  _buildCvcField(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Row(
                      children: [
                        Checkbox(
                            value: checkBoxValue,
                            onChanged: (bool? val) {
                              setState(() {
                                checkBoxValue = !checkBoxValue;
                              });
                            }),
                        Expanded(
                            child: Text(
                                'I state that I have read and agree to the Terms of Use / Privacy Policy.',
                                style: Theme.of(context).textTheme.bodyText1))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.05.sh,
                  ),
                  Text(
                    "Processed securely by Stripe.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 0.01.sh),
                  Image.asset(ImagePaths.stripeIcons),
                  SizedBox(height: 0.05.sh),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: ElevatedButton(
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.copyWith(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ))),
                        onPressed: _tryTransaction,
                        child: Text(
                          "Send",
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCardField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text(
              "Card Number",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          AuthTextField(
              controller: cardController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "4508 7500 XXXX XXXX",
              validator: (str) {
                var ccNumResults = _ccValidator.validateCCNum(str);
                if (str == '' || str == null) {
                  return "Invalid Card Number";
                } else if (str.toString().length < 19) {
                  return "Invalid Card Number";
                }
                if (ccNumResults.isValid) {
                  // print(ccNumResults.ccType);
                  return null;
                } else {
                  // print(ccNumResults.ccType);
                  // return "Invalid Card Number";
                }
                cardNumber = str.toString().replaceAll(' ', '');
                return null;
              },
              validateMode: AutovalidateMode.onUserInteraction,
              formatter: [
                // WhitelistingTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(19),
                CreditCardNumberInputFormatter()
              ],
              action: TextInputAction.next,
              keyType: TextInputType.number,
              suffixIcon: InkWell(
                onTap: () {
                  Get.bottomSheet(const SelectPaymentMethodBottomSheet());
                },
                child: Container(
                  width: 0.18.sw,
                  height: 0.0.h,
                  // color: Colors.red,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      VerticalDivider(
                        color: Colors.grey.shade600.withOpacity(0.3),
                        thickness: 1,
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Container(
                            // width: 0.09.sw,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(6.0),
                            child: Obx(() => CachedNetworkImage(
                                  imageUrl: paymentController
                                      .selectedMethod.value.imageUrl!,
                                  fit: BoxFit.contain,
                                )),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Icon(Icons.expand_more),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildExpirationField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text(
              "Expiration Date",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          AuthTextField(
              controller: expirationController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "MM/YY",
              formatter: [
                LengthLimitingTextInputFormatter(5),
                CardExpirationFormatter()
              ],
              validator: (str) {
                if (str == '') {
                  return "Invalid Month";
                }
                if (RegExp(r"(0[1-9]|1[0-2])\/[0-9]{2}").hasMatch(str) ==
                    false) {
                  // year =  str.toString().substring(str.toString().indexOf('/'), str.toString().length);
                  return "Invalid Month";
                }
                month = str[0] + str[1];
                year = str[3] + str[4];
                return null;
              },
              validateMode: AutovalidateMode.onUserInteraction,
              action: TextInputAction.next,
              keyType: TextInputType.number,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildCvcField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text(
              "CVC",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          AuthTextField(
              controller: cvcController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              validateMode: AutovalidateMode.onUserInteraction,
              formatter: [
                LengthLimitingTextInputFormatter(3),
              ],
              hintText: "111",
              validator: (str) {
                if (str.toString().length < 3) {
                  return "Invalid CVC";
                }
                cvc = str;
                return null;
              },
              action: TextInputAction.done,
              keyType: TextInputType.number,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }
}
