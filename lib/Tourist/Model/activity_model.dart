import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zambotourapp/util/geopoint_convertion.dart';
import 'package:zambotourapp/util/num_convertion.dart';

class Activity {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double rating;
  final LatLng location;

  const Activity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.location,
  });

  Activity.fromJson(Map<String, dynamic> res, String id)
      : this(
          id: id,
          title: res['title'] as String,
          description: res['description'] as String,
          imageUrl: res['imageUrl'] as String,
          rating: convertRating(res['rating']),
          location: convertGeoPoint(res['location'] as GeoPoint),
        );

  static const List<Activity> activities = [
    Activity(
      id: '1',
      title: 'Paseo Del Mar',
      description:
          'While you’re strolling along the walkway of Paseo del Mar, you’ll notice that time here is slow people seem to be in no rush and they take the time to bask in the beautiful seascape facing the park. There’s a myriad of attractions here tribe people serenading visitors, colourful boats passing by, and locals known as Badjao enticing the crowd as they show their diving tricks.',
      imageUrl: 'https://i.ibb.co/3rb2nky/Paseo-del-mar.jpg',
      rating: 4,
      location: LatLng(6.9006, 122.0614),
    ),
    Activity(
      id: '2',
      title: 'Fort-Pilar',
      description:
          'The Real Fuerte de Nuestra Señora del Pilar de Zaragoza, also Fort Pilar, is a 17th-century military defense fortress built by the Spanish colonial government in Zamboanga City',
      imageUrl: 'https://i.ibb.co/3C4d1TF/Fort-Pilar.jpg',
      rating: 4,
      location: LatLng(122.0813, 32.56484),
    ),
    Activity(
      id: '3',
      title: 'Taluksangay Mosque',
      description:
          'The Taluksangay Mosque was built by Hadji Abdullah Maas Nuno in 1885 in the Barangay Taluksangay, Zamboanga, the Philippines. It is the oldest mosque in Western Mindanao. Taluksangay was the first center of Islamic propagation in the Zamboanga Peninsula.',
      imageUrl: 'https://i.ibb.co/n3Fvx1x/Taluksangay-Mosque2.jpg',
      rating: 4,
      location: LatLng(122.0813, 6.9006),
    ),
    Activity(
      id: '4',
      title: 'Zamboanga City Hall',
      description:
          'The Zamboanga City Hall is the seat of the local government of Zamboanga City. The National Historical Commission of the Philippines considers the city hall building as a National Historical Site.',
      imageUrl: 'https://i.ibb.co/GsgQDJC/City-hall2.jpg',
      rating: 4,
      location: LatLng(122.0813, 6.9006),
    ),
    Activity(
      id: '5',
      title: '11 Islands(Once Islas)',
      description:
          'A group of 11 islands located on the Moro Gulf coast are known collectively as the Eleven Islands, Cabugan Island (approx. 11 hectares) is the largest of them.',
      imageUrl:
          'https://i.ibb.co/yVz1LDp/FB-IMG-1666153740163.jpg" alt="FB-IMG-1666153740163',
      rating: 5,
      location: LatLng(122.0813, 6.9006),
    ),
    Activity(
      id: '6',
      title: 'Sta. Cruz Island',
      description:
          'Great Santa Cruz Island is a small inhabited island in Zamboanga City in the southern region of the Philippines that is famous for its pink coralline sand. The island, located 4 kilometres south of downtown at the Santa Cruz Bank in the Basilan Strait, boasts one of the pink sand beaches in the Philippines.',
      imageUrl: 'https://i.ibb.co/Sd4NphF/FB-IMG-1666154228344.jpg',
      rating: 4,
      location: LatLng(122.0813, 6.9006),
    ),
    Activity(
      id: '7',
      title: 'Zamboanga Historical Museum',
      description:
          'Zamboanga city earned the moniker “Asia’s Latin City”, old colonial edifices that are great reminders of the Spanish colonial era are still well-preserved here and are great tourist attractions. Chavacano is the only Spanish-based creole in Asia and one of the oldest creole languages in the world.',
      imageUrl: 'https://i.ibb.co/4myMgzK/Museum.jpg',
      rating: 4,
      location: LatLng(122.0813, 6.9006),
    ),
    Activity(
      id: '8',
      title: 'Merloquet Falls',
      description:
          'This scenic waterfall is a rising destination located in the interiors of barangay Sibulao, some 78 kilometers east of the city. If you have a day to spare in Zamboanga City and are into nature hikes and outdoor activities, this should definitely be on your must-do list.',
      imageUrl: 'https://i.ibb.co/DM6szdv/Merloquet-Falls.jpg',
      rating: 4,
      location: LatLng(122.0813, 6.9006),
    ),
    Activity(
      id: '9',
      title: 'Yakan Village',
      description:
          'Originally indigenous Muslim settlers of Basilan, the Yakans known for their vibrant geometric weaving creations and distinct traditional practices began migrating to mainland Mindanao in the early 1970s. A significant number settled in Zamboanga City. The Yakan Village in Zamboanga was established to showcase their weaving art and other traditions to preserve their culture.',
      imageUrl: 'https://i.ibb.co/7RzM67f/Yakan-weaving.jpg',
      rating: 4,
      location: LatLng(122.0813, 6.9006),
    ),
  ];
}
