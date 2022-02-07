import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/built_in_types.dart';
import '../../widgets/result.dart';
import '../../widgets/loading.dart';
import '../../models/type_helper.dart';
import '../../serializables/app_type.dart';


class NsAppBuiltInTypesWidget extends StatefulWidget{
  const NsAppBuiltInTypesWidget({Key? key}) : super(key: key);

  @override
  State<NsAppBuiltInTypesWidget> createState() =>_NsAppBuiltInTypesWidgetState();

}

class _NsAppBuiltInTypesWidgetState extends State<NsAppBuiltInTypesWidget> {
  var loaded = false;
  late NsAppBuiltInTypes model;

  @override void initState() {  
    super.initState();
    model = context.read<NsAppBuiltInTypes>();
    if (model.types == null){
      model.load().then( (ok){
        loaded = ok;
        setState(() {
          
        });
      });
    } else {
      loaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var model = context.read<NsAppBuiltInTypes>();
    if (model.types == null) {
      if (model.lastResult != null){
        return Center(
          child: NsResultWidget(model.lastResult)
        );
      }
      else {
        return const Center(
          child: NsLoadingWidget("")
        );
      }
    }
    var types = model.types!;
    return SingleChildScrollView(child: ListBody(
      children: types
          .map((item) => ListTile(
                title: Text('${item.name} (${item.id})'),
                subtitle: Text('${item.desc}'),
                leading: getIcon(item.id),
                trailing: getTrailingIcon(context, item),
                
              ))
          .toList(),
      )
    );
  }

  getTrailingIcon(BuildContext context, NsAppType type) {
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
   
  onView(BuildContext context, NsAppType type) {
     Navigator.of(context).pushNamed('/type', 
      arguments: type);
  }

  getIcon(int? typeId) {
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
