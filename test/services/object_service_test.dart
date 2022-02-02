// ignore_for_file: avoid_print
import 'package:flutter_test/flutter_test.dart';
import 'package:ns_demo/serializables/app_query.dart';
import 'package:ns_demo/services/object_service.dart';
import 'package:ns_demo/utils/consts.dart';

void main() {
var service = NsObjectService(rootUrl: NsConsts.C_NsRootApiTestingUrl);

 test('test fetch object by code', () async {
   print("Testing /object/code/{ns}:");
   
   var result = await service.getByCode("ns");
   assert (result.status == 0);
   assert (result.data != null);
   print ("Result data:");
   print (result.data);
   assert (result.data?.query != null);
   print ("Query returned: ");
   print (result.data?.query);
    assert (result.data?.list != null);
   print ("Result Data returned: ");
   print (result.data?.list);
  });

  test('test fetch object by query - by code', () async {
   print("Testing POST /object/query:");

   var query = NsAppObjectsQuery();
   query.hasCode = 'ns'; // same as getByCode
   
   var result = await service.run(query);
   assert (result.status == 0);
   assert (result.data != null);
   print ("Result data:");
   print (result.data);
   assert (result.data?.query != null);
   print ("Query returned: ");
   print (result.data?.query);
    assert (result.data?.list != null);
   print ("Result Data returned: ");
   print (result.data?.list);
  });

  test('test fetch object by query - name contains', () async {
   print("Testing POST /object/query:");

   var query = NsAppObjectsQuery();
   query.nameContains = 'NOURI'; 
   
   var result = await service.run(query);
   assert (result.status == 0);
   assert (result.data != null);
   print ("* Result data:");
   print (result.data);
   assert (result.data?.query != null);
   print ("* Query returned: ");
   print (result.data?.query);
  assert (result.data?.list != null);
   print ("* Result Data returned: ");
   print (result.data?.list);
  });

  test('test fetch object by query - code or name contains', () async {
   print("Testing POST /object/query:");

   var query = NsAppObjectsQuery();
   query.codeOrNameContains = 'ABC'; 
   
   var result = await service.run(query);
   assert (result.status == 0);
   assert (result.data != null);
   print ("* Result data:");
   print (result.data);
   assert (result.data?.query != null);
   print ("* Query returned: ");
   print (result.data?.query);
  assert (result.data?.list != null);
   print ("* Result Data returned: ");
   print (result.data?.list);
  });

}
