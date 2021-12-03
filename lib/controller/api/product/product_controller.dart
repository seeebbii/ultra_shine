import 'package:get/get.dart';
import 'package:ultra_shine/app/api/api_client.dart';
import 'package:ultra_shine/models/home/product_model.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  var productModel = <ProductsModel>[].obs;
  var selectedProduct = ProductsModel().obs;
  // RxInt coins = 0.obs;
  // var optionSelected = false.obs;
  // var productSelected = false.obs;

  void getProductList() async {
    productModel.value = await ApiClient.productService.getProduct();
  }

  @override
  void onInit() {
    getProductList();
    super.onInit();
  }
}
