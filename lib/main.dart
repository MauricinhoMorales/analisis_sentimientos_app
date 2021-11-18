import 'package:app_new/tools/colors.dart';
import 'package:app_new/tools/constants.dart';
import 'package:app_new/views/predictions.dart';
import 'package:app_new/views/settings.dart';
import 'package:app_new/views/statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: TITLE,
        home: MyHomePage(title: TITLE),
        theme: ThemeData(
          primaryColor: primaryColor,
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        child: Scaffold(
          body: TabBarView(
            children: [ViewStatistics(), ViewPredictions(), ViewSettings()],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.bar_chart_sharp),
              ),
              Tab(
                icon: Icon(Icons.chat_sharp),
              ),
              Tab(
                icon: Icon(Icons.settings),
              )
            ],
            labelColor: bgColor,
            unselectedLabelColor: bgColor[50],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.transparent,
          ),
          backgroundColor: primaryColor,
        ),
      ),
    );
  }
}
