import 'package:flutter/cupertino.dart';

class ImagePaths{
  static const String ICON_PATH = "assets/icons";
  static const String IMAGES_PATH = "assets/images";

  // TODO :: ICONS
  static const String ultraShineLogo = "$ICON_PATH/ultra_shine_logo.png";
  static const String facebookIcon = "$ICON_PATH/facebook.png";
  static const String google = "$ICON_PATH/google.png";


// TODO :: IMAGES
static const String mainSplash = "$IMAGES_PATH/main-splash.jpg";
static const String onBoardWelcome1 = "$IMAGES_PATH/onboard-welcome1.jpg";
static const String onBoardWelcome2 = "$IMAGES_PATH/onboard-welcome2.jpg";
static const String onBoardWelcome3 = "$IMAGES_PATH/onboard-welcome3.jpg";


static const String sliderIcon = "$IMAGES_PATH/slider_icon.png";
static const String sliderCircularDotIcon = "$IMAGES_PATH/slider_circular_dot.png";
static const String sliderRedDot = "$IMAGES_PATH/slider_red_dot.png";






  static void preCacheImages(BuildContext context) {
    precacheImage(const AssetImage(ImagePaths.ultraShineLogo), context);
    precacheImage(const AssetImage(ImagePaths.mainSplash), context);
    precacheImage(const AssetImage(ImagePaths.onBoardWelcome1), context);
    precacheImage(const AssetImage(ImagePaths.onBoardWelcome2), context);
    precacheImage(const AssetImage(ImagePaths.onBoardWelcome3), context);
  }

}