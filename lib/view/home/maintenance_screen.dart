import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/router/router_generator.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/models/home/maintenance_kit_model.dart';
import 'package:ultra_shine/view/home/widgets/build_bottom_buttons.dart';
import 'package:ultra_shine/view/home/widgets/build_maintenance_kit.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({Key? key}) : super(key: key);

  @override
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  List<KitFeatures> kitFeatures = <KitFeatures>[
    KitFeatures(
      packageName: "1x 500ml GWash",
    ),
    KitFeatures(
      packageName: "1x 500ml Quick Detailer",
    ),
    KitFeatures(
      packageName: "1x 500ml G6 Perfect Glass",
    ),
    KitFeatures(
      packageName: "1x 250ml W6 Iron and General Fallout",
    ),
    KitFeatures(
      packageName: "1x 250ml T2 Tyre Dressing",
    ),
    KitFeatures(
      packageName: "2x MF1 ZeroR Microfiber Buff Cloth",
    ),
    KitFeatures(
      packageName: "1x MF2 Zero Scratch Microfiber Drying Towel",
    ),
  ];

  late List<MaintenanceKitModel> maintenanceKitModel;

  @override
  void initState() {
    maintenanceKitModel = <MaintenanceKitModel>[
      MaintenanceKitModel(
          kitFeatures: kitFeatures,
          titleText: "Essential Maintenance Kit",
          subTitleText:
              "The Essential Maintenance Kit contains all of the must-haves you will need to look after your Gtechniq protected car.",
          value: false),
      MaintenanceKitModel(
          kitFeatures: kitFeatures,
          titleText: "Essential Maintenance Kit",
          subTitleText:
              "The Essential Maintenance Kit contains all of the must-haves you will need to look after your Gtechniq protected car.",
          value: false),
      MaintenanceKitModel(
          kitFeatures: kitFeatures,
          titleText: "Essential Maintenance Kit",
          subTitleText:
          "The Essential Maintenance Kit contains all of the must-haves you will need to look after your Gtechniq protected car.",
          value: false),
      MaintenanceKitModel(
          kitFeatures: kitFeatures,
          titleText: "Essential Maintenance Kit",
          subTitleText:
          "The Essential Maintenance Kit contains all of the must-haves you will need to look after your Gtechniq protected car.",
          value: false),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: -0.55.sw,
            bottom: 0.8.sh,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Transform.rotate(
                angle: -math.pi / 6.5.sp,
                child: Image.asset(
                  ImagePaths.tireBackground,
                  width: 0.8.sw,
                ),
              ),
            ),
          ),
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
                        'Maintenance Kits',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.sp, right: 22.sp),
                      child: Text(
                        "We say...Recommended if you are going to regularly maintain your vehicle. This price represents a 30% saving over purchasing each item individually.",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 2.sp),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Maintenance Kit Costs: ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text("\$0.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: primaryColor)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 2.sp),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            maintenanceKitModel
                                .forEach((element) => element.value = false);
                            maintenanceKitModel[index].value = true;
                          });
                        },
                        child: BuildMaintenanceKit(
                          model: maintenanceKitModel[index],
                        ));
                  }, childCount: maintenanceKitModel.length),
                ),
              ),
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
                            pageNumber: 6,
                            btnColor: Colors.black,
                          )),
                          Expanded(
                              child: BuildBottomButton(
                            buttonText: "Next",
                            onPressed: () => stepperController.toNextPage(),
                            pageNumber: 6,
                            btnColor: primaryColor,
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
}
