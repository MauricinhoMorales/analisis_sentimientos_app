import 'package:app_new/components/customTitle.dart';
import 'package:app_new/tools/colors.dart';
import 'package:flutter/material.dart';

class Item {
  String title;
  String information;
  String extendedInformation;
  bool isExpanded;
  Icon icon;

  Item({
    required this.title,
    required this.information,
    required this.extendedInformation,
    required this.isExpanded,
    required this.icon,
  });
}

class ViewSettings extends StatefulWidget {
  @override
  _ViewSettingsState createState() => _ViewSettingsState();
}

class _ViewSettingsState extends State<ViewSettings> {
  final List<Item> _data = [
    Item(
        title: 'Ayuda e Información',
        information: 'La App esta compuesta por dos secciones',
        extendedInformation:
            '\nESTADÍSTICAS: Permite la visualización de los datos recopilados del análisis de sentimientos sobre el fenómeno migratorio venezolano tomando en cuenta las opiniones y sentimientos más comunes de la población.\n\n' +
                'PREDICCIONES: Permite que los usuarios evaluen el desempeño de los modelos de clasificación obtenidos del proceso de análisis de sentimientos.\n',
        isExpanded: false,
        icon: Icon(Icons.info)),
    Item(
        title: 'Consejos',
        information: 'Para probar todas las funcionalidades',
        extendedInformation:
            '\nDigirite a la sección ESTADÍSTICAS y visualiza alguno de los gráficos representativos de Monogramas.\n\n' +
                'Luego ve a la a sección PREDICCIONES e inserta un mensaje que contenga alguno de los Monogramas con mayor aparición.\n\n' +
                'Procede a evaluar el mensaje fijándote en los resultados arrojados y agregalo a la data confirmando las categorías a las que corresponde.\n\n' +
                'Vuelve a la sección ESTADÍSTICAS para observar el cambio respectivo en la gráfica y puede que algún valor menor en el resto de ellas.\n\n' +
                'Finalmente ve a la sección PREDICCIONES insertando el mismo mensaje, debido a que el modelo ahora toma en cuenta el mensaje introducido, los modelos deberian arrojar mejores resultados.\n\n',
        isExpanded: false,
        icon: Icon(Icons.settings_suggest))
  ];

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
            CustomTitle(title: 'AJUSTES'),
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
              leading: item.icon,
              title: Text(item.title,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      fontFamily: 'Poppins')),
            );
          },
          body: ListTile(
              title: Text(item.information,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      fontFamily: 'Poppins')),
              subtitle: Text(item.extendedInformation,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      fontFamily: 'Poppins'))),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
