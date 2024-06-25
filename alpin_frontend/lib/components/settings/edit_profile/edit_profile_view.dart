import 'package:alpin_frontend/components/settings/edit_profile/edit_profile_model.dart';
import 'package:alpin_frontend/model/user.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class EditProfileView extends StatelessWidget {
  final User user;

  EditProfileView({Key? key, required this.user}) : super(key: key);

  final forms = (BuildContext context) => [
        {
          'name': 'userName',
          'text': translation(context).username,
          'icon': Icons.smart_toy
        },
        {
          'name': 'firstName',
          'text': translation(context).firstName,
          'icon': Icons.portrait
        },
        {
          'name': 'lastName',
          'text': translation(context).lastName,
          'icon': Icons.accessibility
        },
        {
          'name': 'email',
          'text': translation(context).email,
          'icon': Icons.email
        }
      ];

  @override
  Widget build(BuildContext context) {
    if (user == null) Navigator.of(context).pop();
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<EditProfileModel>.reactive(
      viewModelBuilder: () => EditProfileModel(user,context),
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(translation(context).settingsProfileEdit),
          ),
          body: Stack(children: [
            ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .1, vertical: size.height * .1),
                children: [
                  ReactiveForm(
                    formGroup: model.settingsForm,
                    child: Column(
                      children: [
                        for (var item in forms(context))
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: ReactiveTextField(
                              formControlName: item['name'].toString(),
                              decoration: InputDecoration(
                                  hintText: item['text'].toString(),
                                  prefixIcon: Icon(item['icon'] as IconData)),
                            ),
                          )
                      ],
                    ),
                  ),
                ]),
            Positioned(
              left: size.width * .1,
              right: size.width * .1,
              bottom: 35,
              child: Visibility(
                visible: !model.loading,
                child: ElevatedButton(
                    onPressed: model.save,
                    child: Text(translation(context).save)),
                replacement: Stack(
                  alignment: Alignment.center,
                  children: const [
                    SizedBox.square(
                        child: CircularProgressIndicator(), dimension: 50)
                  ],
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
