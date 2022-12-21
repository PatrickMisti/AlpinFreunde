
import 'package:alpin_frontend/model/youtube_data.dart';
import 'package:flutter/material.dart';

class YoutubeCard extends StatelessWidget {
  final YoutubeData data;
  const YoutubeCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(data.thumbnail)
        ],
      ),
    );
  }
}
