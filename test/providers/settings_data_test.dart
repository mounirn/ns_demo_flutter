// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:ns_demo/providers/settings_data.dart';


void main() {
  test('load settings / user preferences data', () async {
    var model = NsAppSettingsData();

    var result = await model.load();

    assert(result == true);
    
  });
  test('save settings / user preferences data', () async {
    print("Testing /app/status:");
    var model = NsAppSettingsData();
    const lastSessionId = "last-session-id"; 
    const selectedClientId = 123;
    const serverUrl = "https://api.kharbga.com";

    var ok = await model.saveLastSessionId(lastSessionId);
    assert(ok == true);
    ok = await model.saveSelectedClientId(selectedClientId);
    assert(ok == true);

    ok = await model.saveServerRootUrl(serverUrl);
    assert(ok == true);

    var result = await model.load();

    assert(result == true);
    assert(model.selectedClientId == selectedClientId);
    assert(model.sessionId == lastSessionId);
    assert(model.serverRootUrl == serverUrl);

  });

  

}
