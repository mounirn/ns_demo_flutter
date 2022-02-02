import 'package:json_annotation/json_annotation.dart';
import 'app_object.dart';
import 'app_query.dart';

part 'app_query_result.g.dart';


@JsonSerializable(explicitToJson: true)
class NsAppResult {
  bool? success;
  String? errorMessage;
  int? status;
  DateTime? startTime;
  DateTime? endTime;
  int? records;

  NsAppResult();

  factory NsAppResult.fromJson(Map<String, dynamic> json) =>
      _$NsAppResultFromJson(json);

  Map<String, dynamic> toJson() => _$NsAppResultToJson(this);

  @override String toString() {
    return "${success == true? 'OK': 'Error: '} ${errorMessage?? ''} - Status Code: $status - Records: $records ;";
  }
}

@JsonSerializable(explicitToJson: true)
class NsAppObjectQueryResult extends NsAppResult{
  NsAppObjectsQuery? query;
  List<NsAppObject>? list;
  NsAppResult? notifyResult;

  NsAppObjectQueryResult();

  factory NsAppObjectQueryResult.fromJson(Map<String, dynamic> json) =>
      _$NsAppObjectQueryResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NsAppObjectQueryResultToJson(this);
  @override String toString() {
    return super.toString() + 
    "List Count: ${list!= null? list?.length : 'null'} }";
  }
}