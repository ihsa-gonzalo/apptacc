import 'package:apptacc/model/home_menu_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomeMenu
{
  static List<HomeMenuModel> list = [
     HomeMenuModel("Quiero tomar un café",Icons.local_cafe),
     HomeMenuModel("Quiero ir a comer",Icons.restaurant),
     HomeMenuModel("Quiero ir a tomar algo",Icons.local_bar),
     HomeMenuModel("Quiero ir a algo cerca",Icons.person_pin_circle),
     

  ];

}