import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/models/home/appointment_model.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({Key? key}) : super(key: key);

  @override
  State<MyAppointments> createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  List<AppointmentModel> appointmentList = <AppointmentModel>[
    AppointmentModel(
        status: "Accepted",
        title: "New Apt",
        note:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        isExpanded: false),
    AppointmentModel(
        status: "Rejected",
        title: "Old Appointment",
        note: "WOW",
        isExpanded: false),
    AppointmentModel(
        status: "Accepted", title: "A1", note: "NICEEEEE", isExpanded: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Appointments",
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
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0.05.sh,
                  ),
                  Row(
                    children: [
                      Text(
                        "Appointments: ",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: Colors.black, fontSize: 15.sp),
                      ),
                      Text(
                        "${appointmentList.length}",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(fontSize: 15.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 0.01.sh,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 11.sp, vertical: 10.sp),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          appointmentList[index].isExpanded = !appointmentList[index].isExpanded;
                        });
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: ListTile(
                            title: Text(
                              "${appointmentList[index].title}",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            trailing: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: TextButton(
                                onPressed: () {},
                                style: Theme.of(context).textButtonTheme.style,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.sp),
                                  child: Text(
                                    "${appointmentList[index].status}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.copyWith(
                                            color: Colors.grey.shade600,
                                            fontSize: 9.sp),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    appointmentList[index].isExpanded ? Card(
                      color: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(4.0.sp),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  ImagePaths.noteIconAppointment,
                                  scale: 0.6.sp,
                                ),
                                SizedBox(
                                  width: 5.sp,
                                ),
                                Text(
                                  "Note",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      ?.copyWith(fontSize: 12.sp),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                controller: TextEditingController(
                                    text: "${appointmentList[index].note}"),
                                maxLines: null,
                                enabled: false,
                                style: Theme.of(context).textTheme.bodyText1,
                                cursorWidth: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: Theme.of(context)
                                      .inputDecorationTheme
                                      .hintStyle,
                                ),
                                cursorColor: Colors.red.shade400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ) : const SizedBox.shrink(),
                    SizedBox(
                      height: 12.sp,
                    )
                  ],
                );
              }, childCount: appointmentList.length),
            ),
          )
        ],
      ),
    );
  }
}
