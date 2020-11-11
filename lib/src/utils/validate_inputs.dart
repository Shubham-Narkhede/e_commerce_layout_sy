

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommercelayoutsy/src/bloc/user_firebase.dart';
import 'package:ecommercelayoutsy/src/screens/bottom_navigation_screen.dart';
import 'package:ecommercelayoutsy/src/screens/delivery_full_address.dart';
import 'package:ecommercelayoutsy/src/utils/validator_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_page.dart';
import 'controllers_page.dart';

class ValidateInputs{

  static validateInputs(var _selectedDialogCountry, BuildContext context) {
    if (ValidationData.formKeyValidateMobileScreen.currentState.validate()) {
      ValidationData.scaffoldKeyMobileScreen.currentState.showSnackBar(
          new SnackBar(
              backgroundColor: WidgetColors.TextfieldColor,
              content:
              Row(
                children: [
                  CircularProgressIndicator(
                    backgroundColor: WidgetColors.MainTitleColor,
                    valueColor: new AlwaysStoppedAnimation<Color>(WidgetColors.TextfieldColor),
                  ),
                  SizedBox(
                    height: 0,
                    width: 20,
                  ),
                  AutoSizeText(
                    "Sending OTP",
                    style: GoogleFonts.roboto(color: WidgetColors.PhoneNumberBelowColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )));
        UserRepository.verifyPhone(_selectedDialogCountry, AllControllers.phoneController.text, context);
        ValidationData.formKeyValidateMobileScreen.currentState.save();

    } else {

        ValidationData.autoValidateMobileScreen = true;
        ValidationData.scaffoldKeyMobileScreen.currentState.hideCurrentSnackBar();

    }
  }


 static void validateInputsUserprofile(BuildContext context) {
    if (ValidationData.formKeyValidateuserProfile.currentState.validate()) {
//      print("asfdafasfasff");

      Future.delayed(const Duration(seconds: 2), () {

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DeliverAddress()));
        });



        ValidationData.scaffoldKeyuserProfile.currentState.showSnackBar(
            new SnackBar(
                backgroundColor: WidgetColors.TextfieldColor,
                content:
                Row(
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: WidgetColors.MainTitleColor,
                      valueColor: new AlwaysStoppedAnimation<Color>(WidgetColors.TextfieldColor),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    AutoSizeText(
                      "Processing",
                      style: GoogleFonts.montserrat(color: WidgetColors.PhoneNumberBelowColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )));
        ValidationData.formKeyValidateuserProfile.currentState.save();

    } else {

        ValidationData.autoValidateuserProfile = true;
        ValidationData.scaffoldKeyuserProfile.currentState.hideCurrentSnackBar();

    }
  }



 static void validateInputsDeliveryAddress(BuildContext context) {
    if (ValidationData.formKeyValidateDeliveryAddress.currentState.validate()) {

      Future.delayed(const Duration(seconds: 2), () {



          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()));



      });

        ValidationData.scaffoldKeyDeliveryAddress.currentState.showSnackBar(
            new SnackBar(
                backgroundColor: WidgetColors.TextfieldColor,
                content:
                Row(
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: WidgetColors.MainTitleColor,
                      valueColor: new AlwaysStoppedAnimation<Color>(WidgetColors.TextfieldColor),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    AutoSizeText(
                      "Processing",
                      style: GoogleFonts.montserrat(color: WidgetColors.PhoneNumberBelowColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )));
        ValidationData.formKeyValidateDeliveryAddress.currentState.save();

    } else {

        ValidationData.autoValidateDeliveryAddress = true;
        ValidationData.scaffoldKeyDeliveryAddress.currentState.hideCurrentSnackBar();

    }
  }
}