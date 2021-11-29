import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/utils/colors.dart';

class MyAppointments extends StatelessWidget {
  const MyAppointments({Key? key}) : super(key: key);

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
                  SizedBox(height: 0.05.sh,),
                  Row(
                    children: [
                      Text("Appointments: ", style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.black, fontSize: 15.sp),),
                      Text("10",style: Theme.of(context).textTheme.headline3?.copyWith(fontSize: 15.sp), )
                    ],
                  ),
                  SizedBox(height: 0.01 .sh,),
                ],
              ),
            ),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(horizontal: 11.sp, vertical: 10.sp),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: ListTile(
                    title: Text("Appointment", style: Theme.of(context).textTheme.bodyText1,),
                    trailing: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10.r)
                      ),
                      child: TextButton(onPressed: () {  },
                        style: Theme.of(context).textButtonTheme.style,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.sp),
                        child: Text("Accepted", style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.grey.shade600, fontSize: 9.sp),),
                      ),),
                    ) ,
                  ),
                ),
              );
            }, childCount: 10),
          ),)
        ],
      ),
    );
  }
}
