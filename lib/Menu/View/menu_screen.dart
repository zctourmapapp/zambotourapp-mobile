import 'package:flutter/material.dart';
import 'package:zambotourapp/Account/Controller/authentication_controller.dart';
import 'package:zambotourapp/Component/text_widget.dart';
import 'package:get/get.dart';

class MenuScreen extends GetView<Authentication> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        flexibleSpace: Container(
          width: Get.width,
          height: 25,
          color: Colors.orange,
        ),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Positioned.fill(
              child: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: Get.width,
                        height: Get.height * 0.25,
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: Container(
                              width: Get.width,
                              height: Get.height,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          './assets/images/background-3.jpg'),
                                      fit: BoxFit.cover)),
                              child: Container(
                                width: Get.width,
                                height: Get.height,
                                color: Colors.black12,
                              ),
                            )),
                            Positioned(
                                top: 10,
                                left: 10,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 0.5,
                                            spreadRadius: 0.5)
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100))),
                                    child: Center(
                                      child: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_rounded,
                                            color: Colors.orange,
                                          )),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: SizedBox(
                          width: Get.width,
                          height: Get.height,
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () => Get.toNamed('/account'),
                                leading: const Icon(Icons.person),
                                title: const TextWidget(
                                  title: "Account",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              ListTile(
                                onTap: () => Get.toNamed('/password'),
                                leading: const Icon(Icons.password),
                                title: const TextWidget(
                                  title: "Change password",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              ListTile(
                                onTap: () => Get.toNamed('/travels'),
                                leading: const Icon(Icons.place_rounded),
                                title: const TextWidget(
                                  title: "Travel",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              ListTile(
                                onTap: () => Get.toNamed('/policy'),
                                leading: const Icon(Icons.policy_rounded),
                                title: const TextWidget(
                                  title: "Terms and Condition",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              ListTile(
                                onTap: () => Get.toNamed('/about'),
                                leading: const Icon(Icons.info_outline_rounded),
                                title: const TextWidget(
                                  title: "About",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 30,
                child: SizedBox(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: SizedBox(
                        width: Get.width,
                        height: 40,
                        child: MaterialButton(
                          color: Colors.orange,
                          onPressed: (() => controller.signOut()),
                          child: const TextWidget(
                            title: 'Logout',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
