
import 'package:alpin_frontend/components/base_widget.dart';
import 'package:alpin_frontend/components/home_screen/home_screen_model.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:alpin_frontend/widgets/appointment_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeScreenView extends StatelessWidget implements BaseWidget {
  @override
  String getAppBarName(context) => translation(context).appointments;

  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<HomeScreenModel>.reactive(
        viewModelBuilder: () => HomeScreenModel(context),
        builder: (context, model, child) {
          return GridView.count(
              crossAxisCount: 2,
              children: List<Widget>.generate(model.appointments.length,
                      (index) {
                    final item = model.appointments[index];
                    return Container(
                      child: AppointmentWidget(
                        appointment: item,
                      ),
                    );
                  }));
        },
      );
}
