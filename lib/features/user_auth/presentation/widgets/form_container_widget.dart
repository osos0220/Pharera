import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? hintStyle;
  final String? labelText;
  final String? helperText;
  final String? textAlign;
  final String? borderSide;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  const FormContainerWidget(
      {this.controller,
      this.isPasswordField,
      this.fieldKey,
      this.hintText,
      this.hintStyle,
      this.labelText,
      this.helperText,
      this.textAlign,
      this.borderSide,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType});

  @override
  _FormContainerWidgetState createState() => new _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(5),
      ),
      child: new TextFormField(
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black, fontFamily: 'Vollkorn'),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: new InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 174, 158, 130), width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(30, 158, 158, 158), width: 2.0),
          ),
          // border: InputBorder.none,
          filled: true,

          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: Colors.black45, fontFamily: 'Vollkorn', fontSize: 20),
          suffixIcon: new GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField == true
                ? Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText == false
                        ? Color.fromARGB(255, 174, 158, 130)
                        : Colors.grey,
                  )
                : Text(""),
          ),
        ),
      ),
    );
  }
}
