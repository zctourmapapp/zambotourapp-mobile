import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:zambotourapp/Hotel/controller/hotel_controller.dart';
import 'package:zambotourapp/Hotel/Model/hotel_model.dart';
import 'package:zambotourapp/Hotel/View/hotel_detail_screen.dart';
import 'package:zambotourapp/Component/text_widget.dart';
import 'package:zambotourapp/Component/custom_header.dart';

class Hotel extends StatelessWidget {
  const Hotel({Key? key}) : super(key: key);

  static const routeName = '/hotels';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const CustomHeader(title: 'Hotels'),
          _HotelMasonryGrid(
            width: Get.width,
          ),
        ],
      ),
    );
  }
}

class _HotelMasonryGrid extends GetView<HotelController> {
  const _HotelMasonryGrid({
    Key? key,
    this.masonryCardHeights = const [200, 250, 300],
    required this.width,
  }) : super(key: key);

  final List<double> masonryCardHeights;
  final double width;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      itemCount: controller.list.length,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) {
        HotelModel hotel = controller.list[index];
        return _buildActivityCard(
          context,
          hotel,
          index,
        );
      },
    );
  }

  InkWell _buildActivityCard(
    BuildContext context,
    HotelModel hotel,
    int index,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailsScreen(hotel: hotel),
          ),
        );
      },
      child: Hero(
        tag: '${hotel.id}_${hotel.title}',
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: SizedBox(
            height: masonryCardHeights[index % 3],
            child: Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  height: masonryCardHeights[index % 3],
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(hotel.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: Get.width,
                      height: 30,
                      color: Colors.white54,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 6),
                        child: TextWidget(
                          title: hotel.title.length > 18
                              ? '${hotel.title.substring(0, 18)} . . .'
                              : hotel.title,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
