import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/utils/colors.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notification",
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
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 8.0.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Appointment", style: Theme.of(context).textTheme.headline3?.copyWith( fontSize: 13.sp, fontWeight: FontWeight.w700, color: Colors.black),),
                            Text("12 min", style:  Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey.shade700, fontSize: 10.sp),)
                          ],
                        ),
                      ),
                      subtitle: Text("Lorem Ipsum is simply dummy text of the", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey.shade700, fontSize: 11.sp)),
                      leading: CircleAvatar(
                        radius: 25.r,
                        backgroundImage: const AssetImage(ImagePaths.paint),
                        foregroundColor: Colors.white38,
                      ),
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
