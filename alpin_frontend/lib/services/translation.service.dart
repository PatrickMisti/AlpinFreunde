

import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'disposabled.dart';

class TranslationService extends Disposabled {
  get subSink => null;





  changeLanguage(LanguageCode code) {

  }

  TranslationService() {
    subSink["TEST"] = "test";
  }
}

enum LanguageCode {
  de,
  en
}