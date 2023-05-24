import 'package:flutter/material.dart';

class CreateFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Color _buttonColor = Colors.yellow;

  String _name = "";

  String get name => _name;

  void setName(String value) {
    _name = value;
    _updateButtonColor();
    notifyListeners();
  }

  String _email = "";

  String get email => _email;

  void setEmail(String value) {
    _email = value;
    _updateButtonColor();
    notifyListeners();
  }

  String _password = "";

  String get password => _password;

  void setPassword(String value) {
    _password = value;
    _updateButtonColor();
    notifyListeners();
  }

  String _phone = "";

  String get phone => _phone;

  void setPhone(String value) {
    _phone = value;
    _updateButtonColor();
    notifyListeners();
  }

  final String _emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  String get emailPattern => _emailPattern;

  bool checkIsEmailValid() {
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  String? checkIsPasswordValid() {
    if (password.length < 8) {
      return "La contraseña debe tener al menos 8 caracteres";
    } else {
      return null;
    }
  }

  Color get buttonColor => _buttonColor;

  bool isFormValid() {
    bool isValid = true;
    String? auxName = checkFieldEmpty(_name);
    if (auxName != null) {
      isValid = false;
    }

    String? auxPassword = checkIsPasswordValid();
    if (auxPassword != null) {
      isValid = false;
    }

    String? auxPhone = checkFieldEmpty(_phone);
    if (auxPhone != null) {
      isValid = false;
    }

    if (!checkIsEmailValid()) {
      isValid = false;
    }

    return isValid;
    //return (_name.isNotEmpty);
  }

  String? checkFieldEmpty(String fieldContent) {
    if (fieldContent.isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }

  void _updateButtonColor() {
    if (isFormValid()) {
      _buttonColor = Colors.purple;
    } else {
      _buttonColor = Colors.yellow;
    }
  }
}
