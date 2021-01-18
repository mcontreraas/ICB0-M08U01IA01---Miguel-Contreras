import 'dart:convert';

List<Player> PlayerFromJson(String str) =>
    List<Player>.from(json.decode(str).map((x) => Player.fromJson(x)));

String playerToJson(List<Player> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Player {
  int number;
  String image;
  String name;
  String position;
  String lastseen;
  String country;

  Player({
    this.number,
    this.image,
    this.name,
    this.position,
    this.lastseen,
    this.country,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        number: json["number"],
        image: json["image"],
        name: json["name"],
        position: json["position"],
        lastseen: json["lastseen"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "image": image,
        "name": name,
        "position": position,
        "lastseen": lastseen,
        "country": country,
      };
}
