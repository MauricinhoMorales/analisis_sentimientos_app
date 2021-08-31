import 'package:app_new/components/customDropDown.dart';
import 'package:app_new/components/customTitle.dart';
import 'package:app_new/tools/colors.dart';
import 'package:flutter/material.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class ViewSettings extends StatefulWidget {
  @override
  _ViewSettingsState createState() => _ViewSettingsState();
}

class _ViewSettingsState extends State<ViewSettings> {
  // This list holds the data for the list view
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            CustomTitle(title: 'Ajustes'),
            Expanded(child: ListView(children: <Widget>[_buildPanel()]))
          ])),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {});
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
