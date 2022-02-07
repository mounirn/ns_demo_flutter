/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/result.dart';
import '../../serializables/app_object.dart';
import '../../serializables/app_query_result.dart';
import '../../providers/built_in_types.dart';
import '../../widgets/result.dart';
import '../../widgets/loading.dart';
import '../../models/type_helper.dart';
import '../../serializables/app_type.dart';


class NsAppObjectsByTypesWidget extends StatefulWidget{
  final NsAppType type;
  const NsAppObjectsByTypesWidget(this.type, {Key? key}) : super(key: key);

  @override
  State<NsAppObjectsByTypesWidget> createState() =>_State();

}

class _State extends State<NsAppObjectsByTypesWidget> {
  Result<NsAppObjectQueryResult>? _result;

  @override void initState() {  
    super.initState();
    var model = context.read<NsAppBuiltInTypes>();
    model.getObjects(widget.type.id! ).then( (result){
        _result = result;
        setState(() {
          
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      return const Center(
        child: NsLoadingWidget("Objects of Type: ${widget.type.name?? ''}")
      );
    } else if (_result?.status !=0) {
      return Center(
          child: NsResultWidget(_result)
        );
    } else {
      var queryResult = _result?.data;
      var objects =  queryResult?.list!;

      return ListBody(
        children: objects!
            .map((item) => ListTile(
                  title: Text('${item.name} (${item.id})'),
                  subtitle: Text('${item.description}'),
                  leading: getIcon(item.id),
                  trailing: getTrailingIcon2(context, item),
                  
                ))
            .toList(),
        )
      ;
    }
  }

  getTrailingIcon2(BuildContext context, NsAppObject obj) {
    return IconButton(
            icon: const Icon(Icons.stars_outlined),
            color: Theme.of(context).primaryColor,
            onPressed: () => onViewObjects(context, obj),
    );
  }

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
                  onPressed: () => onViewClass(context, type),
                  child: const Text('Class'),
                ),
                IconButton(
                  icon: const Icon(Icons.details),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => onViewObjects(context, type),
                ),
              ],
            ),
          )
        : IconButton(
            icon: const Icon(Icons.details),
            color: Theme.of(context).primaryColor,
            onPressed: () => onViewObjects(context, type),
          );
  }

  onViewObjects(BuildContext context, NsAppObject obj) {
    Navigator.of(context).pushNamed('/objects', 
      arguments: obj);
  }
  
  onViewClass(BuildContext context, NsAppObject obj) {
     Navigator.of(context).pushNamed('/class', 
      arguments: obj);
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

*/