import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommercelayoutsy/src/bloc/user_firebase.dart';
import 'package:ecommercelayoutsy/src/utils/colors_page.dart';
import 'package:ecommercelayoutsy/src/utils/common_screen.dart';
import 'package:ecommercelayoutsy/src/utils/controllers_page.dart';
import 'package:ecommercelayoutsy/src/utils/validator_class.dart';
import 'package:ecommercelayoutsy/src/widgets/button_page.dart';
import 'package:ecommercelayoutsy/src/widgets/otp_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_profile.dart';

class OtpVerificationScreen  extends StatefulWidget {
    var actualCode;
    var mobileNumber;
    var countryCode;
    OtpVerificationScreen({this.actualCode, this.mobileNumber, this.countryCode});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  @override
  void initState() {
    super.initState();
    changeFocusListener(AllControllers.teOtpDigitOne, AllControllers.focusNodeDigitTwo);
    changeFocusListener(AllControllers.teOtpDigitTwo, AllControllers.focusNodeDigitThree);
    changeFocusListener(AllControllers.teOtpDigitThree, AllControllers.focusNodeDigitFour);
    changeFocusListener(AllControllers.teOtpDigitFour, AllControllers.focusNodeDigitFive);
    changeFocusListener(AllControllers.teOtpDigitFive, AllControllers.focusNodeDigitSix);

    setState(() {startTimer();});
  }

  void changeFocusListener(
      TextEditingController teOtpDigitOne, FocusNode focusNodeDigitTwo) {
    teOtpDigitOne.addListener(() {
      if (teOtpDigitOne.text.length > 0 && focusNodeDigitTwo != null) {
        FocusScope.of(context).requestFocus(focusNodeDigitTwo);
      }
      setState(() {});
    });
  }

  Widget inputBox(TextEditingController teOtpDigitOne, FocusNode focusNodeDigitOne, Function validator) {
    return OtpTextField(
      validator: validator,
        inputBoxController: teOtpDigitOne,
        focusNod: focusNodeDigitOne,
        keyBoardType: TextInputType.number,
        textColor: 0xFFA6A6A6,
        textSize: 14.0,
        textFont: "Nexa_Bold",
        maxLength: 1,
        textAlign: TextAlign.center).textField("", "");
  }


  Timer _timer;
  int _start = 30;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget textWidget(){
    if(_start > 0){
      return AutoSizeText(
        "Wait $_start",
        style: GoogleFonts.montserrat(
          fontSize: 12,
          color: WidgetColors.TextColor,
        ),
      );
    } else  {
      return InkWell(
        child: AutoSizeText(
          "Resend",
          style: GoogleFonts.montserrat(
            fontSize: 12,
            color: WidgetColors.MainTitleColor,
          ),
        ),
        onTap: (){
          UserRepository.resendOtpCode(widget.countryCode, widget.mobileNumber);
        },
      );
    }
  }
   bool _btnEnabled = false;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    var otpBox = Padding(
        padding: EdgeInsets.only(left: 70.0, right: 70.0),
        child: Row(
          children: <Widget>[
            inputBox(AllControllers.teOtpDigitOne, AllControllers.focusNodeDigitOne, ValidationData.OtpValidator),
            SizedBox(
              width: 10.0,
            ),
            inputBox(AllControllers.teOtpDigitTwo, AllControllers.focusNodeDigitTwo, ValidationData.OtpValidator),
            SizedBox(
              width: 10.0,
            ),
            inputBox(AllControllers.teOtpDigitThree, AllControllers.focusNodeDigitThree, ValidationData.OtpValidator),
            SizedBox(
              width: 10.0,
            ),
            inputBox(AllControllers.teOtpDigitFour, AllControllers.focusNodeDigitFour, ValidationData.OtpValidator),
            SizedBox(
              width: 10.0,
            ),
            inputBox(AllControllers.teOtpDigitFive, AllControllers.focusNodeDigitFive, ValidationData.OtpValidator),
            SizedBox(
              width: 10.0,
            ),
            inputBox(AllControllers.teOtpDigitSix, AllControllers.focusNodeDigitSix, (String txt){
              if (txt.length == 1){
                setState((){
                  _btnEnabled = true;
                });
              } else {
                setState((){
                  _btnEnabled = false;
                });
              }
            }),
          ],
        ));




     return Scaffold(
         body:  SafeArea(
          child: Form(
              child:
              Container(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowGlow();
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TopContainer(),
                        Container(height: height / 12,),
                        Center(
                          child: RichText(
                            text: new TextSpan(
                              text: 'Please enter the OTP sent to ',
                              style:  GoogleFonts.montserrat(
                                fontSize: 14,
                                color: WidgetColors.TextColor,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                  text: widget.mobileNumber ,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    color: WidgetColors.MainTitleColor,
                                  ),),
                              ],
                            ),
                          ),
                        ),
                        Container(height: height * 0.02,),
                        otpBox,
                        Container(height: height * 0.02,),
                        Padding(padding: EdgeInsets.only(left: 70,right: 70),
                          child:   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                              AutoSizeText(
                                "Didn't receive OTP ?",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  color: WidgetColors.didntColor,
                                ),
                              ),
                              Container(
                                width: width / 9.9,
                              ),
                              textWidget()
                            ],
                          ),),
                        Container(height: height * 0.05,),
                        Container(
                          child: AllControllers.teOtpDigitSix.text.isNotEmpty && AllControllers.teOtpDigitOne.text.isNotEmpty &&
                              AllControllers.teOtpDigitTwo.text.isNotEmpty && AllControllers.teOtpDigitThree.text.isNotEmpty &&
                              AllControllers.teOtpDigitFour.text.isNotEmpty && AllControllers.teOtpDigitFive.text.isNotEmpty
                              ?
                          MaterialButtonClassPage(
                            height: 40,
                            radius: BorderRadius.circular(40),
                            buttonName: "Verify and Proceed",
                            onPress:  (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));

//                              UserRepository.signInWithPhoneNumber(
//                                  AllControllers.teOtpDigitOne.text
//                                  + AllControllers.teOtpDigitTwo.text
//                                  + AllControllers.teOtpDigitThree.text
//                                  + AllControllers.teOtpDigitFour.text
//                                  + AllControllers.teOtpDigitFive.text
//                                  + AllControllers.teOtpDigitSix.text, context);


//                            print("================>>${
//                                AllControllers.teOtpDigitOne.text
//                                + AllControllers.teOtpDigitTwo.text
//                                + AllControllers.teOtpDigitThree.text
//                                + AllControllers.teOtpDigitFour.text
//                                + AllControllers.teOtpDigitFive.text
//                                + AllControllers.teOtpDigitSix.text}");
                              UserRepository.signInWithPhoneNumber(AllControllers.teOtpDigitOne.text + AllControllers.teOtpDigitTwo.text + AllControllers.teOtpDigitThree.text
                              + AllControllers.teOtpDigitFour.text + AllControllers.teOtpDigitFive.text + AllControllers.teOtpDigitSix.text, context);
                             },
                            color: WidgetColors.MainTitleColor,
                            minwidth: 200,
                          ) :
                              AbsorbPointer(
                                child: MaterialButtonClassPage(
                                  height: 40,
                                  radius: BorderRadius.circular(40),
                                  buttonName: "Verify and Proceed",
                                  onPress:  (){
                                   },
                                  color: WidgetColors.MainTitleColor.withOpacity(0.3),
                                  minwidth: 200,
                                ),
                                absorbing: true,
                              )
                        ),
                      ],
                    ),
                  ),
                ),
              )))
    );
  }
}




