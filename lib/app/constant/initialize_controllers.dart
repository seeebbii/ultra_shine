import 'package:get/get.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/controller/navigation/navigation_controller.dart';

class InitializeControllers{

  static void init(){
    Get.put(NavigationController());
  }

  static void dispose(){
    // navigationController.dispose();
  }

}