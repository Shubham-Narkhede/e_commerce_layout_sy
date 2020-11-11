import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextField {
  final String outPrefixSvgPath;
  final double outPrefixSvgWidth;
  final double outPrefixSvgHeight;
  final int outPrefixSvgColor;
  EdgeInsets margin;
  final TextEditingController inputBoxController;
  final bool isPassword;
  final FocusNode focusNod;
  final TextInputType keyBoardType;
  final TextAlign textAlign;
  final Widget prefix;
  final Widget suffix;
  final int textColor;
  final String textFont;
  final double textSize;
  final bool clickable;
  final int maxLength;
  final Function validator;

  OtpTextField(
      {this.outPrefixSvgPath,
        this.outPrefixSvgWidth = 22.0,
        this.outPrefixSvgHeight = 22.0,
        this.outPrefixSvgColor,
        this.margin,
        this.inputBoxController,
        this.isPassword = false,
        this.focusNod,
        this.keyBoardType = TextInputType.text,
        this.prefix,
        this.suffix,
        this.textColor = 0xFF757575,
        this.textFont = "",
        this.textSize = 12.0,
        this.clickable = true,
        this.maxLength = 0,
        this.textAlign = TextAlign.left,
        this.validator});

  Widget textFieldWithOutPrefix(String hint, String errorMsg) {
    var loginBtn = new Container(
      margin: margin,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(right: 10.0),
          ),
          textField(hint, errorMsg),
        ],
      ),
    );

    return loginBtn;
  }

  Widget textField(String hint, String errorMsg) {
    FocusNode focusNode = focusNod != null ? focusNod : new FocusNode();

    var list = maxLength == 0
        ? null
        : [
      LengthLimitingTextInputFormatter(maxLength),
    ];
    var loginBtn = new Expanded(
      child: new TextFormField(
        obscureText: isPassword,
        controller: inputBoxController,
        focusNode: focusNode,
        keyboardType: keyBoardType,
        enabled: clickable,
        textAlign: textAlign,
        inputFormatters: list,
        decoration: InputDecoration(
          labelText: hint,
          hintText: hint,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        validator: validator,
        onSaved: (val) => val,
      ),
      flex: 6,
    );

    return loginBtn;
  }
}
