import 'package:app_new/components/customChip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> tags;
  final Function navigation;

  const CustomCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.tags,
      required this.navigation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/barra.png'),
                  height: 90,
                  width: 90,
                ),
                Expanded(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 25, right: 25),
                      title: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Center(
                              child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16.0),
                          ))),
                      subtitle: Column(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Text(
                              subtitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 13.0),
                            )),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: tags
                                .map((e) => new CustomChip(tag: e))
                                .toList(),
                          ),
                        )
                      ]),
                    ),
                    TextButton(
                      child: const Text('VER RESULTADOS'),
                      onPressed: () {
                        navigation();
                      },
                    ),
                  ],
                ))
              ])),
    );
  }
}
