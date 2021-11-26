import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/models/home/maintenance_kit_model.dart';

class BuildMaintenanceKit extends StatefulWidget {
  final MaintenanceKitModel model;
  const BuildMaintenanceKit({Key? key, required this.model}) : super(key: key);

  @override
  _BuildMaintenanceKitState createState() => _BuildMaintenanceKitState();
}

class _BuildMaintenanceKitState extends State<BuildMaintenanceKit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 0.25.sh,
            width: double.infinity,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(ImagePaths.kit), fit: BoxFit.cover),
                border: Border.all(
                  width: 1.3,
                  color: Colors.black,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: Stack(
              children: [
                Positioned(
                  left: 0.01.sw,
                  top: 0.01.sh,
                  child: Container(
                    height: 25.sp,
                    width: 25.sp,
                    decoration: BoxDecoration(
                        color: widget.model.value! ? Colors.red : Colors.white,
                        border:
                        Border.all(color: Colors.grey.shade300, width: 4.5),
                        shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 5.sp),
            child: Text('${widget.model.titleText}',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(fontSize: 15.sp)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 3.sp),
            child: Text('${widget.model.subTitleText}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w500)),
          ),
          SizedBox(height: 0.01.sh),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 3.sp),
            child: Text('The kit contains: ',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 3.sp),
            child: ListView.builder(itemBuilder: (_, index){
              return _buildRatingRow(widget.model.kitFeatures[index].packageName!);
            }, itemCount: widget.model.kitFeatures.length, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),),
          )
        ],
      ),
    );
  }
  Widget _buildRatingRow(String text, ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.sp),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        // runAlignment: WrapAlignment.start,
        // alignment: WrapAlignment.start,
        children: [
          const Icon(Icons.check, color: Colors.red,),
          Expanded(
            flex: 1,
            child: Text(
              '$text: ',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
