import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/model/trip_appointment.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class AppointmentWidget extends StatelessWidget {
  final TripAppointment appointment;

  const AppointmentWidget({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentWidgetModel>.reactive(
      viewModelBuilder: () => AppointmentWidgetModel(context),
      builder: (context, model, child) {
        final String item =
            DateFormat.MMMM(model.locale.languageCode).format(appointment.date);
        return Card(
          // margin: EdgeInsets.all(5),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                FittedBox(
                  alignment: Alignment.center,
                    child: Column(
                  children: [
                    Text(appointment.date.day.toString(),
                        style: const TextStyle(fontSize: 18)),
                    Text(
                      item.substring(0, 3),
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(appointment.date.year.toString()),
                  ],
                )),
                Spacer(),
                FittedBox(child: Text(appointment.title, style: TextStyle(fontSize: 14),)),
                FittedBox(child: Text('${appointment.hightDifference.toString()} m')),
                FittedBox(child: Text('${translation(context).venue}: ${appointment.location}'),)
              ],
            ),
          ),
        );
      },
    );
  }
}

class AppointmentWidgetModel extends BaseModel {
  final GetIt _getIt = GetIt.I;
  late TranslationService _service;
  late Locale locale;

  AppointmentWidgetModel(BuildContext context) : super(context) {
    _service = _getIt.get<TranslationService>();
    locale = _service.locale ?? const Locale('en');
    _service.language.listen((value) {
      locale = value;
      setState();
    });
  }
}
