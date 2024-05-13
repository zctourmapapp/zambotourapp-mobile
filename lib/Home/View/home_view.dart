import 'package:flutter/material.dart';
import 'package:zambotourapp/Tourist/View/tourist_view.dart';
import 'package:zambotourapp/Hotel/View/hotel_view.dart';
import 'package:zambotourapp/Restaurant/View/restuarant_view.dart';
import 'package:zambotourapp/Component/text_widget.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        flexibleSpace: Container(
          width: Get.width,
          height: 35,
          color: Colors.orange,
        ),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, top: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 140,
                      height: 60,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: Image.asset('./assets/weather/02d.png'),
                          ),
                          const SizedBox(width: 5),
                          const TextWidget(
                            title: 'Sunny',
                            fontSize: 18,
                            color: Color.fromARGB(255, 227, 152, 38),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () => Get.toNamed('/menu'),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.orangeAccent,
                            radius: 20,
                            foregroundImage: NetworkImage(
                                'https://tse4.mm.bing.net/th?id=OIP.9xKLi4Z72mYf9cZWCcqI0gHaGI&pid=Api&P=0'),
                            child: TextWidget(
                              title: 'T',
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget(
                        title: "Discover",
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 3.0, right: 3.0, bottom: 3.0),
                            child: Row(
                              children: [
                                TextWidget(
                                  title: 'Zamboanga City'.toUpperCase(),
                                  fontSize: 10,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600,
                                ),
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      controller: tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(text: 'Tourist Spots'),
                        Tab(text: 'Restaurant'),
                        Tab(text: 'Hotels'),
                      ]),
                ),
              ),
              SizedBox(
                  width: double.maxFinite,
                  height: Get.height * 0.709,
                  child: TabBarView(controller: tabController, children: const [
                    Tourist(),
                    Restaurant(),
                    Hotel(),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
