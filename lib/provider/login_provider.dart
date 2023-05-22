import 'package:apptacc/model/usuario_model.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

  String _usuario = '';
  String _password = '';
  user_model? user;
  Color _buttonColor = Colors.yellow;

  String get usuario => _usuario;
  String get password => _password;
  Color get buttonColor => _buttonColor;
  String get emailPattern => _emailPattern;

  final String _emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  void setUsuario(String value) {
    _usuario = value;
    _updateButtonColor();
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    _updateButtonColor();
    notifyListeners();
  }

  void cleanUser()
  {
      user = null;
      notifyListeners();
  }

  void setUser(user_model? user)
  {
    this.user = user;
    notifyListeners();
  }

  bool isFormValid()
   {
    //usa el validator de todos los campos
    // return formKey.currentState?.validate() ?? false;
    return usuario.isNotEmpty &&
        password.isNotEmpty &&
        checkIsPasswordValid() &&
        checkIsEmailValid();
  }

  bool checkIsEmailValid() {
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(usuario);
  }

  bool checkIsPasswordValid() {
    return password.length >= 8;
  }

  void _updateButtonColor() {
    print('_updateButtonColor');
    if (isFormValid()) {
      _buttonColor = Colors.purple;
    } else {
      _buttonColor = Colors.yellow;
    }
  }
}
