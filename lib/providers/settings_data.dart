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
  bool isLoading = true;
  Map<String, dynamic> _settingsData = Map<String,dynamic>();

  List<NsAppClient> participatingClients = [];
  bool ladedClients = false;
  NsAppClient? selectedClient;

  /// Load user preferences from shared preferences
  /// Also loads the app participating clients from network (API call)
  Future<bool> load() async {
    isLoading = true;
    var prefs = await _prefs;
    selectedClientId = prefs.getInt(selectedClientIdKey) ?? 1;
    serverRootUrl = prefs.getString(serverRootUrlKey) ?? 'https://myOnlineObjects.com';
    sessionId  = prefs.getString(userSessionIdKey) ?? '';
    var ok = await loadClients();
    // 
    var list = participatingClients.where((item)=>item.id == selectedClientId);
    if (list.isNotEmpty){
      selectedClient = list.first;
    }
    isLoading = false;
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

  /// sets the current selected client 
  setSelectedClient(NsAppClient client) {
    selectedClient = client;
    
    saveSelectedClientId(client.id!).then((ok) {
      notifyListeners();
    });
    
    
  }

  /// finds a client with the given id
  NsAppClient? getClientById(int clientId) {
    var result = participatingClients.where((item) => item.id== clientId);
    if (result.isNotEmpty){
      return result.first;
    } else {
      return null;
    }

  }

  /// Get client by the list index 
  NsAppClient getClientByIndex(int index) {
    return participatingClients[index];
  }


  /// Reads a setting from the store
  dynamic getSetting(String itemId, dynamic value){
    if (_settingsData.containsKey(itemId)){
      return _settingsData[itemId];
    } else {
      _settingsData[itemId] = value;
      return _settingsData[itemId];
    }
  }

  /// returns the App Server root api url
  getApiRootUrl() {
    return '$serverRootUrl/api/';
  }
}
