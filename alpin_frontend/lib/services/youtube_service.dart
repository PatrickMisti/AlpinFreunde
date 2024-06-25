

import 'package:alpin_frontend/model/youtube_data.dart';
import 'package:alpin_frontend/services/service_base.dart';
import 'package:alpin_frontend/utilities/http_wrapper.dart';
import 'package:catcher/catcher.dart';

class YoutubeService extends BaseService{
  late HttpWrapper _httpWrapper;

  YoutubeService():super() {
    _httpWrapper = getIt.get<HttpWrapper>();
  }

  Future<List<YoutubeData>?> getVideoFromChannel() async {
    try {
      List<dynamic> list = await _httpWrapper.getAll('/youtube');

      return list.map((dynamic e) => YoutubeData.fromJson(e)).toList();
    } catch(err, stack) {
      Catcher.reportCheckedError(err, stack);
      return null;
    }
  }
}