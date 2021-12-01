import 'package:ultra_shine/app/api/services/polishing_service.dart';
import 'package:ultra_shine/app/api/services/vehicle_type_service.dart';
import 'package:ultra_shine/models/home/polishing_types.dart';

import 'services/auth_service.dart';

class ApiClient{

  static AuthService get authService => AuthService();
  static VehicleTypeService get vehicleTypeService => VehicleTypeService();
  static PolishingTypeService get polishTypeService => PolishingTypeService();

}