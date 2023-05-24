import 'package:apptacc/config/theme.dart';
import 'package:apptacc/presentation/screens/list_shops.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/usuario_model.dart';
import '../../provider/create_form_provider.dart';
import '../widgets/create/text_form_email.dart';
import '../widgets/create/text_form_name.dart';
import '../widgets/create/text_form_password.dart';
import '../widgets/create/text_form_phone.dart';


class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false, // set it to false
      appBar: AppBar(
        title: const Text('AppTacc'),
        backgroundColor: AppTheme.naranja,
      ),
        body: Container(
          
    width: double.infinity,
    height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChangeNotifierProvider(
                  create: (_) => CreateFormProvider(),
                  child: _CreateForm(),
                ),
            ),
          ),
        ));
  }
}

class _CreateForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final createFormProvider = Provider.of<CreateFormProvider>(context);
    return Form(
      child: Column(
        children: [
          TextFormEmail(createFormProvider: createFormProvider),
          TextFormName(createFormProvider: createFormProvider),
          TextFormPassword(createFormProvider: createFormProvider),
          TextFormPhone(createFormProvider: createFormProvider),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: createFormProvider.buttonColor),
            onPressed: () {
              print("${createFormProvider.isFormValid()}");
              if (!createFormProvider.isFormValid()) return;
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  user_model miUsuario = user_model(
                      createFormProvider.email, createFormProvider.password,
                      name: createFormProvider.name,
                      phone: createFormProvider.phone);

                  print("nombre: " + miUsuario.name);
                  print("telefono: " + miUsuario.phone);

                  return ListShops(
                    miUsuario,
                  );
                },
              ));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text(
                  'Registrar',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
