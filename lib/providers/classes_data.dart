
import 'package:flutter/foundation.dart';
import 'package:ns_demo/serializables/app_class.dart';
import 'package:ns_demo/services/class_service.dart';

import '../services/result.dart';
import 'config_data.dart';

/// Provides lookup by class id or system type id for a given team
class NsClientClassesLookup {
  final int clientId;
  final List<NsAppClass> classes;
  final Map<int,NsAppClass> _classesByClassId = <int, NsAppClass>{};  
  final Map<int,NsAppClass> _classesByTypeId = <int, NsAppClass>{};  
  NsClientClassesLookup(this.clientId, this.classes) {
    for (var e in classes) {
      _classesByClassId[e.id!] =e;
      if (e.typeId != null && e.typeId! > 0){
        _classesByTypeId[e.typeId!] = e;
      }
    }
  }
}

/// Manages clients classes
/// - load from store
/// - hierarchy views support
/// - load related objects based on selected type 
///   - current client selection
///   - logged in user
/// 
/// - provide notifications to interested views
/// 
/// 
class NsClassesData with ChangeNotifier {
  final NsAppConfigData configData; 
  bool setupServices = false; 
  final Map<int,NsClientClassesLookup> _map = <int, NsClientClassesLookup>{};
  NsResult? lastResult; // the last result of loading types
  late NsClassService classesService;

/// constructor with configuration data
  NsClassesData(this.configData);

  setup() {
    if (setupServices){
      return;
    }
    classesService = NsClassService(rootUrl:  getApiRootUrl());
    setupServices = true;
  }

  Future<NsClientClassesLookup?> loadLookup(int clientId, {bool refresh = true}) async {
    setup();

    if (_map.containsKey(clientId) == false || refresh) {
        var result = await classesService.getClientClasses(clientId);
        lastResult = result;
        // cache result if successful
        if (result.notSuccess == false) {
          var ret = NsClientClassesLookup(clientId,result.data!);
          _map[clientId] = ret;
          notifyListeners();
          return ret;
        }
     } else if (_map.containsKey(clientId) == true){
       // 
       return _map[clientId];
     }
     
  }

  /// Fetches the lookup table for a given client
  /// returns null if not loaded already
  NsClientClassesLookup? getLookup(int clientId)  {
    if (_map.containsKey(clientId) == true) { 
       return _map[clientId];
    } else {
      return null;
    }
     
  }

  /// returns the objects api URL
  String getApiRootUrl() {
    return configData.getApiRootUrl();
  }
}
