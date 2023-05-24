import 'package:apptacc/presentation/widgets/create/text_form.dart';
import 'package:flutter/material.dart';

import '../../../provider/create_form_provider.dart';


class TextFormPassword extends StatelessWidget {
  const TextFormPassword({
    super.key,
    required this.createFormProvider,
  });

  final CreateFormProvider createFormProvider;

  @override
  Widget build(BuildContext context) {
    return TextForm(true, "Contraseña", "Ingrese su contraseña", Icons.lock,
        (value) {
      createFormProvider.setPassword(value);
    }, (value) {
      if (value != null) {
        return createFormProvider.checkIsPasswordValid();
      } else {
        return null;
      }
    });
  }
}
