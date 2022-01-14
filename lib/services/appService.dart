import '../serializables/nsAppStatus.dart';
import 'result.dart';

/// Defines an abstrac app service checker
abstract class IAppService{
  Future<Result<NsAppStatus>> getStatus();

  String get lastError;
}