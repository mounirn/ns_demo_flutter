import 'package:flutter/material.dart';
import '../../serializables/app_client.dart';
import '../../providers/settings_data.dart';
import '../../app/object/dropdown_item.dart';

class NsClientsDropdown extends StatefulWidget {
  final NsAppSettingsData? settings;  
  const NsClientsDropdown(this.settings, {Key? key}) : super(key: key);

  @override
  State<NsClientsDropdown> createState() => _NsClientsDropdownState();
}

class _NsClientsDropdownState extends State<NsClientsDropdown> {
 
  NsAppClient? dropdownValue;
  
  @override
  void initState() {
    dropdownValue = widget.settings?.selectedClient;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  DropdownButton<NsAppClient>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (NsAppClient? newValue) {
          if (newValue != null) {
    
            setState(() {
              dropdownValue = newValue;
            });

            widget.settings?.setSelectedClient(newValue);
          }
        },
        items: getItems(),
      );
  }

  List<DropdownMenuItem<NsAppClient>>? getItems() {
    if (widget.settings?.participatingClients == null){
      return [];
    }
   
    var ret = widget.settings?.participatingClients.map<DropdownMenuItem<NsAppClient>>((NsAppClient value) {
        return DropdownMenuItem<NsAppClient>(
          value: value,
          child: NsDropdownItem(value),
        );
      }).toList();
    return ret;
  }
}
