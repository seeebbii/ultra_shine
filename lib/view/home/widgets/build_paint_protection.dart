import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/models/home/paint_protection_models.dart';

class BuildPaintProtection extends StatefulWidget {
  final PaintProtectionModel model;

  const BuildPaintProtection({Key? key, required this.model}) : super(key: key);

  @override
  _BuildPaintProtectionState createState() => _BuildPaintProtectionState();
}

class _BuildPaintProtectionState extends State<BuildPaintProtection> {
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
                    image: AssetImage(ImagePaths.paint), fit: BoxFit.cover),
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
            child: Text('${widget.model.title}',
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
          SizedBox(height: 0.01.sh),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 3.sp),
            child: Container(
              height: 0.15.sh,
              child: ListView(
                children: [
                  _buildRatingRow('Durability', widget.model.durability!.toDouble()),
                  _buildRatingRow('Ease of Application', widget.model.easeOfApplication!.toDouble()),
                  _buildRatingRow('Sickness', widget.model.slickness!.toDouble()),
                  _buildRatingRow('Gloss', widget.model.gloss!.toDouble()),
                  _buildRatingRow('Price', widget.model.price!.toDouble()),
                ],
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRatingRow(String text, double initialRating) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.sp),
      child: Row(
        // runAlignment: WrapAlignment.start,
        // alignment: WrapAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '$text: ',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 12.sp),
            ),
          ),
          Expanded(
            flex: 1,
            child: RatingBar.builder(
              initialRating: initialRating,
              minRating: 1,
              itemSize: 12.sp,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: primaryColor,
              ),
              onRatingUpdate: (rating) {
                debugPrint(rating.toString());
              },
            ),
          )
        ],
      ),
    );
  }
}
