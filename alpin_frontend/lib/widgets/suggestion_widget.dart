import 'package:alpin_frontend/model/trip_suggestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

/// [_contentWidgets] is the content from the card
///
/// [Card] widget is only the style for the list
class SuggestionWidget extends StatelessWidget {
  final TripSuggestion suggestion;

  const SuggestionWidget({Key? key, required this.suggestion})
      : super(key: key);

  final titleTextStyle = const TextStyle(color: Colors.white, fontSize: 20);
  final contentTextStyle = const TextStyle(color: Colors.black);

  Column _contentWidgets(
      {required BuildContext context,
      required String name,
      required String date,
      required Size size}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: titleTextStyle),
              GestureDetector(
                child: Icon(Icons.link,
                    size: titleTextStyle.fontSize, color: titleTextStyle.color),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: Text(
            suggestion.title,
            style: TextStyle(fontSize: (titleTextStyle.fontSize! - 2)),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 10, bottom: 5),
          child: RichText(
              text: TextSpan(
                  text: suggestion.description, style: contentTextStyle)),
        ),
        Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
            width: size.width,
            child: Text(date, style: const TextStyle(fontSize: 12)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String name =
        [suggestion.user.firstName, suggestion.user.lastName].join(' ');
    String date = DateFormat.yMd('de').format(suggestion.time).toString();
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35))
      ),
      margin: const EdgeInsets.all(10),
      child:
          _contentWidgets(context: context, name: name, date: date, size: size),
    );
  }
}
