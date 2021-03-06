import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';

class BuildVehiclePaintwork extends StatefulWidget {
  final String imagePath;
  final String carText;
  final bool value;
  final int index;

  const BuildVehiclePaintwork(
      {Key? key,
      required this.imagePath,
      required this.carText,
      required this.value,
      required this.index})
      : super(key: key);

  @override
  _BuildVehiclePaintworkState createState() => _BuildVehiclePaintworkState();
}

class _BuildVehiclePaintworkState extends State<BuildVehiclePaintwork> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0.sp),
      child: Container(
        height: 0.15.sh,
        width: 0.4.sw,
        decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image:true? FadeInImage.assetNetwork(
            //       fadeInCurve: Curves.bounceIn,
            //       placeholder: ImagePaths.backArrow,  image:  widget.imagePath): ,
            //  fit: BoxFit.cover
            //   ),
            border: Border.all(
              width: 1.3,
              color: widget.value ? Colors.red : Colors.black,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Stack(
          children: [
            Positioned.fill(child: buildPaintworktypes()),
            Positioned(
              left: 0.01.sw,
              top: 0.01.sh,
              child: Container(
                height: 25.sp,
                width: 25.sp,
                decoration: BoxDecoration(
                    color: widget.value ? Colors.red : Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 4.5),
                    shape: BoxShape.circle),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    widget.carText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 15.sp, color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect buildPaintworktypes() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: CachedNetworkImage(
          fadeInCurve: Curves.easeIn,
          fadeInDuration: const Duration(milliseconds: 1500),
          imageUrl: widget.imagePath ,fit: BoxFit.cover,
        ));
  }
}
