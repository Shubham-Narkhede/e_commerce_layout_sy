import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:ecommercelayoutsy/src/bloc/user_firebase.dart';
import 'package:ecommercelayoutsy/src/screens/user_profile.dart';
import 'package:ecommercelayoutsy/src/utils/common_screen.dart';
import 'package:ecommercelayoutsy/src/utils/controllers_page.dart';
import 'package:ecommercelayoutsy/src/utils/validator_class.dart';
import 'package:ecommercelayoutsy/src/utils/vertical_divider.dart';
import 'package:ecommercelayoutsy/src/widgets/button_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommercelayoutsy/src/utils/colors_page.dart';
import 'package:page_transition/page_transition.dart';
import 'otp_verification_screen.dart';
import 'package:ecommercelayoutsy/src/utils/validate_inputs.dart';
class MobileNumberPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MobileNumberPage();
  }
}

//30034220264  sbin0007235

class _MobileNumberPage extends State<MobileNumberPage> with TickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    getUser();
    super.initState();
  }

  var uid;
  Future getUser() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await _auth.currentUser();
    try{
      uid = user.uid;
      if(uid == null || uid == ""){

      } else {
        Navigator.push(context,
            PageTransition(type: PageTransitionType.fade,
                alignment: Alignment.center,
                child: UserProfile()));
      }
    }catch(_){
      print("error");
    }
   }

  Country _selectedDialogCountry = CountryPickerUtils.getCountryByPhoneCode('91');

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: CountryPickerDialog(
                titlePadding: EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                title: Text('Select your phone code'),
                onValuePicked: (Country country) =>
                    setState(() => _selectedDialogCountry = country),
                priorityList: [
                  CountryPickerUtils.getCountryByIsoCode('IN'),
                  CountryPickerUtils.getCountryByIsoCode('US'),
                ],
                itemBuilder: _buildDialogItem)),
      );

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          SizedBox(width: 8.0),
          Flexible(child: Text(country.name))
        ],
      );

  Widget _build_DialogItem(Country country) => Row(
        children: <Widget>[
          Text("+${country.phoneCode}"),
        ],
      );

//  void validateInputs() {
//    if (ValidationData.formKeyValidateMobileScreen.currentState.validate()) {
//      setState(() {
//        UserRepository.verifyPhone(_selectedDialogCountry.phoneCode, AllControllers.phoneController.text, context);
//        ValidationData.formKeyValidateMobileScreen.currentState.save();
//      });
//    } else {
//      setState(() {
//        ValidationData.autoValidateMobileScreen = true;
//        ValidationData.scaffoldKeyMobileScreen.currentState.hideCurrentSnackBar();
//      });
//    }
//  }




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 19;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: ValidationData.scaffoldKeyMobileScreen,
        body: SafeArea(
            child: Form(
                key: ValidationData.formKeyValidateMobileScreen,
                autovalidate: ValidationData.autoValidateMobileScreen,
                child:
                Container(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowGlow();
                      },
                      child: SingleChildScrollView(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TopContainer(),
                                Container(
                                  height: height,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 35),
                                  child: AutoSizeText(
                                    "Welcome",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: WidgetColors.MainTitleColor,
                                        ),
                                  ),
                                ),
                                Container(
                                  height: height / 1.5,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 35),
                                  child: AutoSizeText(
                                    "Phone number",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: WidgetColors.TextColor,
                                         ),
                                  ),
                                ),
                                Container(
                                  height: height / 3.5,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 35, right: 35),
                                    child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 10,
                                          ),
                                          InkWell(
                                            child: Container(
                                              width:
                                              MediaQuery.of(context).size.width /
                                                  8,
                                              child: Center(
                                                child: _build_DialogItem(
                                                    _selectedDialogCountry),
                                              ),
                                            ),
                                            onTap: _openCountryPickerDialog,
                                          ),
                                          Vertical_Divider(),
                                          Expanded(
                                            child: TextFormField(
                                              controller: AllControllers.phoneController,
                                              keyboardType: TextInputType.number,
                                              validator: ValidationData.MobileValidator,
                                              decoration: InputDecoration(errorStyle: TextStyle(
                                                  fontSize: 14.0, color: WidgetColors.errorTextColor),
                                                  contentPadding: const EdgeInsets.all(15.0),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                                                      color: Colors.transparent),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                                                      color: WidgetColors.TextfieldColor),
                                                  ),
                                                  errorBorder: OutlineInputBorder(borderSide: BorderSide(
                                                      color: Colors.red)),
                                                  hintText: "Your Phone Number",
                                                  hintStyle: GoogleFonts.montserrat(color: WidgetColors.HintColor,
                                                      fontSize: 14)),
                                            ),
                                          )
                                        ],
                                      ),
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: WidgetColors.TextfieldColor,
                                          borderRadius: BorderRadius.circular(5)),
                                    )),
                                Container(
                                  height: height / 5,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 50),
                                  child: AutoSizeText(
                                    "You will receive OTP on this number",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        color: WidgetColors.PhoneNumberBelowColor),
                                  ),
                                ),
                                Container(
                                  height: height / 2,
                                ),
                                MaterialButtonClassPage(
                                  height: 40,
                                  radius: BorderRadius.circular(40),
                                  buttonName: "Get OTP",
                                  onPress: () {
                                    Navigator.push(context,
                                        PageTransition(type: PageTransitionType.fade,
                                            alignment: Alignment.center,
                                            child: OtpVerificationScreen(
                                              actualCode: "verificationId",
                                              mobileNumber: AllControllers.phoneController.text,
                                              countryCode: _selectedDialogCountry.phoneCode,)));
//                                    ValidateInputs.validateInputs(_selectedDialogCountry.phoneCode, context);
                                  },
                                  color: WidgetColors.MainTitleColor,
                                  minwidth: 150,
                                ),
                              ],
                            ),
                          ))),
                ))));
  }
}


