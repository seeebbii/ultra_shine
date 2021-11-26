import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/models/home/exterior_card_model.dart';

class BuildExteriorCard extends StatefulWidget {
  final ExteriorCardModel model;

  const BuildExteriorCard({Key? key, required this.model}) : super(key: key);

  @override
  _BuildExteriorCardState createState() => _BuildExteriorCardState();
}

class _BuildExteriorCardState extends State<BuildExteriorCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0.sp),
      child: Card(
        elevation: 8,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned(
              left: 0.01.sw,
              top: 0.01.sh,
              child: Container(
                height: 20.sp,
                width: 20.sp,
                decoration: BoxDecoration(
                    color:
                        widget.model.value! ? Colors.red : Colors.transparent,
                    border: Border.all(color: Colors.grey.shade500, width: 1.5),
                    shape: BoxShape.circle),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 25.sp, vertical: 20.sp),
                    title: Text(
                      "${widget.model.titleText}",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: Colors.black, fontSize: 15.sp),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 8.sp),
                      child: Text(
                        "${widget.model.subTitleText}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontSize: 10.sp),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.sp),
                    child: Visibility(
                      visible: widget.model.value!,
                      child: Container(
                        height: 0.05.sh,
                        child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  widget.model.exteriorOptions
                                      .forEach((opt) => opt.selected = false);
                                  widget.model.exteriorOptions[index].selected =
                                      true;
                                });
                              },
                              child: Card(
                                color: widget
                                        .model.exteriorOptions[index].selected!
                                    ? Colors.red
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                elevation: 8,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.sp, vertical: 5.sp),
                                  child: Text(
                                    "${widget.model.exteriorOptions[index].packageName}: \$${widget.model.exteriorOptions[index].price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                            color: widget
                                                    .model
                                                    .exteriorOptions[index]
                                                    .selected!
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: widget.model.exteriorOptions.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.02.sh,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
