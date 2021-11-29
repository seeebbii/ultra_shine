import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'dart:math' as math;

import 'package:ultra_shine/view/components/auth_textfield.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.15.sh),
        child: Stack(
          children: [
            Positioned(
              right: -0.2.sh,
              top: -0.04.sh,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Transform.rotate(
                  angle: -math.pi / 9.sp,
                  child: Image.asset(
                    ImagePaths.tireBackground,
                    width: 0.8.sw,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0.35.sh,
              top: 0.2.sh,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Transform.rotate(
                  angle: -math.pi / 7.5.sp,
                  child: Image.asset(
                    ImagePaths.tireBackground,
                    width: 0.8.sw,
                  ),
                ),
              ),
            ),
            AppBar(
              centerTitle: true,
              title: Text("Personal Info",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700)),
              leading: InkWell(
                  onTap: () => navigationController.goBack(),
                  child: Image.asset(
                    ImagePaths.backArrow,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: [
          Positioned(
            top: -0.05.sh,
            child: Container(
              child: CircleAvatar(
                radius: 58.0.r,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 15.0.r,
                      child: Icon(
                        Icons.camera_alt,
                        size: 15.0.r,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  radius: 52.0.r,
                  backgroundImage: const AssetImage(ImagePaths.paint),
                ),
              ),),
          ),
            Container(
              margin: EdgeInsets.only(top: 0.15.sh),
              // color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildNameField(),
                    _buildEmailField(),
                    _buildNumberField(),
                    _buildCityField(),
                    _buildCountryField(),
                    SizedBox(height: 0.01.sh),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                          onPressed: () {
                            debugPrint("Send button pressed");
                          },
                          child: Text(
                            "Send",
                            style: Theme.of(context).textTheme.headline1?.copyWith(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.05.sh),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text(
              "Name",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          AuthTextField(
              controller: nameController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "John Doe",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.name,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Email",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: emailController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "JohnDoe@mail.com",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.emailAddress,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildNumberField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Contact Number",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: contactController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "3655825154",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.number,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildCityField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("City",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: cityController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "..",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.name,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildCountryField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Country",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: countryController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "...",
              validator: (str) {},
              action: TextInputAction.next,
              keyType: TextInputType.name,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }
}
