
extension ParseFormToField on List<MapEntry<String,Object?>> {
  dynamic parseToField(String name) {
    return singleWhere((element) => element.key == name).value ?? '';
  }
}