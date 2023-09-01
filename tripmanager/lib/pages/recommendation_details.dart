import 'package:flutter/material.dart';
import 'package:tripmanager/model/recommendation.dart';

class RecommendationDetails extends StatelessWidget {
  final Recommendation recommendation;

  const RecommendationDetails({super.key, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(recommendation.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              recommendation.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(recommendation.description),
            Text(recommendation.link)
          ],
        ),
      ),
    );
  }
}
