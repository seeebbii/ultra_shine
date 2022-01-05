import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/models/home/product_model.dart';

class BuildProduct extends StatefulWidget {
  final ProductsModel model;
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
            // decoration:

            //  BoxDecoration(
            //     image: const DecorationImage(
            //         image: AssetImage(ImagePaths.productTire),
            //         fit: BoxFit.cover),
            //     border: Border.all(
            //       width: 1.3,
            //       color: Colors.black,
            //     ),
            //     borderRadius: const BorderRadius.all(Radius.circular(12))),
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
                        color: widget.model.isSelected!
                            ? Colors.red
                            : Colors.white,
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
            child: Text('${widget.model.name}',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(fontSize: 15.sp)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 3.sp),
            child: Text('${widget.model.description}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 10.sp)),
          ),
        ],
      ),
    );
  }

  ClipRRect buildPaintworktypes() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: CachedNetworkImage(
          fadeInCurve: Curves.easeIn,
          fadeInDuration: const Duration(milliseconds: 1500),
          imageUrl: widget.model.image.toString(),
          fit: BoxFit.cover,
        ));
  }
}
