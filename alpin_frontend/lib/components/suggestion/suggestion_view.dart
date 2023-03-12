import 'package:alpin_frontend/components/base_widget.dart';
import 'package:alpin_frontend/components/suggestion/suggestion_model.dart';
import 'package:alpin_frontend/model/trip_suggestion.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:alpin_frontend/widgets/customSliverAppBar.dart';
import 'package:alpin_frontend/widgets/suggestion_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// suggestionView to show all past tours so other people maybe get inspired
///
/// visibility act on loading tourSuggestions from server
/// append [isLoading] variable
class SuggestionView extends StatelessWidget implements BaseWidget {
  @override
  String getAppBarName(context) => translation(context).tourSuggestion;

  const SuggestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<SuggestionModel>.reactive(
        viewModelBuilder: () => SuggestionModel(context),
        builder: (context, model, child) {
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(title: getAppBarName(context)),
              SliverFillRemaining(
                child: FutureBuilder(
                  future: model.loadingSuggestions(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var list = snapshot.data as List<TripSuggestion>;
                      if (list == null || list.isEmpty)
                        return Center(
                            child: Text(translation(context).foundNoContent));
                      return ListView(
                        children: [
                          for (var item in list)
                            SuggestionWidget(
                                suggestion: item,
                                isAdmin: model.isAdmin,
                                deleteById: model.deleteSuggestionById,
                                editSuggestion: model.editSuggestion)
                        ],
                      );
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
