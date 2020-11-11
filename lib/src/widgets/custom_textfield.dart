import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors_page.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.fieldKey,
    this.maxLength,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.textEditingController,
    this.textInputType,
    this.bordercolor,
    this.enabledcolor,
    this.textCapitalization,
    this.cursorColor
  });

  final Key fieldKey;
  final int maxLength;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final Function validator;
  final ValueChanged<String> onFieldSubmitted;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final Color bordercolor;
  final Color enabledcolor;
  final Color cursorColor;
  final TextCapitalization textCapitalization;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: TextFormField(
        cursorColor: widget.cursorColor,
        textCapitalization: widget.textCapitalization,
        controller: widget.textEditingController,
        keyboardType: widget.textInputType,
        validator: widget.validator,
        decoration: InputDecoration(errorStyle: GoogleFonts.roboto(color: WidgetColors.errorTextColor,
            fontSize: 14),
          contentPadding: const EdgeInsets.all(15.0),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(
              color: widget.bordercolor),
          ),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(
              color: widget.enabledcolor),
          ),
//          errorBorder: OutlineInputBorder(borderSide: BorderSide(
//              color: Colors.red.shade100)),
          border: OutlineInputBorder(borderSide: BorderSide(
            width: 1,
            color: Colors.red)),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.montserrat(color: WidgetColors.HintColor,
              fontSize: 14),
        ),
      ),
    );
  }
}