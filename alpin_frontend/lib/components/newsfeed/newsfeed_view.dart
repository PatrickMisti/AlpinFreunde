import 'package:alpin_frontend/components/base_widget.dart';
import 'package:alpin_frontend/components/newsfeed/newsfeed_model.dart';
import 'package:alpin_frontend/model/youtube_data.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:alpin_frontend/widgets/customSliverAppBar.dart';
import 'package:alpin_frontend/widgets/youtube_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewsfeedView extends StatelessWidget implements BaseWidget {
  @override
  String getAppBarName(context) => translation(context).news;

  const NewsfeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<NewsfeedModel>.reactive(
        viewModelBuilder: () => NewsfeedModel(context),
        builder: (context, model, child) {
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(title: getAppBarName(context)),
              SliverFillRemaining(
                child: FutureBuilder(
                  initialData: const <YoutubeData>[],
                  future: model.getVideosFromChannel(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final list = snapshot.data as List<YoutubeData>?;
                      if (list == null || list.isEmpty)
                        return Center(
                            child: Text(translation(context).foundNoContent));
                      return ListView(
                          children: [for (var i in list) YoutubeCard(data: i)]);
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              )
            ],
          );
        },
      );
}
