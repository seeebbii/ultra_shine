import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class StepperController extends GetxController {
  static StepperController instance = Get.find();

  Rx<int> currentPage = 0.obs;
  final pageViewController = PageController(initialPage: 0, keepPage: true);

  void animateToPage(int index) {
    pageViewController.animateToPage(index,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  void toNextPage(){
    currentPage.value = currentPage.value + 1;
    pageViewController.animateToPage(currentPage.value,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  void toPreviousPage(){
    currentPage.value = currentPage.value - 1;
    pageViewController.animateToPage(currentPage.value,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

}
