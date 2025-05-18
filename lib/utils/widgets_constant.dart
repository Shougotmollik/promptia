import 'package:flutter/material.dart';
import 'package:get/get.dart';

void getSnack(String title, String message) => Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(18),
    );
