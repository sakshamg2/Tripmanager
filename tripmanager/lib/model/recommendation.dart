// To parse this JSON data, do
//
//     final recommendationResponse = recommendationResponseFromJson(jsonString);

import 'dart:convert';

RecommendationResponse recommendationResponseFromJson(String str) =>
    RecommendationResponse.fromJson(json.decode(str));

String recommendationResponseToJson(RecommendationResponse data) =>
    json.encode(data.toJson());

class RecommendationResponse {
  final int id;
  final String query;
  final List<Recommendation> recommendations;
  final int user;

  RecommendationResponse({
    required this.id,
    required this.query,
    required this.recommendations,
    required this.user,
  });

  factory RecommendationResponse.fromJson(Map<String, dynamic> json) =>
      RecommendationResponse(
        id: json["id"],
        query: json["query"],
        recommendations: List<Recommendation>.from(
            json["response"].map((x) => Recommendation.fromJson(x))),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "query": query,
        "response":
            List<Recommendation>.from(recommendations.map((x) => x.toJson())),
        "user": user,
      };
}

class Recommendation {
  final String name;
  final String description;
  final double longitude;
  final double latitude;
  final String address;
  final String link;

  Recommendation({
    required this.name,
    required this.description,
    required this.longitude,
    required this.latitude,
    required this.address,
    required this.link,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) => Recommendation(
        name: json["name"],
        description: json["description"],
        longitude: json["Longitude"]?.toDouble(),
        latitude: json["Latitude"]?.toDouble(),
        address: json["Address"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "Longitude": longitude,
        "Latitude": latitude,
        "Address": address,
        "Link": link,
      };
}
