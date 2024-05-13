import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zambotourapp/Component/text_widget.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        child: Column(
          children: [
            Flexible(
                flex: 1,
                child: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: SvgPicture.asset('./assets/logo/logo.svg'),
                )),
            Flexible(
                flex: 2,
                child: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Column(
                      children: const [
                        TextWidget(
                          title:
                              "By aggreeing with the terms and condition of zambo tour app you aggree to give your basic information "
                              "full name, contact and photo profile this for may use only for your application profile "
                              "zamboanga tour app will not use or acccess any of your data for."
                              "\n\n Zambo tour app will only delivery of viewing tourist spots hotels and restaurant and "
                              "allowing users to interact with the application by getting the location of areas "
                              "and a provide a navigation feature to users for them to have guidance to "
                              "traveling within the City of Zamboanga, any islands travel will be redirect to "
                              "tourism agency of Zamboanga city",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
