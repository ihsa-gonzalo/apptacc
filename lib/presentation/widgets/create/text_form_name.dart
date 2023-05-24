import 'package:apptacc/presentation/widgets/create/text_form.dart';
import 'package:flutter/material.dart';

import '../../../provider/create_form_provider.dart';

class TextFormName extends StatelessWidget {
  const TextFormName({
    super.key,
    required this.createFormProvider,
  });

  final CreateFormProvider createFormProvider;

  @override
  Widget build(BuildContext context) {
    return TextForm(false,"Nombre", "Ingrese su nombre", Icons.person, (value) {
      createFormProvider.setName(value);
    }, (value) {
      if (value != null) {
        return createFormProvider.checkFieldEmpty(value);
      } else {
        return null;
      }
    });
  }
}