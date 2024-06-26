
import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/model/trip_appointment.dart';
import 'package:alpin_frontend/utilities/mock/MockData.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenModel extends BaseModel {
  bool onCalender = true;
  bool isListView = false;

  final List<TripAppointment> appointments = MockData.TRIPAPPOINTMENTS;
  HomeScreenModel(BuildContext context) : super(context){
    print('init Home');
  }

  void changeHomeScreen() {
    onCalender = !onCalender;
    setState();
  }

  void changeView() {
    isListView = !isListView;
    notifyListeners();
  }

}