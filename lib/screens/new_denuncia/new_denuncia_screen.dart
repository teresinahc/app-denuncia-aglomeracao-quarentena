import 'dart:io';
import 'package:covid_alert/shared/components/app_bar.dart';
import 'package:covid_alert/shared/components/avatar.dart';
import 'package:covid_alert/shared/components/custom_text_form_field.dart';
import 'package:covid_alert/shared/components/screen_with_background.dart';
import 'package:covid_alert/shared/enums/request_state_enum.dart';
import 'package:covid_alert/shared/utils/parse_date.dart';
import 'package:covid_alert/shared/utils/parse_horary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:covid_alert/shared/themes/extensions.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'controllers/new_denuncia_controller.dart';

class NewDenunciaScreen extends StatefulWidget {
  @override
  _NewDenunciaScreenState createState() => _NewDenunciaScreenState();
}

class _NewDenunciaScreenState extends State<NewDenunciaScreen> {
  final _newDenunciaController = GetIt.I.get<NewDenunciaController>();
  final List<File> images = [];

  @override
  void initState() {
    super.initState();
    _newDenunciaController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          title: "Fazer uma nova denúncia",
          leading: Leading.BACK,
          onLeadingPress: () {
            Navigator.pop(context);
          }),
      body: ScreenWithBackground(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 42, left: 17, right: 17, bottom: 29),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _field(
                        fieldName: "Título (opcional)",
                        onChanged: (str) {
                          _newDenunciaController.setTitle(str);
                        }),
                    _field(
                        fieldName: "Descrição (opcional)",
                        onChanged: (str) {
                          _newDenunciaController.setDescription(str);
                        }),
                    _categoryField(onChanged: (value) {
                      _newDenunciaController.setEvent(value);
                    }),
                    _field(
                        fieldName: "Endereço",
                        onChanged: (str) {
                          _newDenunciaController.setAddress(str);
                        }),
                    _dateField(),
                    _buildDivider(h: 23),
                    Divider(
                      height: 1,
                      color: Color(0xFFD9D9D9),
                    ),
                    _buildDivider(h: 28),
                    _imagensField(),
                    _buildDivider(h: 32),
                    _button(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildDivider({double h: 16}) {
    return SizedBox(
      height: h,
    );
  }

  _field({@required String fieldName, ValueChanged<String> onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: CustomTextFormField(
        textCapitalization: TextCapitalization.words,
        fieldName: fieldName,
        onChanged: onChanged,
      ),
    );
  }

  _categoryField({@required ValueChanged<String> onChanged}) {
    return Observer(
      builder: (_) {
        return Container(
          margin: const EdgeInsets.only(left: 13, right: 13, bottom: 27),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(4)),
          child: DropdownButton(
            isExpanded: true,
            underline: Container(),
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 16),
            value: _newDenunciaController.denuncia.event,
            items: <DropdownMenuItem<String>>[
              DropdownMenuItem(
                child: Text("Fila"),
                value: "Fila",
              ),
              DropdownMenuItem(
                child: Text("Reunião"),
                value: "Reunião",
              ),
            ],
            onChanged: onChanged,
            hint: Text("Categoria"),
          ),
        );
      },
    );
  }

  _dateField() {
    return Observer(
      builder: (_) {
        DateTime selectedDate = _newDenunciaController.denuncia.dateTime;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 13),
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 5),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  selectedDate == null
                      ? "Data"
                      : "${parseDate(selectedDate)} - ${parseHorary(selectedDate)}",
                  style: TextStyle(
                      color: selectedDate == null
                          ? Colors.grey[700]
                          : Theme.of(context).primaryColor,
                      fontSize: 16),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  showDatePicker(
                          locale: Locale("pt", "BR"),
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2050))
                      .then((newDate) {
                    showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(selectedDate))
                        .then((time) {
                      _newDenunciaController.setDate(newDate ?? selectedDate);

                      if (time == null)
                        _newDenunciaController.setDate(selectedDate);
                      else {
                        DateTime aux = DateTime(newDate.year, newDate.month,
                            newDate.day, time.hour, time.minute);
                        _newDenunciaController.setDate(aux);
                      }
                    });
                  });
                },
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                width: 1,
                color: Colors.grey,
              )),
        );
      },
    );
  }

  _imagensField() {
    double radius = MediaQuery.of(context).size.width * 0.084;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Wrap(
        alignment: WrapAlignment.start,
        direction: Axis.horizontal,
        runSpacing: MediaQuery.of(context).size.width * 0.084,
        spacing: MediaQuery.of(context).size.width * 0.065,
        children: images.map<Widget>((file) {
          return Stack(
            children: <Widget>[
              Avatar(
                image: FileImage(file),
                radius: radius,
                isRemoveble: true,
                onRemovePressed: () {
                  images.remove(file);
                  setState(() {});
                },
              ),
            ],
          );
        }).toList()
          ..add(Material(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(radius),
            child: InkWell(
              splashFactory: InkRipple.splashFactory,
              borderRadius: BorderRadius.circular(radius),
              onTap: () {
                _addNewImage();
              },
              child: CircleAvatar(
                radius: radius,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.file_upload,
                  size: radius,
                  color: Colors.white,
                ),
              ),
            ),
          )),
      ),
    );
  }

  _addNewImage() {
    FocusScope.of(context).requestFocus(FocusNode());
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 120,
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: () async {
                  Navigator.pop(context);
                  var _image = await ImagePicker.pickImage(
                      source: ImageSource.camera, imageQuality: 50);
                  if (_image != null) {
                    setState(() {
                      images.add(_image);
                    });
                  }
                },
                title: Text(
                  "Tirar uma foto",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              ListTile(
                onTap: () async {
                  Navigator.pop(context);
                  var _image = await ImagePicker.pickImage(
                      source: ImageSource.gallery, imageQuality: 50);
                  if (_image != null)
                    setState(() {
                      images.add(_image);
                    });
                },
                title: Text(
                  "Escolher da galeria",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _button() {
    return Observer(
      builder: (_) {
        return _newDenunciaController.stateSave == RequestState.LOADING
            ? Center(child: CircularProgressIndicator())
            : RaisedButton(
                    child: Text("ADICIONAR DENÚNCIA"),
                    onPressed: _newDenunciaController.isValid
                        ? () async {
                            await _newDenunciaController.saveDenuncia(
                                images: images);
                            Navigator.pop(context);
                          }
                        : null)
                .asDls(context);
      },
    );
  }
}
