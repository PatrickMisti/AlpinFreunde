
import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/model/youtube_data.dart';
import 'package:alpin_frontend/services/youtube_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NewsfeedModel extends BaseModel {
  final GetIt getIt = GetIt.I;
  late YoutubeService youtubeService;
  late List<YoutubeData> newsYoutubeData;

  NewsfeedModel(BuildContext context) : super(context) {
    youtubeService = getIt.get<YoutubeService>();
  }

  Future getVideosFromChannel() async {
    final resp = await youtubeService.getVideoFromChannel();
    if (resp == null)
      return newsYoutubeData;

    newsYoutubeData = resp;
    return newsYoutubeData;
  }
}