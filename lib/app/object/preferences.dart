import 'package:flutter/material.dart';
import '../../serializables/app_object.dart';
import '../../providers/settings_data.dart';
import '../../providers/user.dart';
import '../../app/widgets/text_error.dart';
import '../../app/widgets/text_info.dart';

class NsPrefencesWidget extends StatelessWidget{
  final NsAppObject? object;
  final NsAppSettingsData? settings;
  final UserModel? user;

  const NsPrefencesWidget(this.object, this.settings, this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final DateTime currentDate = DateTime.now();
    final TextTheme textTheme = Theme.of(context).textTheme;
    var style1 = const TextStyle(color: Colors.blue);
    if (user == null || user?.isLoggedIn() == false ) {
      return Container();
    }
  /* user must be logged in to view prefs
    var objectOwner = settings?.getObjectClient(object);

    if (user.hasViewPermission(object) == false) {
      return Container();
    }
  */
    if (object == null) {
      return const NsTextError('Invalid Object');
    }
    else if (object?.preferences == null || object?.preferences?.isEmpty == true) {
      return const NsTextInfo('No Preferences');
    }
    else {

      var prefs = object?.preferences ?? [];
      return ListView.builder(
        itemCount: prefs.length,
        itemBuilder: (BuildContext context, int index) {
          var pref = prefs [index];

          return Card(
            child: ListTile(
              leading: Text(
                pref.key,
                style: textTheme.caption,
              ),
              title: Text(
                pref.value,
                style: style1,
              ),
              trailing: Text(
                pref.value,
                style: style1,
              ),
            ),
          );
        },
      );
    } 
  }
}