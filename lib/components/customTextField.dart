import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool enable;
  final TextEditingController controller;

  CustomTextField(
      {Key? key,
      required this.title,
      required this.icon,
      required this.enable,
      required this.controller})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Color color = Colors.white;
  @override
  initState() {
    // at the beginning, all users are shown
    color = (Colors.grey[700])!;
    super.initState();
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
              TextFormField(
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
                    )),
              )
            ]));
  }
}
