// import 'package:html/parser.dart' as parser;
import '../serializables/app_object.dart';


extension NsAppObjectExtensions on NsAppObject {

  NsAppObjectPreference? getPref(String key) {

    if (preferences == null || preferences?.isEmpty == true){
      return null;
    }

    buildMap();
    if (prefsMap.containsKey(key)) {
      return prefsMap[key];
    }
    return null;
  }

  buildMap() {
    if (prefsMap.isEmpty == false) {
      return;
    }
    preferences?.forEach( (pref) {
      if (pref.key != null){
        prefsMap[pref.key!] = pref;
      }
    });
    
  }

  bool get hasNoImage{
    if (imageUrl == null || imageUrl?.isEmpty == true)
    {
      return true;
    }
    return false;
  }

  String get htmlContent {
    var ret = '';
    if (description != null  )  {
 /*     var p = parser.HtmlParser(description);
      var doc = p.parse();
      var body = doc.body;
      var innerHtml = body?.innerHtml;
      return innerHtml ?? '';
    */
      ret =  description ?? '';
    } 
    return ret;
  }
}
