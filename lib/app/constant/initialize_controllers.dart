import 'package:get/get.dart';
import 'package:ultra_shine/app/constant/controllers.dart';
import 'package:ultra_shine/controller/navigation/navigation_controller.dart';
import 'package:ultra_shine/controller/stepper/stepper_controller.dart';

class InitializeControllers{

  static void init(){
    Get.put(NavigationController());
    Get.put(StepperController());
  }

  static void dispose(){
    // navigationController.dispose();
  }

}