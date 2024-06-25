
/// utility for form to get easily field names
///
/// to fill classes
extension ParseFormToField on List<MapEntry<String,Object?>> {
  dynamic parseToField(String name) {
    return singleWhere((element) => element.key == name).value ?? '';
  }
}