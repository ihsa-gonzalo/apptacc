import 'package:apptacc/presentation/widgets/create/text_form.dart';
import 'package:flutter/material.dart';

import '../../../provider/create_form_provider.dart';


class TextFormPhone extends StatelessWidget {
  const TextFormPhone({
    super.key,
    required this.createFormProvider,
  });

  final CreateFormProvider createFormProvider;

  @override
  Widget build(BuildContext context) {
    return TextForm(
        keyboardType: TextInputType.phone,
        false,
        "Telefono",
        "Ingrese su telefono",
        Icons.phone, (value) {
      createFormProvider.setPhone(value);
    }, (value) {
      if (value != null) {
        return createFormProvider.checkFieldEmpty(value);
      } else {
        return null;
      }
    });
  }
}
