import 'package:app_new/components/customDatePicker.dart';
import 'package:app_new/components/customDropDown.dart';
import 'package:app_new/components/customTextField.dart';
import 'package:app_new/components/customTitle.dart';
import 'package:app_new/components/customToken.dart';
import 'package:app_new/tools/colors.dart';
import 'package:flutter/material.dart';

class ViewUsers extends StatefulWidget {
  @override
  _ViewUsersState createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> {
  // This holds a list of fiction users
  // You can use data fetched from a database or cloud as well
  final Map<String, dynamic> _values = {
    "id": 1,
    "name": "Mauricio Morales",
    "email": "mauricio1999morales@gmail.com",
    "genre": "Hombre",
    "birthDate": "07/08/1999",
    "description": "Aqui iria la descripción del usuario",
  };

  late bool isEditing;
  late String tag;

  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  initState() {
    // at the beginning, all users are shown
    this.isEditing = false;
    this.tag = "Edit";

    this.nameController = TextEditingController(text: _values["name"]);
    this.mailController = TextEditingController(text: _values["email"]);
    this.genreController = TextEditingController(text: _values["genre"]);
    this.birthDateController =
        TextEditingController(text: _values["birthDate"]);
    this.descriptionController =
        TextEditingController(text: _values["description"]);

    nameController.addListener(_updateNameValue);
    mailController.addListener(_updateMailValue);
    genreController.addListener(_updateGenreValue);
    birthDateController.addListener(_updateBirthDateValue);
    descriptionController.addListener(_updateDescriptionValue);

    super.initState();
  }

  void _changeEditState() {
    setState(() {
      this.isEditing = !this.isEditing;
      if (this.tag == 'Edit')
        this.tag = 'Save';
      else
        this.tag = 'Edit';
    });
  }

  void _updateNameValue() {
    print('name field: ${nameController.text}');
  }

  void _updateMailValue() {
    print('mail field: ${mailController.text}');
  }

  void _updateGenreValue() {
    print('genre field: ${genreController.text}');
  }

  void _updateBirthDateValue() {
    print('birthDate field: ${birthDateController.text}');
  }

  void _updateDescriptionValue() {
    print('description field: ${descriptionController.text}');
  }

  @override
  void dispose() {
    nameController.dispose();
    mailController.dispose();
    genreController.dispose();
    birthDateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CustomTitle(title: 'Usuario'),
              Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: <Widget>[
                    Container(width: 200, child: CustomToken()),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryColor)),
                      onPressed: _changeEditState,
                      child: Text(this.tag),
                    ),
                  ]),
              Expanded(
                  child: ListView(children: <Widget>[
                CustomTextField(
                  title: 'Nombre',
                  icon: Icons.perm_identity,
                  enable: this.isEditing,
                  controller: nameController,
                ),
                CustomTextField(
                  title: 'Correo',
                  icon: Icons.mail_outline,
                  enable: this.isEditing,
                  controller: mailController,
                ),
                CustomDropDown(
                  title: 'Género',
                  icon: Icons.family_restroom,
                  enable: this.isEditing,
                ),
                CustomDatePicker(
                  title: 'Fecha de Nacimiento',
                  icon: Icons.calendar_today,
                  enable: this.isEditing,
                  controller: birthDateController,
                ),
                CustomTextField(
                  title: 'Descripcion',
                  icon: Icons.description_outlined,
                  enable: this.isEditing,
                  controller: descriptionController,
                ),
              ]))
            ],
          ),
        ));
  }
}
