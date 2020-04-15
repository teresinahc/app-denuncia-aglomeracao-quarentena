import 'package:flutter/material.dart';

extension RaisedButtonExtension on RaisedButton {
  Widget asDls(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: RaisedButton(
        disabledColor: Theme.of(context).primaryColor.withOpacity(0.4),
        disabledTextColor: Colors.white,
        onPressed: this.onPressed,
        child: this.child,
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(14.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}

extension TextFieldExtension on TextFormField {
  Widget asDls({@required BuildContext context, @required String fieldName}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        style: TextStyle(color: Theme.of(context).primaryColor),
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText:
                "Digite ${fieldName.toLowerCase() == "descrição (opcional)" ? "uma" : "um"} ${fieldName.toLowerCase()}",
            labelText: fieldName),
      ),
    );
  }
}
