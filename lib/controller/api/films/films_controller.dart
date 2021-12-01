import 'package:get/get.dart';
import 'package:ultra_shine/app/api/api_client.dart';
import 'package:ultra_shine/models/films_model.dart';

class FilmsController extends GetxController {
  static FilmsController instance = Get.find();
  var filmsModel = <FilmsModel>[].obs;

  void getFilmsList() async{
    filmsModel.value = await ApiClient.filmsServices.getFilmsServices();
  }

  @override
  void onInit() {
    getFilmsList();
    super.onInit();
  }

}