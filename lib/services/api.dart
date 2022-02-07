

import 'result.dart';
import '../serializables/app_type.dart';
import '../serializables/app_client.dart';
import '../serializables/app_class.dart';
import '../serializables/app_query.dart';
import '../serializables/app_object.dart';
import '../serializables/app_query_result.dart';

class AppException implements Exception {
  String? message;
  int? code;

  AppException(this.message, this.code);

  @override
  String toString() {
    return "$code:$message";
  }
}

abstract class ITypeService{
  Future<Result<List<NsAppType>>> getBuildtInTypes();
}

abstract class IClientService{
  Future<Result<List<NsAppClient>>> getClients();

  Future<Result<NsAppClientDetails>> getDetails(int id);

  Future<Result<NsAppClientDetails>> getMyTeam();
}

abstract class IClassService{
    Future<Result<List<NsAppClass>>> getClientClasses(int clientId);
}

abstract class IObjectService{
    /// fectches objects matching any team object by code
    Future<Result<NsAppObjectQueryResult>> getByCode(String code);

    /// fetches object by the defined server built-in type ids for a given client
    Future<Result<NsAppObjectQueryResult>> getByType(int typeId, int clientId);

    /// fetches object by the defined class for a given client
    Future<Result<NsAppObjectQueryResult>> getByClass(int classId, int clientId);

    /// Fetches object by a given query
    Future<Result<NsAppObjectQueryResult>> run(NsAppObjectsQuery query);

    
}
