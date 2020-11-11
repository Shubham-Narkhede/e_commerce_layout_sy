import 'package:flutter/material.dart';

class ValidationData{
  static String NameValidator(String fullName) {
    String patttern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = new RegExp(patttern);
    if (fullName.length == 0) {
      return 'Please enter name';
    } else if (!regExp.hasMatch(fullName)) {
      return 'Please enter valid name';
    }
    return null;
  }

  static String EmailValidator(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Please enter email";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter valid email";
    } else {
      return null;
    }
  }

  static String PasswordValidator(String value) {
    if (value.length == 0) {
      return "Please enter password";
    } else if (value.length < 6) {
      return "Password must be greater than 6 characters";
    } else {
      return null;
    }
  }

  static String MobileValidator(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static String AddressValidator(String fullName) {
    String patttern = r'^[A-Z a-z 0-9,.\-]+$';
    RegExp regExp = new RegExp(patttern);
    if (fullName.length == 0) {
      return 'Please enter address';
    } else if (!regExp.hasMatch(fullName)) {
      return 'Please enter valid address';
    }
    return null;
  }

  static String OtpValidator(String value) {
    if (value.length == 0) {
      return "Please enter OTP";
    } else {
      return null;
    }
  }

  static bool autoValidateMobileScreen = false;
  static final GlobalKey<FormState> formKeyValidateMobileScreen = GlobalKey<FormState>();
  static final scaffoldKeyMobileScreen = GlobalKey<ScaffoldState>();

  static final GlobalKey<ScaffoldState> scaffoldKeyuserProfile = new GlobalKey<ScaffoldState>();
  static bool autoValidateuserProfile = false;
  static final GlobalKey<FormState> formKeyValidateuserProfile = GlobalKey<FormState>();

 static final GlobalKey<ScaffoldState> scaffoldKeyDeliveryAddress = new GlobalKey<ScaffoldState>();
 static bool autoValidateDeliveryAddress = false;
 static final GlobalKey<FormState> formKeyValidateDeliveryAddress = GlobalKey<FormState>();
}

