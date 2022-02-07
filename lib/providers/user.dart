import 'package:flutter/foundation.dart';

import '../serializables/user_session.dart';
import '../services/user_service.dart';
import '../utils/app_data.dart';
import 'config_data.dart'; 

/// Provides user data and supports the following functions:
/// - login, logout
/// - maintains the current user session information and notifies parts of the applications with related changes
class NsUserModel extends ChangeNotifier {
  final NsAppConfigData config;
  NsUserSession? session;
  bool invalidLoginInfo = false;
  bool unableToProcessRequest = false;
  late NsUserService _service;

  NsUserModel(this.config);

  setup() {
     _service = NsUserService(rootUrl: config.getApiRootUrl());
  }
   
  Future login(String loginId, String password) async {
    
    unableToProcessRequest = false;
    session = null;
    
    var result  = await _service.login2(loginId,password);
    if (result.status == 0 && result.data != null){
      session = result.data;
      AppData.getInstance().sessionId = session?.sessionId as String;
       invalidLoginInfo = false;
    } else {
      if (result.status == 404 || result.status == 400){
        invalidLoginInfo = true;
      } else{
        unableToProcessRequest = true;
      }
    }
    notifyListeners();
  }

  setInvalid(bool valid) {
    invalidLoginInfo = valid;
    notifyListeners();
  }

  bool isLoggedIn() {
    if (session == null) {
      return false;
    }
    if (session == null) {
      return false;
    }
    return session?.isActive == true;
  }
  bool validImageUrl() {
    if (session == null){
      return false;
    }
    if (session?.imageUrl == null){
      return false;
    }
    var imageUrl = session?.imageUrl as String;
    
    if (imageUrl.isEmpty) {
      return false;
    }
    return true;
  }

  Future<bool> logout() async {
    var result  = await _service.logout(AppData.getInstance().sessionId);
    session = null;
    AppData.getInstance().sessionId = '';
    if (result == true){
      notifyListeners();
    }
    return result;
  }
}