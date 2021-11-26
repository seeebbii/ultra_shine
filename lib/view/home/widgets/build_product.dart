import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/models/home/product_model.dart';

class BuildProduct extends StatefulWidget {
  final ProductModel model;
  const BuildProduct({Key? key, required this.model}) : super(key: key);

  @override
  _BuildProductState createState() => _BuildProductState();
}

class _BuildProductState extends State<BuildProduct> {
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
                    image: AssetImage(ImagePaths.productTire), fit: BoxFit.cover),
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
            padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 3.sp),
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
                    ?.copyWith(fontSize: 10.sp)),
          ),
        ],
      ),
    );
  }
}
