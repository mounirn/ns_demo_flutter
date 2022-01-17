import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import '../serializables/app_client.dart';
import '../services/client_service.dart';

// Manages the settings data
class NsAppSettingsData with ChangeNotifier {
  static const selectedClientIdKey = "ns_user_selected_client_id";
  static const serverRootUrlKey = "ns_app_server_url";
  static const userSessionIdKey = "ns_app_user_session_id";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int selectedClientId = 0;
  String serverRootUrl = "https://myOnlineObjects.com";
  String sessionId = '';

  List<NsAppClient> participatingClients = [];
  bool ladedClients = false;

  /// load data from shared preferences
  /// also loads 
  Future<bool> load() async {
    var prefs = await _prefs;
    selectedClientId = prefs.getInt(selectedClientIdKey) ?? 1;
    serverRootUrl = prefs.getString(serverRootUrlKey) ?? 'https://myOnlineObjects.com';
    sessionId  = prefs.getString(userSessionIdKey) ?? '';
    var ok = await loadClients();
    notifyListeners();
    return ok;
  }

  // save selected client id
  Future<bool> saveSelectedClientId(int selected) async {
    var prefs = await _prefs;
    var ok = await prefs.setInt(selectedClientIdKey, selected);
    selectedClientId = selected;
    notifyListeners();
    return ok;
  }

   Future<bool> saveServerRootUrl(String url) async {
    var prefs = await _prefs;
    var ok = await prefs.setString(serverRootUrlKey, url);
    serverRootUrl = url;
    notifyListeners();
    return ok;
  }
  
  Future<bool> saveLastSessionId(String id) async {
    var prefs = await _prefs;
    var ok = await prefs.setString(userSessionIdKey, id);
    sessionId = id;
    notifyListeners();
    return ok;
  }

  /// Loads system particiapting clients/teams 
  /// returns true if sucessful
  Future<bool> loadClients() async {
     var service = NsClientService(rootUrl: getApiRootUrl() );
     var result = await service.getClients();
     if (result.status == 0 && result.data != null) {
        participatingClients = result.data!;
        return true;
     } else {
        return false;
     }
  }

  getApiRootUrl() {
    return '$serverRootUrl/api/';
  }
}
