
import 'dart:developer';

import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/components/suggestion/add_suggestion/add_suggestion_view.dart';
import 'package:alpin_frontend/model/trip_suggestion.dart';
import 'package:alpin_frontend/utilities/mock/MockData.dart';
import 'package:flutter/material.dart';

/// [loadingSuggestions] is own task to load all information's from server
///
/// [showDialogSuggestion] pop new dialogWidget to add new suggestion
class SuggestionModel extends BaseModel {
  final BuildContext _context;
  late List<TripSuggestion> list;
  bool isLoading = false;

  SuggestionModel(this._context) {
    list = [];
    loadingSuggestions();
  }

  loadingSuggestions() async {
    // todo make call
    // finished isLoading true;
    // if error show not found error on view
    await Future.delayed(Duration(seconds: 1));
    list.addAll(MockData.TRIP_SUGGESTIONS);
    isLoading = list.isNotEmpty;
    setState();
  }

  showDialogSuggestion() async {
    final test = await showDialog(context: _context, builder: (context) => const AddSuggestionView());
    // review: add to TripSuggestion and save to backend
  }
}