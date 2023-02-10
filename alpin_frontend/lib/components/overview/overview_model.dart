
import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/components/base_widget.dart';
import 'package:alpin_frontend/components/home_screen/home_screen_view.dart';
import 'package:alpin_frontend/components/newsfeed/newsfeed_view.dart';
import 'package:alpin_frontend/config.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:alpin_frontend/services/youtube_service.dart';
import 'package:alpin_frontend/utilities/exceptions.dart';
import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class OverviewModel extends BaseModel  {
  List<MapEntry<IconData, BaseWidget>> screens = Config.pageConfig;
  late PageController controller;
  final curveAnimation = Curves.easeInOutQuart;
  final durationOfAnimation = const Duration(milliseconds: 700);
  bool switchToNews = false;
  final GetIt getIt = GetIt.I;

  OverviewModel(BuildContext _context) : super(_context) {
    controller = PageController(initialPage: naviIndex, keepPage: true);
    registerServices();
  }

  get getCurrentWidget => screens[naviIndex].value;

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

  ///region all services and dispose
  registerServices() {
    getIt.registerLazySingleton(() => YoutubeService());
  }

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
    final youtube = getIt.get<YoutubeService>();
    getIt.unregister(instance: youtube);
  }
}
