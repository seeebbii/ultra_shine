import 'package:flutter/cupertino.dart';

class ImagePaths {
  static const String ICON_PATH = "assets/icons";
  static const String IMAGES_PATH = "assets/images";

  // TODO :: ICONS
  static const String ultraShineLogo = "$ICON_PATH/logo-ultra-shine.png";
  static const String facebookIcon = "$ICON_PATH/facebook.png";
  static const String google = "$ICON_PATH/google.png";
  static const String backArrow = "$ICON_PATH/back_arrow.png";

  static const String exteriorCar = "$ICON_PATH/exterior_car.png";
  static const String interiorSeat = "$ICON_PATH/interior_seat.png";

  static const String questionMark = "$ICON_PATH/question.png";
  static const String cameraIcon = "$ICON_PATH/camera_icon.png";
  static const String galleryIcon = "$ICON_PATH/gallery_icon.png";
  static const String payPal = "$ICON_PATH/paypal.png";
  static const String stripeIcons = "$ICON_PATH/stripe_icons.png";
 static const String loadingIcon="$ICON_PATH/index.png";


  static const String drawerProfile = "$ICON_PATH/profile.png";
  static const String noteIconAppointment = "$ICON_PATH/note_icon_apt.png";

// TODO :: IMAGES
  static const String mainSplash = "$IMAGES_PATH/splash.png";
  static const String onBoardWelcome1 = "$IMAGES_PATH/onboard-welcome1.png";
  static const String onBoardWelcome2 = "$IMAGES_PATH/onboard-welcome2.png";
  static const String onBoardWelcome3 = "$IMAGES_PATH/onboard-welcome3.png";

  static const String typeJeep = "$IMAGES_PATH/jeep.png";
  static const String typeLarge = "$IMAGES_PATH/large.png";
  static const String typeMedium = "$IMAGES_PATH/medium.png";
  static const String typeSmall = "$IMAGES_PATH/small-car.png";
  static const String tireBackground = "$IMAGES_PATH/T.png";

  static const String ptDeep = "$IMAGES_PATH/pt_deep.jpg";
  static const String ptLarge = "$IMAGES_PATH/pt_large.jpg";
  static const String ptLight = "$IMAGES_PATH/pt_light.jpg";
  static const String ptNew = "$IMAGES_PATH/pt_new.jpg";

  static const String productTire = "$IMAGES_PATH/product_tire.jpg";
  static const String paint = "$IMAGES_PATH/paint.jpg";
  static const String kit = "$IMAGES_PATH/kit.jpg";

  static const String sliderIcon = "$IMAGES_PATH/slider_icon.png";
  static const String sliderCircularDotIcon =
      "$IMAGES_PATH/slider_circular_dot.png";
  static const String sliderRedDot = "$IMAGES_PATH/slider_red_dot.png";
  static const String uploadImage = "$IMAGES_PATH/upload_image.png";

  static void preCacheImages(BuildContext context) {
    precacheImage(const AssetImage(ImagePaths.ultraShineLogo), context);
    precacheImage(const AssetImage(ImagePaths.mainSplash), context);
    precacheImage(const AssetImage(ImagePaths.onBoardWelcome1), context);
    precacheImage(const AssetImage(ImagePaths.onBoardWelcome2), context);
    precacheImage(const AssetImage(ImagePaths.onBoardWelcome3), context);
  }
}
