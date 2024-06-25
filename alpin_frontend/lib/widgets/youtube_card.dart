import 'package:alpin_frontend/model/youtube_data.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeCard extends StatelessWidget {
  final YoutubeData data;
  final Color _cardBackground = Colors.black;
  final Color _cardFontColor = Colors.white;

  const YoutubeCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var url = Uri.parse('https://www.youtube.com/watch?v=${data.videoId}');
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
          return;
        }
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(translation(context).foundNoYoutubeVideo),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(translation(context).ok))
            ],
          ),
        );
      },
      child: Card(
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        color: _cardBackground,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                data.thumbnail,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(data.title, style: TextStyle(color: _cardFontColor)),
            )
          ],
        ),
      ),
    );
  }
}
