
import 'package:flutter/material.dart';
import 'package:ns_demo/app/object/icon.dart';
import 'package:ns_demo/providers/user.dart';
import 'package:ns_demo/serializables/app_object.dart';
import 'package:ns_demo/serializables/app_query_result.dart';
import 'package:ns_demo/services/result.dart';
import 'package:ns_demo/widgets/query_result.dart';

import 'package:provider/provider.dart';

import '../../providers/settings_data.dart';
import '../../providers/built_in_types.dart';
import '../../widgets/result.dart';
import '../../widgets/loading.dart';
import '../../models/type_helper.dart';
import '../../serializables/app_type.dart';


class NsTypeObjectsWidget extends StatefulWidget{
  final NsAppType type;
  final NsAppSettingsData? settings;
  final NsUserModel? user;
  const NsTypeObjectsWidget(this.type, {Key? key, this.settings, this.user}) : super(key: key);

  @override
  State<NsTypeObjectsWidget> createState() =>_State();

}

class _State extends State<NsTypeObjectsWidget> {
  Result<NsAppObjectQueryResult>? _result;
  @override void initState() {  
    super.initState();
    var model = context.read<NsAppBuiltInTypes>();
    model.getObjects(widget.type.id!).then( (result) {  
      setState(() {
        _result = result;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      return const Center(
        child: NsLoadingWidget("")
      );
    } else if (_result?.status != 0){
      return Center(
        child: NsResultWidget(_result)
      );
    } else if (_result?.data == null){
      /// TODO : update error details 
      return Center(
        child: NsResultWidget(_result) // 
      );
    } else {
      var queryResult = _result?.data;
      if (queryResult?.success == false) {
        return NsQueryResultWidget(queryResult!);
      }
      ///TODO : query info display
      var objects = queryResult?.list ?? [];
      return SingleChildScrollView(child: ListBody(
        children: objects
            .map((item) => ListTile(
                  title: Text('${item.name} (${item.code})'),
                  subtitle: Text('${item.description}'),
                  leading: getLeadingIcon(context,item),
                  trailing: getTrailingIcon(context, item),
                  
                ))
            .toList(),
        )
      );
    }
  }

  getTrailingIcon(BuildContext context, NsAppObject obj) {
    return IconButton(
            icon: const Icon(Icons.list),
            color: Theme.of(context).primaryColor,
            onPressed: () => onView(context, obj),
    );
  }
  Widget getLeadingIcon(BuildContext context, NsAppObject obj) {
    if (obj.imageUrl?.isNotEmpty == true){
      return NsIcon(object: obj);
    }
    return getIcon(obj.typeId, obj.classId);
  }
  /*
  getTrailingIcon(BuildContext context, NsAppType type) {
    return MediaQuery.of(context).size.width > 480
        ? FittedBox(
            fit: BoxFit.fill,
            child: Row(
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    // padding: const EdgeInsets.all(16.0),
                    primary: Theme.of(context).primaryColor,
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => onEdit(context, type),
                  child: const Text('Class'),
                ),
                IconButton(
                  icon: const Icon(Icons.details),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => onView(context, type),
                ),
              ],
            ),
          )
        : IconButton(
            icon: const Icon(Icons.details),
            color: Theme.of(context).primaryColor,
            onPressed: () => onView(context, type),
          );
  }
  */
   
  onView(BuildContext context, NsAppObject obj) {
     Navigator.of(context).pushNamed('/object', 
      arguments: obj);
  }

  getIcon(int? typeId, int? classId) {
    IconData icon;
    switch(typeId) {
      case kTypeObject:
        icon = Icons.class_;
        break;
      case kTypeOrganization:
        icon = Icons.group;
        break;
      case kTypePerson:
        icon = Icons.person;
        break;
      case kTypePlace:
        icon = Icons.place;
        break;
      default: 
        icon = Icons.emoji_objects;
        break;
    }

    return Icon(icon);
  }
}
