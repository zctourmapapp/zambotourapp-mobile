import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zambotourapp/Component/clipped_container.dart';

import 'package:zambotourapp/Tourist/Model/activity_model.dart';
import 'package:zambotourapp/Map/View/map_page.dart';
import 'package:get/get.dart';

class ActivityDetailsScreen extends StatelessWidget {
  const ActivityDetailsScreen({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            _ActivityImage(activity: activity),
            _ActivityInformation(activity: activity),
          ],
        ),
      ),
    );
  }
}

class _ActivityImage extends StatelessWidget {
  const _ActivityImage({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ClippedContainer(height: 425),
        Hero(
          tag: '${activity.id}_${activity.title}',
          child: ClippedContainer(imageUrl: activity.imageUrl),
        ),
        Positioned(
            top: 50,
            left: 20,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 0.5, spreadRadius: 0.5)
              ], borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Center(
                  child: IconButton(
                      splashColor: Colors.transparent,
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
    );
  }
}

class _ActivityInformation extends StatelessWidget {
  const _ActivityInformation({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            RatingBar.builder(
              initialRating: activity.rating,
              minRating: 0,
              direction: Axis.horizontal,
              ignoreGestures: true,
              itemCount: 5,
              itemSize: 20,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            const SizedBox(height: 20),
            Text(
              'About',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              activity.description,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RestaurantMapPage(
                                  activity: activity,
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF231955),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Text(
                    'Get Directions',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
