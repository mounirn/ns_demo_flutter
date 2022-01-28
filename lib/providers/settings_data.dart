
import 'package:ns_demo/utils/color_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../serializables/app_client.dart';
import '../services/client_service.dart';
import 'config_data.dart';

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
  NsAppConfigData? configData;
  final Map<String, dynamic> _settingsData = <String,dynamic>{};
  final Map<int,NsAppClientDetails> _clientDetails = <int, NsAppClientDetails>{};

  List<NsAppClient> participatingClients = [];
  bool ladedClients = false;
  NsAppClient? selectedClient;
  
  /// Load user preferences from shared preferences
  /// Also loads the app participating clients from network (API call)
  Future<bool> load() async {

    isLoading = true;
    var prefs = await _prefs;
    selectedClientId = prefs.getInt(selectedClientIdKey) ?? 1;
    serverRootUrl = prefs.getString(serverRootUrlKey) ?? getServerUrlFromConfig();
    sessionId  = prefs.getString(userSessionIdKey) ?? '';
    var ok = await loadClients();
    // 
    var list = participatingClients.where((item)=>item.id == selectedClientId);
    if (list.isNotEmpty){
      selectedClient = list.first;
      setSelectedClient(selectedClient!);
    }
    isLoading = false;
    _setupSettingsData();
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
    if (configData == null){
      return false;
    }
    var url = configData?.getApiRootUrl();
    if (url == null){
      return false;
    }
    var service = NsClientService(rootUrl:  url);
    var result = await service.getClients();
    if (result.status == 0 && result.data != null) {
      participatingClients = result.data!;
      return true;
    } else {
      return false;
    }
  }

  Future<void> loadClientDetails(int id, bool refresh) async {
    if (_clientDetails.containsKey(id) && refresh != true) {
      return;
    }
     var service = NsClientService(rootUrl: getApiRootUrl() );
     var result = await service.getDetails(id);
     if (result.status == 0 && result.data != null) {
         _clientDetails[id] = result.data!;
         return;
     } 
  }
  
  /// sets the current selected client 
  setSelectedClient(NsAppClient client) {
    selectedClient = client;
    ///todo load client details
    saveSelectedClientId(client.id!).then((ok) {
      loadClientDetails(client.id!, true).then((details){
        notifyListeners();
      });
      notifyListeners();
    });
    
    
  }

  /// Fetches selected client details from map
  NsAppClientDetails? getSelectedClientDetails(){
    var id = selectedClient?.id!;
    if (_clientDetails.containsKey(id)){
      return _clientDetails[id];
    } else {
      return null;
    }
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
    if (index < 0 || index > participatingClients.length -1)
    {
      return NsAppClient();
    }
    return participatingClients[index];
  }

  void _setupSettingsData() {
    
    _settingsData.clear();
    _settingsData["App Server URL"] = serverRootUrl;
    _settingsData["Selected Client ID"] = selectedClientId;
    _settingsData["User Session ID"] = sessionId;

  }

  Map<String, dynamic> getSettingsData() {
    return _settingsData;
  }

  /// Reads a setting from the cached data
  dynamic getSetting(String itemId, dynamic value){
    if (_settingsData.containsKey(itemId)){
      return _settingsData[itemId];
    } else {
      _settingsData[itemId] = value;
      return _settingsData[itemId];
    }
  }

  String getServerUrlFromConfig() {
    if (configData == null) {
      return NsAppConfigData.defaultRootUrl;
    } else {
      return configData?.getServerUrlFromConfig() as String;
    }
  }

  String getApiRootUrl() {
    if (configData == null) {
      return '${NsAppConfigData.defaultRootUrl}/api';
    } else {
      return configData?.getApiRootUrl() as String;
    }
  }

  /// Identifies the current selected client and returns its background color if defined
  /// if not found, returns the app default backround color defined in configuration
  Color getHeaderBackgroundColor() {
    return NsColorUtils.getHeaderBackgroundColor(getSelectedClientDetails());
  }
}
