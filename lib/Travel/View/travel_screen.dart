import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zambotourapp/Component/text_widget.dart';

class TravelScreen extends StatelessWidget {
  const TravelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const TextWidget(
          title: 'Travels',
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.orange,
            )),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
      ),
    );
  }
}
