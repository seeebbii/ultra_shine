import 'package:ultra_shine/controller/api/films/films_controller.dart';
import 'package:ultra_shine/controller/api/paint_protection/paint_protection_controller.dart';
import 'package:ultra_shine/controller/api/product/product_controller.dart';
import 'package:ultra_shine/controller/api/request/polish_type/polish_type_controller.dart';
import 'package:ultra_shine/controller/api/request/request_controller.dart';
import 'package:ultra_shine/controller/api/vehicle_paintwork/vehicle_paintwork.dart';
import 'package:ultra_shine/controller/api/vehicle_type/vehicle_type_controller.dart';
import 'package:ultra_shine/controller/navigation/navigation_controller.dart';
import 'package:ultra_shine/controller/payment/payment_controller.dart';
import 'package:ultra_shine/controller/stepper/stepper_controller.dart';

NavigationController navigationController = NavigationController.instance;
StepperController stepperController = StepperController.instance;
VehicleTypeController vehicleTypeController = VehicleTypeController.instance;
VehiclePaintWorkController vehiclePaintWorkController =
    VehiclePaintWorkController.instance;
PolishTypeController polishTypeController = PolishTypeController.instance;
FilmsController filmsController = FilmsController.instance;
RequestController requestController = RequestController.instance;
PaintProtectionController paintProtectionController =
    PaintProtectionController.instance;
ProductController productController = ProductController.instance;
PaymentController paymentController = PaymentController.instance;
