
class WidgetNotFound implements Exception {
  String cause;
  String? widget;
  String? method;

  WidgetNotFound({required this.cause, this.widget, this.method});

  @override
  String toString() {
    return [cause, widget ?? '', method ?? ''].join('/');

  }
}