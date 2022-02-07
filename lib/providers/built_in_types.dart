
import 'package:flutter/foundation.dart';

import '../serializables/app_query_result.dart';
import '../serializables/app_type.dart';
import '../services/type_service.dart';
import '../services/object_service.dart';
import '../services/result.dart';
import 'config_data.dart';

/// Manages the app built in types
/// - load from store
/// - hierarchy views support
/// - load related objects based on selected type 
///   - current client selection
///   - logged in user
/// 
/// - provide notifications to interested views
class NsAppBuiltInTypes with ChangeNotifier {
  final NsAppConfigData configData; 
  bool setupServices = false; 
  List<NsAppType>? types;  
  final Map<int,NsAppType> _typesMap = <int, NsAppType>{};
  NsResult? lastResult; // the last result of loading types
  late NsObjectService objectsService;

  // cached data
  final Map<int,Result<NsAppObjectQueryResult>> _data = <int,Result<NsAppObjectQueryResult>>{};
 
  /// constructor with configuration data
  NsAppBuiltInTypes(this.configData);

  setup() {
    if (setupServices){
      return;
    }
    objectsService = NsObjectService(rootUrl:  getApiRootUrl());
    setupServices = true;
  }

  /// Loads the system built-in types (independent of the team/group/client)
  Future<bool> load() async {
    
    var service = NsTypeService(rootUrl:  getApiRootUrl());
    var result = await service.getBuildtInTypes();
    lastResult = result;
    if (result.status == 0 && result.data != null) {
      types = result.data;
      types?.forEach((element) {_typesMap[element.typeId!] = element;});
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  /// returns cached objects for the given type or loads the data from server if not in cache or 
  /// refresh is required 
  Future<Result<NsAppObjectQueryResult>?> getObjects(int typeId, {bool refresh = true}) async {
    setup();

    if (_data.containsKey(typeId) == false || refresh) {
        var result = await objectsService.getByType(typeId, 1);
        lastResult = result;
        // cache result if successful
        if (result.notSuccess == false) {
          _data[typeId] = result;
        }
        notifyListeners();
        return result;
     } else if (_data.containsKey(typeId) == true){
       // 
       return _data[typeId];
     }
     
  }

  /// returns the objects api URL
  String getApiRootUrl() {
    return configData.getApiRootUrl();
  }
}
