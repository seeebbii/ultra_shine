import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildVehicleType extends StatefulWidget {
  final String imagePath;
  final String carText;
  final bool value;
  final int index;

  const BuildVehicleType(
      {Key? key,
      required this.imagePath,
      required this.carText,
      required this.value,
      required this.index})
      : super(key: key);

  @override
  State<BuildVehicleType> createState() => _BuildVehicleTypeState();
}

class _BuildVehicleTypeState extends State<BuildVehicleType> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0.sp),
      child: Container(
        height: 0.15.sh,
        width: 0.4.sw,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1.3,
              color: widget.value ? Colors.red : Colors.black,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Stack(
          children: [
            Positioned(
              left: 0.01.sw,
              top: 0.01.sh,
              child: Container(
                height: 20.sp,
                width: 20.sp,
                decoration: BoxDecoration(
                  color: widget.value ? Colors.red : Colors.transparent,
                    border: Border.all(color: Colors.grey.shade300, width: 2.5),
                    shape: BoxShape.circle),
              ),
            ),
            Positioned.fill(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
              ),
            )),
            Container(
              margin: const EdgeInsets.all(5),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    widget.carText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 10.sp),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
