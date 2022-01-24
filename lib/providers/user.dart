import 'package:flutter/foundation.dart';

import '../serializables/user_session.dart';
import '../services/user_service.dart';
import '../utils/app_data.dart'; 

class UserModel extends ChangeNotifier {
  NsUserSession? session;
  bool invalidLoginInfo = false;
  bool unableToProcessRequest = false;
  final NsUserService _service = NsUserService(rootUrl: "https://myOnlineObjects.com/api/");

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
  void logout() {
    AppData.getInstance().sessionId = '';
  }
}