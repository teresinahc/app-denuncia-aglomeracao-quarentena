import 'dart:io';
import 'package:covid_alert/shared/components/app_bar.dart';
import 'package:covid_alert/shared/components/avatar.dart';
import 'package:covid_alert/shared/components/custom_text_form_field.dart';
import 'package:covid_alert/shared/enums/request_state_enum.dart';
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _labelSection("Dados da denúncia"),
                  _field(
                      fieldName: "Título (Opcional)",
                      onChanged: (str) {
                        _newDenunciaController.setTitle(str);
                      }),
                  _field(
                      fieldName: "Endereço",
                      onChanged: (str) {
                        _newDenunciaController.setAddress(str);
                      }),
                  _field(
                      fieldName: "Tipo de acontecimento",
                      onChanged: (str) {
                        _newDenunciaController.setEvent(str);
                      }),
                  _field(
                      fieldName: "Descrição (Opcional)",
                      onChanged: (str) {
                        _newDenunciaController.setDescription(str);
                      }),
                  _dateField(),
                  _buildDivider(),
                  _labelSection("Imagens da denúcia (Uma ou mais imagens)"),
                  _imagensField(),
                  _buildDivider(h: 32),
                  _button(),
                ],
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

  _labelSection(text) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(8),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }

  _field({@required String fieldName, ValueChanged<String> onChanged}) {
    return CustomTextFormField(
      textCapitalization: TextCapitalization.words,
      fieldName: fieldName,
      onChanged: onChanged,
    );
  }

  _dateField() {
    return Observer(
      builder: (_) {
        DateTime selectedDate = _newDenunciaController.denuncia.dateTime;
        return Container(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 5),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  selectedDate == null
                      ? "Data"
                      : "${selectedDate.day.toString().padLeft(2, "0")}/${selectedDate.month.toString().padLeft(2, "0")}/${selectedDate.year}",
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
    double radius = ((MediaQuery.of(context).size.width - 82) / 8);
    return Wrap(
      alignment: WrapAlignment.start,
      direction: Axis.horizontal,
      runSpacing: 14,
      spacing: 14,
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
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),
                    child: Text("FAZER DENÚNCIA"),
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
