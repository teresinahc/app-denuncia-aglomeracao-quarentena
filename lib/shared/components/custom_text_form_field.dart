import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String fieldName;
  final String initialValue;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final StrutStyle strutStyle;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions toolbarOptions;
  final bool showCursor;
  final bool obscureText;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool autovalidate;
  final bool maxLengthEnforced;
  final int maxLines;
  final int minLines;
  final bool expands;
  final int maxLength;
  final ValueChanged<String> onChanged;
  final GestureTapCallback onTap;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextEditingController controller;

  const CustomTextFormField(
      {Key key,
      @required this.fieldName,
      this.textAlign: TextAlign.start,
      this.enableInteractiveSelection: true,
      this.textCapitalization: TextCapitalization.none,
      this.autofocus: false,
      this.readOnly: false,
      this.obscureText: false,
      this.expands: false,
      this.autocorrect: true,
      this.enableSuggestions: true,
      this.autovalidate: false,
      this.maxLengthEnforced: true,
      this.maxLines: 1,
      this.controller,
      this.scrollPadding: const EdgeInsets.all(20.0),
      this.cursorWidth: 2.0,
      this.initialValue,
      this.enabled: true,
      this.focusNode,
      this.keyboardType,
      this.textInputAction,
      this.strutStyle,
      this.textDirection,
      this.textAlignVertical,
      this.toolbarOptions,
      this.showCursor,
      this.minLines,
      this.maxLength,
      this.onChanged,
      this.onTap,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator,
      this.inputFormatters,
      this.cursorRadius,
      this.keyboardAppearance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextFormField(
          onSaved: this.onSaved,
          autovalidate: this.autovalidate,
          initialValue: this.initialValue,
          controller: this.controller,
          validator: this.validator,
          focusNode: this.focusNode,
          keyboardType: this.keyboardType,
          textInputAction: this.textInputAction,
          strutStyle: this.strutStyle,
          textAlign: this.textAlign,
          textAlignVertical: this.textAlignVertical,
          textDirection: this.textDirection,
          textCapitalization: this.textCapitalization,
          autofocus: this.autofocus,
          toolbarOptions: this.toolbarOptions,
          readOnly: this.readOnly,
          showCursor: this.showCursor,
          obscureText: this.obscureText,
          autocorrect: this.autocorrect,
          enableSuggestions: this.enableSuggestions,
          maxLengthEnforced: this.maxLengthEnforced,
          maxLines: this.maxLines,
          minLines: this.minLines,
          expands: this.expands,
          maxLength: this.maxLength,
          onChanged: this.onChanged,
          onTap: this.onTap,
          onEditingComplete: this.onEditingComplete,
          onFieldSubmitted: this.onFieldSubmitted,
          inputFormatters: this.inputFormatters,
          enabled: this.enabled,
          cursorWidth: this.cursorWidth,
          cursorRadius: this.cursorRadius,
          scrollPadding: this.scrollPadding,
          keyboardAppearance: this.keyboardAppearance,
          enableInteractiveSelection: this.enableInteractiveSelection,
          style: TextStyle(color: Theme.of(context).primaryColor),
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText:
                  "Digite ${fieldName.toLowerCase() == "descrição (opcional)" ? "uma" : "um"} ${fieldName.toLowerCase()}",
              labelText: fieldName),
        ));
  }
}
