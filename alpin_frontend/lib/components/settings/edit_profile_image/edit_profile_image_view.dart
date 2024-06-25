import 'dart:async';

import 'package:alpin_frontend/components/settings/edit_profile_image/edit_profile_image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'dart:ui' as ui;

class EditProfileImageView extends StatelessWidget {
  EditProfileImageView({Key? key}) : super(key: key);
  final String _defaultImage = 'lib/assets/images/logo.png';

  Future<ui.Image> _buildImage() async {
    final ByteData data = await rootBundle.load(_defaultImage);
    return await decodeImageFromList(Uint8List.view(data.buffer));
  }

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<EditProfileImageModel>.reactive(
        viewModelBuilder: () => EditProfileImageModel(context),
        builder: (context, model, child) {
          Size size = MediaQuery.of(context).size;
          return Dialog(
            child: Column(
              children: [
                FutureBuilder(
                  future: _buildImage(),
                  builder: (imageContext, AsyncSnapshot<ui.Image> snapshot) {
                    Size size = MediaQuery.of(context).size;
                    if (snapshot.connectionState == ConnectionState.done)
                      return Container(
                        padding: const EdgeInsets.all(10),
                        height: size.height * 0.5,
                        width: size.width ,
                        child: GestureDetector(
                          child: 
                        CustomPaint(
                          painter: ImageEditor(image: snapshot.data!),
                        ),),
                      );
                    return const CircularProgressIndicator();
                  },
                ),
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                  GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: List<Widget>.generate(6, (index) => SizedBox(width: 50,height:50,child: CircleAvatar(foregroundImage: AssetImage('lib/assets/images/forest.png')),)))
                ],)
              ],
            ),
          );
        },
      );
}

class ImageEditor extends CustomPainter {
  ui.Image image;

  late Canvas _canvas;
  late Offset _offset;

  ImageEditor({required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    paintImage(canvas: canvas, rect: Rect.fromLTWH(0, 0, size.width, size.height), image: image);
    final paint = Paint()..color = Colors.black..style=PaintingStyle.stroke..strokeWidth=4;
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
    _canvas = canvas;
    _offset = Offset(0, 0);
  }


  panImage(double dx, double dy){
    final newOffset = Offset(dx, dy);
    paintImage(canvas: _canvas, rect: Rect.fromPoints(_offset, newOffset), image: image);
    _offset = newOffset;
  }



  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
