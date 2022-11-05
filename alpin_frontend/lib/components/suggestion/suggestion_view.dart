import 'package:alpin_frontend/components/suggestion/suggestion_model.dart';
import 'package:alpin_frontend/config.dart';
import 'package:alpin_frontend/model/widget/navigation_widget.dart';
import 'package:alpin_frontend/routing.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:alpin_frontend/widgets/suggestion_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// suggestionView to show all past tours so other people maybe get inspired
///
/// visibility act on loading tourSuggestions from server
/// append [isLoading] variable
class SuggestionView extends StatelessWidget {
  const SuggestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<SuggestionModel>.reactive(
        viewModelBuilder: () => SuggestionModel(context),
        builder: (context, model, child) {
          return Scaffold(
            drawer: DrawerWidget(
                content: Config.drawerConfig(context),
                actualRoute: RouterGenerator.suggestionView),
            appBar: AppBar(
              title: Text(translation(context).tourSuggestion),
              actions: [
                IconButton(
                    onPressed: () => model.showDialogSuggestion(),
                    icon: const Icon(Icons.add))
              ],
            ),
            body: Visibility(
              visible: model.isLoading,
              child: ListView.builder(
                itemBuilder: (context, index) => SuggestionWidget(
                  suggestion: model.list[index],
                  isAdmin: model.isAdmin,
                  deleteById: model.deleteSuggestionById,
                  editSuggestion: model.editSuggestion,
                ),
                itemCount: model.list.length,
              ),
              replacement: const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      );
}
