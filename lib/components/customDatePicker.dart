import 'package:app_new/tools/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool enable;
  final TextEditingController controller;

  CustomDatePicker(
      {Key? key,
      required this.title,
      required this.icon,
      required this.enable,
      required this.controller})
      : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  Color color = Colors.white;
  DateTime date = DateTime.now();
  @override
  initState() {
    // at the beginning, all users are shown
    color = (Colors.grey[700])!;
    super.initState();
  }

  pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: primaryColor, // header background color
                  onPrimary: Colors.white, // header text color
                  onSurface: Colors.grey[900]!, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: Colors.blue, // button text color
                  ),
                ),
              ),
              child: child!);
        });

    if (newDate == null) return;

    setState(() {
      this.date = newDate;
      widget.controller.text = DateFormat('dd/MM/yyyy').format(date);
    });
  }

  String getText() {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    '  ' + widget.title,
                    style: TextStyle(color: this.color),
                  )),
              TextField(
                enabled: widget.enable,
                controller: widget.controller,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: (Colors.grey[800])!)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  prefixIcon: Icon(
                    widget.icon,
                    color: Colors.grey[700],
                  ),
                  suffixIcon: MaterialButton(
                    child: Icon(
                      widget.icon,
                      color: widget.enable ? primaryColor[70]! : Colors.grey,
                    ),
                    shape: CircleBorder(
                        side: BorderSide(
                            color:
                                widget.enable ? primaryColor[70]! : Colors.grey,
                            style: BorderStyle.solid,
                            width: 2.0)),
                    onPressed: () => pickDate(context),
                  ),
                ),
              )
            ]));
  }
}
