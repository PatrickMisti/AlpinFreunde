
import 'package:alpin_frontend/model/BaseEntity.dart';

class YoutubeData implements BaseEntity {
  final String videoId;
  final String title;
  final String description;
  final String thumbnail;
  final DateTime publishedTime;

  YoutubeData({required this.videoId,required this.title,required this.description,required this.publishedTime,required this.thumbnail});

  @override
  fromJson(Map<String, dynamic> json) {
    return YoutubeData(
        videoId: json['videoId'], 
        title: json['title'], 
        description: json['description'], 
        publishedTime: DateTime.parse(json['publishedTime']),
        thumbnail: json['thumbnail']);
  }
}