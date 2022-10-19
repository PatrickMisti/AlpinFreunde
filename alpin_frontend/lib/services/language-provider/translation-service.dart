
import 'package:alpin_frontend/services/language-provider/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rxdart/rxdart.dart';

class TranslationService {
  late BehaviorSubject<Locale> _locale;

  TranslationService(){
    _locale = BehaviorSubject<Locale>();
  }

  void setLocale(Locale locale) {
    if(!L10n.all.contains(locale)) return;

    _locale.add(locale);
  }

  Locale? get locale => _locale.valueOrNull;

  BehaviorSubject<Locale> get language => _locale;
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}

AppLocalizations? translations(BuildContext context) {
  return AppLocalizations.of(context);
}