import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ns_demo/app/object/icon.dart';
import 'package:ns_demo/providers/classes_data.dart';
import 'package:ns_demo/providers/settings_data.dart';
import 'package:ns_demo/serializables/app_class.dart';
import 'package:ns_demo/serializables/app_client.dart';
import 'package:ns_demo/services/result.dart';


import '../../widgets/result.dart';
import '../../widgets/loading.dart';
import '../../models/type_helper.dart';


class NsClientClassesWidget extends StatefulWidget{
  const NsClientClassesWidget({Key? key}) : super(key: key);

  @override
  State<NsClientClassesWidget> createState() =>_NsClientClassesWidgetState();

}

class _NsClientClassesWidgetState extends State<NsClientClassesWidget> {
  NsResult? result;
  NsClassesData? model;
  NsAppSettingsData? settings; 
  NsAppClientDetails? client;
  NsClientClassesLookup? lookup;
  @override void initState() {  
    settings = context.read<NsAppSettingsData>();
    if (settings!= null){
      client = settings?.getSelectedClientDetails();
    }
    model = context.read<NsClassesData>();
    if (client!= null && client?.id != null){
      lookup = model?.getLookup(client?.id ?? 0);
      if (lookup == null) {
        model?.loadLookup(client?.id ?? 0).then( (result) { 
          if (mounted) {
            setState(() {
              lookup = result;
            });
          }
        });
      }
    }
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    
    if (lookup == null) {
      if (model?.lastResult != null){
        return Center(
          child: NsResultWidget(model?.lastResult)
        );
      }
      else {
        return const Center(
          child: NsLoadingWidget("")
        );
      }
    }
    var classes = lookup?.classes ?? [];
    return SingleChildScrollView(child: ListBody(
      children: classes
          .map((item) => ListTile(
                title: Text('${item.name} (${item.id})'),
                subtitle: Text('${item.description}'),
                leading: getLeadingIcon(context, item),
                trailing: getTrailingIcon(context, item),
                
              ))
          .toList(),
      )
    );
  }

  Widget getLeadingIcon(BuildContext context, NsAppClass cls) {
    if (cls.imageUrl?.isNotEmpty == true){
      return NsIcon(object: cls);
    }
    return getNsTypeIcon(cls.typeId);
  }
  
  getTrailingIcon(BuildContext context, NsAppClass type) {
    return IconButton(
            icon: const Icon(Icons.stars_outlined),
            color: Theme.of(context).primaryColor,
            onPressed: () => onView(context, type),
    );
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
   
  onView(BuildContext context, NsAppClass cls) {
     Navigator.of(context).pushNamed('/class', 
      arguments: cls);
  }

  
}
