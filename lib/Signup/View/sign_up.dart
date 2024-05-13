import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zambotourapp/Account/controller/authentication_controller.dart';
import 'package:zambotourapp/Component/input_widget.dart';
import 'package:zambotourapp/Component/text_widget.dart';
import 'package:get/get.dart';

class Signup extends GetView<Authentication> {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        flexibleSpace: Container(
          width: Get.width,
          height: 35,
          color: Colors.orange,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              Positioned.fill(
                child: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Column(children: [
                    Flexible(
                      flex: 3,
                      child: SizedBox(
                        width: Get.width,
                        height: Get.height * 0.25,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: SizedBox(
                              width: 80,
                              height: 80,
                              child:
                                  SvgPicture.asset('./assets/logo/logo.svg')),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 6,
                        child: SizedBox(
                          width: Get.width,
                          height: Get.height,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: Column(
                              children: [
                                InputWidget(
                                  controller: controller.name,
                                  iconData: Icons.person,
                                  hintText: "Full name",
                                  textInputType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 25),
                                InputWidget(
                                  controller: controller.contact,
                                  iconData: Icons.phone_android_rounded,
                                  hintText: "Contact",
                                  textInputType: TextInputType.phone,
                                ),
                                const SizedBox(height: 25),
                                InputWidget(
                                  controller: controller.email,
                                  iconData: Icons.email,
                                  hintText: "Email",
                                  textInputType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 25),
                                InputWidget(
                                  controller: controller.password,
                                  iconData: Icons.lock,
                                  hintText: "Password",
                                  textInputType: TextInputType.visiblePassword,
                                ),
                                const SizedBox(height: 25),
                                InputWidget(
                                  controller: controller.confirmPassword,
                                  iconData: Icons.lock,
                                  hintText: "Repeat password",
                                  textInputType: TextInputType.visiblePassword,
                                ),
                                const SizedBox(height: 60),
                                SizedBox(
                                  width: Get.width,
                                  height: 40,
                                  child: Obx(
                                    () => MaterialButton(
                                      color: controller.submitState.isTrue
                                          ? const Color.fromARGB(
                                              255, 251, 175, 62)
                                          : Colors.orange,
                                      onPressed: () {
                                        controller.signup();
                                      },
                                      child: controller.submitState.isTrue
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                SizedBox(
                                                  width: 15,
                                                  height: 15,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.grey,
                                                    strokeWidth: 2,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                TextWidget(
                                                  title: 'Submitting',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ],
                                            )
                                          : const TextWidget(
                                              title: 'Register',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                SizedBox(
                                  width: Get.width,
                                  height: 40,
                                  child: MaterialButton(
                                    color: Colors.grey[600],
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const TextWidget(
                                      title: 'Signin',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ]),
                ),
              ),
              Positioned(
                  top: 0,
                  child: Obx(
                    () => controller.authException.value != ''
                        ? Container(
                            width: Get.width,
                            height: 30,
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ]),
                            child: Container(
                              width: Get.width,
                              height: 30,
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.error,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    TextWidget(
                                      title: controller.authException.value,
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  )),
              Positioned(
                  top: 0,
                  child: Obx(
                    () => controller.authSuccess.value != ''
                        ? Container(
                            width: Get.width,
                            height: 30,
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ]),
                            child: Container(
                              width: Get.width,
                              height: 30,
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.check_circle_outline_rounded,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    TextWidget(
                                      title: controller.authException.value,
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
