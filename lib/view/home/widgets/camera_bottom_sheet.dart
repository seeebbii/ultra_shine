import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/view/components/auth_social_button.dart';

class CameraBottomSheet extends StatelessWidget {
  const CameraBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();

    return SingleChildScrollView(
      child: Container(
        height: 0.5.sh,
        width: double.infinity.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 8,
              blurRadius: 20,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.05.sh,
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 21.sp, vertical: 15.sp),
                  child: Image.asset(ImagePaths.questionMark),
                ),
              ),
              SizedBox(
                height: 0.01.sh,
              ),
              Text(
                "Choose One",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontSize: 25.sp),
              ),
              SizedBox(
                height: 0.01.sh,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.sp),
                child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 12.sp),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 0.05.sh,
              ),
              Row(
                children: [
                  AuthSocialButton(
                    onPressed: () async {
                      debugPrint("Image Capture");

                      // Capture a photo

                      final XFile? photo =
                          await _picker.pickImage(source: ImageSource.camera);

                      print(photo?.path.toString());
                      if (photo != null) {
                        requestController.assets.add(photo);
                        navigationController.goBack();
                        navigationController.goBack();
                      }
                    },
                    socialName: 'Capture Image',
                    imagePath: ImagePaths.cameraIcon,
                    backGroundColor: Colors.white,
                    textColor: primaryColor,
                    elevation: 8,
                  ),
                  AuthSocialButton(
                    onPressed: () async {
                      debugPrint("Video Capture");

                      // Capture a video
                      final XFile? video =
                          await _picker.pickVideo(source: ImageSource.camera);

                      print(video?.path.toString());
                      if (video != null) {
                        requestController.assets.add(video);
                        navigationController.goBack();
                        navigationController.goBack();
                      }
                    },
                    socialName: 'Capture Video',
                    imagePath: ImagePaths.galleryIcon,
                    backGroundColor: Colors.white,
                    textColor: primaryColor,
                    elevation: 8,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
