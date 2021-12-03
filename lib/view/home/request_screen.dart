import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/constant/imp.dart';
import 'package:ultra_shine/app/router/router_generator.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/view/components/auth_textfield.dart';
import 'package:ultra_shine/view/home/widgets/build_bottom_buttons.dart';
import 'package:ultra_shine/view/home/widgets/upload_photo_bottomsheet.dart';
import 'package:mime/mime.dart';
class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen>
    with AutomaticKeepAliveClientMixin {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final yearMakeController = TextEditingController();
  final modelController = TextEditingController();
  final polishedController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final manufacturerController = TextEditingController();
  final addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
//Post request

      requestController.requestSubmit(
        name: nameController.text,
        email: emailController.text,
        contact: contactController.text,
        yearMake: yearMakeController.text,
        model: modelController.text,
        polished: polishedController.text,
        city: cityController.text,
        country: countryController.text,
        manufacturer: manufacturerController.text,
        address: addressController.text,
      );

      // navigationController.navigateToNamed(paymentMethodScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 2.sp),
                      child: Text(
                        'REQUEST',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 2.sp),
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                  child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildNameField(),
                    _buildEmailField(),
                    _buildNumberField(),
                    _buildYearField(),
                    _buildModelField(),
                    _buildPolishedField(),
                    _buildCityField(),
                    _buildCountryField(),
                    _buildManufacturerField(),
                    _buildAddressField(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 5.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.sp),
                            child: Text(
                              "Must Upload Videos/Photos of damaged car",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: 0.01.sp),
                         Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: requestController.assets.length <= 0
                                      ?  InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                
                                const UploadPhotoBottomSheet())
                                  .then((value) => setState(() {}));
                          

                            },
                            child:Container(
                                          alignment: Alignment.bottomCenter,
                                          height: 0.18.sh,
                                          decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      ImagePaths.uploadImage),
                                                  scale: 0.6),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.black45)),
                                          child: Container(
                                              margin: EdgeInsets.all(20.sp),
                                              child: Text(
                                                "Add Photo or Video",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                        color: Colors
                                                            .grey.shade500),
                                              )),
                                        )
                                      )
                                      : Obx(
                                        // ignore: invalid_use_of_protected_member
                                      
                                          () => Column(
                                            children: [
                                             Align(
                                               alignment: Alignment.topRight,
                                               child: IconButton(icon: Icon(Icons.upload,color: red,),onPressed: ()
                                               {
                                                   Get.bottomSheet(
                                                                             
                                                                             const UploadPhotoBottomSheet()
                                                                             
                                                                             )
                                                                               .then((value) {
                                                                                 
                                                                                 setState(() {});
                                                                                
                                                                                 
                                                                                 });

                                               },),
                                             )
                                             
                                             ,
                                              Container(
                                                alignment: Alignment.bottomCenter,
                                                height: 0.18.sh,
                                                child: ListView.builder(
                                                    itemCount: requestController
                                                        .assets.length,
                                                    itemBuilder: (context, index) {

                                                    //to get the type of file as selected file is image or video 
                                               requestController.isImage.value=getFiletype(requestController.assets.value[index].name);
                                                     

                                                      return Container(
                                                          margin:
                                                              EdgeInsets.all(0.sp),
                                                          child: Card(
                                                            color: Colors.white,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                              
                                                                requestController.isImage.value==true?
                                                                const Icon(Icons.image):
                                                                const Icon(CupertinoIcons.videocam),

                                                                Flexible(
                                                                  child: RichText(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    strutStyle:
                                                                        StrutStyle(
                                                                            fontSize:
                                                                                12.0),
                                                                    text: TextSpan(
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black),
                                                                      text: requestController
                                                                          .assets
                                                                          .value[
                                                                              index]
                                                                          .name,
                                                                    ),
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                    onPressed: () => setState(() =>
                                                                        requestController
                                                                            .assets
                                                                            .removeAt(
                                                                                index)),
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .cancel_outlined))
                                                              ],
                                                            ),
                                                          )
                                                        

                                                          );
                                                    }),
                                              ),
                                            ],
                                          ),
                                        )),
                            ),
                          
                        ],
                      ),
                    )
                  ],
                ),
              )),
              SliverToBoxAdapter(
                child: Column(
                  
                  children: [
                    SizedBox(height: 0.05.sh),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      child: Row(
                        children: [
                          Expanded(
                              child: BuildBottomButton(
                            buttonText: "Previous",
                            onPressed: () => stepperController.toPreviousPage(),
                            pageNumber: 3,
                            btnColor: Colors.black,
                          )),
                          Expanded(
                              child: BuildBottomButton(
                            buttonText: "Send",
                            onPressed: _trySubmit,
                            pageNumber: 3,
                            btnColor: Colors.grey,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.05.sh),
                  ],
                ),
              )
            ],
          ),
        ],
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
              
              validator: (str) {
                if (str == '' || str == null) {
                  return "Required*";
                }
                return null;
              },
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
              validator: (str) {
                if (str == '' || str == null) {
                  return "Required*";
                } else if (!emailValidate.hasMatch(str)) {
                  return "Email is not valid";
                }
                return null;
              },
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
              validator: (str) {
                if (str == '' || str == null) {
                  return "Required*";
                }
                return null;
              },
              action: TextInputAction.next,
              keyType: TextInputType.number,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildYearField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Year Make",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: yearMakeController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "2021",
              validator: (str) {
                if (str == '' || str == null) {
                  return "Required*";
                }
                return null;
              },
              action: TextInputAction.next,
              keyType: TextInputType.number,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildModelField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Model",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: modelController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "2007",
              validator: (str) {
                if (str == '' || str == null) {
                  return "Required*";
                }
                return null;
              },
              action: TextInputAction.next,
              keyType: TextInputType.number,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildPolishedField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("How many time your car is Polished?",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: polishedController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "2",
              validator: (str) {
                if (str == '' || str == null) {
                  return "Required*";
                }
                return null;
              },
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
              validator: (str) {
                if (str == '' || str == null) {
                  return "Required*";
                }
                return null;
              },
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
              validator: (str) {
                if (str == '' || str == null) {
                  return "Required*";
                }
                return null;
              },
              action: TextInputAction.next,
              keyType: TextInputType.name,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildManufacturerField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Manufacturer",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: manufacturerController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "...",
              validator: (str) {
                if (str == '' || str == null) {
                  return "Required*";
                }
                return null;
              },
              action: TextInputAction.next,
              keyType: TextInputType.name,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildAddressField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text("Address",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ),
          AuthTextField(
              controller: addressController,
              containerBoxColor: authTextFieldContainerColor,
              borderRadius: 12,
              obSecureText: false,
              hintText: "...",
              validator: (str) {
                if (str == '' || str == null) {
                  return "Required*";
                }
                return null;
              },
              action: TextInputAction.done,
              keyType: TextInputType.name,
              suffixIcon: const SizedBox.shrink()),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  bool getFiletype(String path) {
  String? mimeStr = lookupMimeType(path);
var fileType = mimeStr!.split('/');
if(fileType[0].toString()=='image')
return true;
else
return false;


  }
}
