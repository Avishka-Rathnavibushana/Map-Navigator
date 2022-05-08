import 'dart:convert';

MapRoute mapRouteFromJson(String str) => MapRoute.fromJson(json.decode(str));

String mapRouteToJson(MapRoute data) => json.encode(data.toJson());

class MapRoute {
  MapRoute({
    required this.name,
    required this.dificulty,
    required this.distance,
    required this.elevation,
    required this.time,
    required this.start,
    required this.suitability,
    required this.link,
    required this.image,
  });

  String name;
  String dificulty;
  String distance;
  String elevation;
  String time;
  String start;
  String suitability;
  String link;
  String image;

  factory MapRoute.fromJson(Map<String, dynamic> json) => MapRoute(
        name: json["name"],
        dificulty: json["dificulty"],
        distance: json["distance"],
        elevation: json["elevation"],
        time: json["time"],
        start: json["start"],
        suitability: json["suitability"],
        link: json["link"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "dificulty": dificulty,
        "distance": distance,
        "elevation": elevation,
        "time": time,
        "start": start,
        "suitability": suitability,
        "link": link,
        "image": image,
      };
}
