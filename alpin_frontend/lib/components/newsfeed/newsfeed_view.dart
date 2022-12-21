import 'package:alpin_frontend/components/base_widget.dart';
import 'package:alpin_frontend/components/newsfeed/newsfeed_model.dart';
import 'package:alpin_frontend/model/youtube_data.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:alpin_frontend/widgets/youtube_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewsfeedView extends StatelessWidget implements BaseWidget{

  @override
  String getAppBarName(context) => translation(context).news;

  const NewsfeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<NewsfeedModel>.reactive(
        viewModelBuilder: () => NewsfeedModel(context),
        builder: (context, model, child) {
          return Padding(padding: const EdgeInsets.all(5),
            child: FutureBuilder(
              initialData: const <YoutubeData>[],
              future: model.getVideosFromChannel(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final list = snapshot.data as dynamic;
                  if(list == null || list?.length == 0)
                    return Center(child: Text(translation(context).foundNoContent));
                  var i = list.map((e) => YoutubeCard(data: e as YoutubeData)) as List<Widget>;
                  return Column(children: i);
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      );


}
