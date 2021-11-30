import 'package:ultra_shine/app/api/services/vehicle_type_service.dart';

import 'services/auth_service.dart';

class ApiClient{

  static AuthService get authService => AuthService();
  static VehicleTypeService get vehicleTypeService => VehicleTypeService();

}