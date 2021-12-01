import 'package:ultra_shine/app/api/services/polishing_service.dart';
import 'package:ultra_shine/app/api/services/films_service.dart';
import 'package:ultra_shine/app/api/services/vehicle_type_service.dart';
import 'services/auth_service.dart';
import 'services/request_service.dart';

class ApiClient {
  static AuthService get authService => AuthService();
  static VehicleTypeService get vehicleTypeService => VehicleTypeService();
  static PolishingTypeService get polishTypeService => PolishingTypeService();
  static FilmServices get filmsServices => FilmServices();
  static RequestService get postRequest => RequestService();
}
