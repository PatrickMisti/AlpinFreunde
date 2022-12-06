
import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/components/base_widget.dart';
import 'package:alpin_frontend/components/home_screen/home_screen_view.dart';
import 'package:alpin_frontend/components/newsfeed/newsfeed_view.dart';
import 'package:alpin_frontend/config.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:alpin_frontend/utilities/exceptions.dart';
import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OverviewModel extends BaseModel  {
  List<MapEntry<IconData, Widget>> screens = Config.pageConfig;
  late PageController controller;
  final curveAnimation = Curves.easeInOutQuart;
  final durationOfAnimation = const Duration(milliseconds: 700);
  bool switchToNews = false;

  OverviewModel(BuildContext _context) : super(_context) {
    controller = PageController(initialPage: naviIndex, keepPage: true);
  }

  get getCurrentWidget => screens[naviIndex].value is! IndexedStack ? screens[naviIndex].value as BaseWidget : _getViewFromStackByIconSwitch();

  Widget _getViewFromStackByIconSwitch() {
    var defaultWidget = Center(child: Text(translation(context).widgetNotFound));
    try {
      var indexWidget = (screens[naviIndex].value as IndexedStack).children;
      return switchToNews
          ? indexWidget.firstWhere((element)  => element is NewsfeedView)
          : indexWidget.firstWhere((element)  => element is HomeScreenView);
    } catch (err, stacktrace) {
      Catcher.reportCheckedError(WidgetNotFound(
          cause: err.toString(),
          widget: (switchToNews ? HomeScreenView : NewsfeedView).toString(),
          method: '_getViewFromStackByIconSwitch'), stacktrace);
      return defaultWidget;
    }
  }

  @override
  void changeIndexNavi(int index) {
    super.changeIndexNavi(index);
    controller.jumpToPage(index);
    setState();
  }

  String getScreenTitle() {
    final widget = getCurrentWidget;
    if (widget is Center) return '';
    return getCurrentWidget.getAppBarName(context);
  }

  void changeToNews() {
    switchToNews = !switchToNews; // remove this HomeScreenView should handle this
    setState();
  }
}
