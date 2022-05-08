import 'dart:convert';

import 'package:map_navigator/src/modals/route.dart';

Place placeFromJson(String str) => Place.fromJson(json.decode(str));

String placeToJson(Place data) => json.encode(data.toJson());

class Place {
  Place({
    required this.image,
    required this.place,
    required this.routes,
  });

  String place;
  String image;
  List<MapRoute> routes;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        place: json["place"],
        image: json["image"],
        routes: List<MapRoute>.from(
            json["routes"].map((x) => MapRoute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "place": place,
        "image": image,
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
      };
}
