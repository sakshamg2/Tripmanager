import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tripmanager/model/recommendation.dart';
import 'package:http/http.dart' as http;
import 'package:tripmanager/pages/recommendation_details.dart';

List<RecommendationResponse> recommendationResponseFromJson(String str) =>
    List<RecommendationResponse>.from(
        json.decode(str).map((x) => RecommendationResponse.fromJson(x)));

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  Future<List<RecommendationResponse>?> getHistoryRecommendation() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id');
      var url = Uri.parse(
          'http://127.0.0.1:8000/api/recommendation/history/${userId}/');

      final token = prefs.getString('token');
      http.Response response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
      );

      // List<RecommendationResponse> jsonResponse = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // print(jsonResponse);
        // RecommendationResponse recommendationResponse =
        //     RecommendationResponse.fromJson(jsonResponse);
        // print(recommendationResponse.toJson());
        // return recommendationResponse.recommendations;
        // return jsonResponse;
        print(recommendationResponseFromJson(response.body));
        return recommendationResponseFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<RecommendationResponse>?>(
          future: getHistoryRecommendation(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final history = snapshot.data![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        history.query,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: history.recommendations
                            .map((recommendation) => ListTile(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RecommendationDetails(
                                        recommendation: recommendation,
                                      ),
                                    ),
                                  ),
                                  title: Text(recommendation.name),
                                  subtitle: Text(
                                    recommendation.description,
                                    maxLines: 3,
                                  ),
                                ))
                            .toList(),
                      ),
                      const Divider()
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
          },
        ),
      ),
    );
  }
}
