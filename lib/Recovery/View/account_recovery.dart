import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zambotourapp/Account/controller/authentication_controller.dart';
import 'package:zambotourapp/Component/input_widget.dart';
import 'package:zambotourapp/Component/text_widget.dart';

class AccountRecovery extends GetView<Authentication> {
  const AccountRecovery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.orange,
            )),
        title: const TextWidget(
          title: 'Password Recovery',
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      body: SafeArea(
          child: SizedBox(
        child: Stack(
          children: [
            Positioned.fill(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowIndicator();
                  return false;
                },
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height * 0.74,
                    child: Column(
                      children: [
                        SizedBox(
                            width: Get.width,
                            height: Get.height * 0.3,
                            child: Column(
                              children: [
                                Flexible(
                                    flex: 7,
                                    child: SvgPicture.asset(
                                        './assets/logo/logo.svg')),
                                Flexible(
                                    flex: 1,
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        TextWidget(
                                          title:
                                              'A recovery link will be send to your email',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        )
                                      ],
                                    ))),
                              ],
                            )),
                        SizedBox(
                          width: Get.width,
                          height: Get.height * 0.41,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * 0.1,
                                ),
                                InputWidget(
                                  controller: controller.email,
                                  hintText: "Email address",
                                  textInputType: TextInputType.emailAddress,
                                  iconData: Icons.email,
                                ),
                                SizedBox(
                                  height: Get.height * 0.1,
                                ),
                                Container(
                                  width: Get.width,
                                  height: 40,
                                  color: Colors.orange,
                                  child: MaterialButton(
                                    onPressed: () {
                                      controller.sendEmailRecoveryLink();
                                    },
                                    child: const TextWidget(
                                      title: "SUBMIT",
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 0,
                child: Obx(
                  () => controller.authException.value != ""
                      ? Container(
                          width: Get.width,
                          height: 40,
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Flexible(
                                    child: SizedBox(
                                  width: Get.width,
                                  height: 40,
                                  child: Row(children: [
                                    const Icon(
                                      Icons.check_circle_rounded,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    TextWidget(
                                      title: controller.authException.value,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ]),
                                )),
                                IconButton(
                                    splashColor: Colors.transparent,
                                    onPressed: () {
                                      controller.authException.value = '';
                                    },
                                    icon: const Icon(
                                      Icons.close_rounded,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ),
                        )
                      : Container(),
                )),
          ],
        ),
      )),
    );
  }
}
