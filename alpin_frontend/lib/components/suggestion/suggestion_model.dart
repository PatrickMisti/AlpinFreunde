import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/components/suggestion/add_suggestion/add_suggestion_view.dart';
import 'package:alpin_frontend/model/trip_suggestion.dart';
import 'package:alpin_frontend/utilities/mock/MockData.dart';
import 'package:flutter/material.dart';

/// [loadingSuggestions] is own task to load all information's from server
///
/// [showDialogSuggestion] pop new dialogWidget to add new suggestion
class SuggestionModel extends BaseModel {
  late List<TripSuggestion> list;
  bool isLoading = false;
  bool isAdmin = false; // review get this permission from server

  SuggestionModel(BuildContext context) : super(context) {
    list = [];
    loadingSuggestions();
  }

  Future<List<TripSuggestion>> loadingSuggestions() async {
    // todo make call
    // finished isLoading true;
    // if error show not found error on view
    await Future.delayed(Duration(seconds: 1));
    list.addAll(MockData.TRIP_SUGGESTIONS);
    isLoading = list.isNotEmpty;
    return list;
  }

  showDialogSuggestion() async {
    final test = await showDialog(
        context: context, builder: (context) => const AddSuggestionView());
    // review: add to TripSuggestion and save to backend
  }

  editSuggestion(TripSuggestion trip) {}

  deleteSuggestionById(int id) {}
}
