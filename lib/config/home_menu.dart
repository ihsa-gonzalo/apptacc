import 'package:apptacc/model/home_menu_model.dart';
import 'package:flutter/material.dart';

class HomeMenu
{
  static List<HomeMenuModel> list = [
     HomeMenuModel("Quiero tomar un café",Icons.local_cafe,"café"),
     HomeMenuModel("Quiero ir a comer",Icons.restaurant,"restaurant"),
     HomeMenuModel("Quiero ir a tomar algo",Icons.local_bar,"bar"),
     HomeMenuModel("Quiero ir a algo cerca",Icons.person_pin_circle,"mapa"),
  ];

}