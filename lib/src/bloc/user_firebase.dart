import 'package:ecommercelayoutsy/src/screens/otp_verification_screen.dart';
import 'package:ecommercelayoutsy/src/screens/user_profile.dart';
import 'package:ecommercelayoutsy/src/utils/colors_page.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class UserRepository {

  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static FirebaseUser user;
  static var userId;

 static var verificationId;

 static final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
    verificationId = verId;
  };

  static final PhoneVerificationCompleted verifiedSuccess = (AuthCredential authCredential) {
  };

  static final PhoneVerificationFailed veriFailed = (AuthException exception) {
    Fluttertoast.showToast(msg: exception.message,
        backgroundColor: Colors.redAccent.shade400,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 4,
        textColor: Colors.white);
  };


  static Future verifyPhone(var countryCode, var mobileNumber, BuildContext context) async {
    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      verificationId = verId;
      Navigator.push(context,
          PageTransition(type: PageTransitionType.fade,
              alignment: Alignment.center,
              child: OtpVerificationScreen(
                actualCode: verificationId,
                mobileNumber: mobileNumber,
                countryCode: countryCode,)));
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+" + countryCode + mobileNumber,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
  }

  static Future signInWithPhoneNumber(var smsCode, BuildContext context) async {
     AuthCredential _authCredential = await PhoneAuthProvider.getCredential(
        verificationId: verificationId, smsCode: smsCode);
    user = (await _firebaseAuth.signInWithCredential(_authCredential)).user;

    if(user.uid != null || user.uid != "" ){

      print("userepo:${user.uid}");
      Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));

      Fluttertoast.showToast(msg: "Welcome To App Title",
          backgroundColor: WidgetColors.TextfieldColor,
          gravity: ToastGravity.CENTER,
          textColor: WidgetColors.PhoneNumberBelowColor,
          timeInSecForIosWeb: 4);

    } else {
      Fluttertoast.showToast(msg: "Varification Failed",
          backgroundColor: Colors.redAccent.shade400,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white,
          timeInSecForIosWeb: 4);
    }
  }

  static Future resendOtpCode(var countryCode, var mobileNumber) async {

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      verificationId = verId;
      Fluttertoast.showToast(msg: "OTP sent",
          backgroundColor: WidgetColors.TextfieldColor,
          gravity: ToastGravity.CENTER,
          textColor: WidgetColors.MainTitleColor,
          timeInSecForIosWeb: 4);
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+" + countryCode + mobileNumber,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
  }
}