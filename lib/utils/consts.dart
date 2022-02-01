// ignore_for_file: constant_identifier_names

import 'dart:core';
import 'package:flutter/material.dart';

class NsConsts {
  static const String C_AppName = "Flutter Demo - N@URI Solutions";
  static const String C_CompanyName = 'N@URI Solutions';
  static const String C_ConfigFile = "assets/config.json";
  static const String C_NsLogo = "assets/image/logo.png";
  static const String C_NsObjectNoImage = "assets/image/object-no-image.png";
  static const String C_NsTermsUrl = "https://myonlineobjects.com/home/terms";
  static const String C_NsPrivacyUrl = "https://myonlineobjects.com/home/privacy";
  static const String C_NsHelpUrl = "https://myonlineobjects.com/home/help";

  static const TextStyle C_RedErrorStyle = 
    TextStyle(color: Colors.red, fontWeight: FontWeight.bold);
  static const TextStyle C_RecordLabelStyle = 
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);
  static const TextStyle C_RecordValueStyle = 
    TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18);
  static const TextStyle C_HyperLinkStyle = 
    TextStyle(color: Colors.blue, fontSize: 18, decoration: TextDecoration.underline);
}