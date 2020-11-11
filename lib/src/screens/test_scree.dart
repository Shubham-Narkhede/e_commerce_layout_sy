//import 'dart:async';
//
//import 'package:ecommercelayout/test/flutkart.dart';
//import 'package:ecommercelayout/test/logger.dart';
//import 'package:ecommercelayout/test/masked_text.dart';
//import 'package:ecommercelayout/test/reactive_refresh_indicator.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:country_pickers/country_pickers.dart';
//import 'package:country_pickers/country.dart';
//
//
//String accountStatus = '******';
//enum AuthStatus { SOCIAL_AUTH, PHONE_AUTH, SMS_AUTH, PROFILE_AUTH }
//
//class AuthScreen extends StatefulWidget {
//
//  @override
//  _AuthScreenState createState()  => _AuthScreenState();
//}
//
//class _AuthScreenState extends State<AuthScreen> {
//  //Country _selected;
//  static const String TAG = "AUTH";
//  AuthStatus status = AuthStatus.SOCIAL_AUTH;
//  // Keys
//  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//  final GlobalKey<MaskedTextFieldState> _maskedPhoneKey =
//  GlobalKey<MaskedTextFieldState>();
//
//  // Controllers
//  TextEditingController smsCodeController = TextEditingController();
//  TextEditingController phoneNumberController = TextEditingController();
//  FirebaseUser user;
//  var uid;
//  // Variables
//  String _errorMessage;
//  String _verificationId;
//  Timer _codeTimer;
//  String uuid;
//  String newphone = '91';
//  String newphone2;
//  bool _isRefreshing = false;
//  bool _codeTimedOut = false;
//  bool _codeVerified = false;
//  Duration _timeOut = const Duration(minutes: 1);
//  String phone;
//  String phoneno;
//  // Firebase
//
//  var user11 = FirebaseAuth.instance;
//  final GoogleSignIn googleSignIn = GoogleSignIn();
//  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//
//  GoogleSignInAccount _googleUser;
//  FirebaseUser currentUser;
//
//  Future getUser() async {
//    FirebaseAuth _auth = FirebaseAuth.instance;
//    FirebaseUser user = await _auth.currentUser();
//    uid = user.uid;
//  }
//
//  get onValuePicked => null;
//
//  // PhoneVerificationCompleted
//  verificationCompleted(FirebaseUser user) async {
//    Logger.log(TAG, message: "onVerificationCompleted, user: $user");
//
//    if (await _onCodeVerified(user)) {
//      await _finishSignIn(user);
//    } else {
//      setState(() {
//        this.status = AuthStatus.SMS_AUTH;
//        Logger.log(TAG, message: "Changed status to $status phone authentication completed");
//      });
//    }
//  }
//
//
//  // PhoneVerificationFailed
//  verificationFailed(AuthException authException) {
//    _showErrorSnackbar(
//        "We couldn't verify your code for now, please try again!");
//    Logger.log(TAG,
//        message:
//        'onVerificationFailed, code: ${authException
//            .code}, message: ${authException.message}');
//  }
//
//  // PhoneCodeSent
//  codeSent(String verificationId, [int forceResendingToken]) async {
//    Logger.log(TAG, message:
//    "Verification code sent to number ${phoneNumberController.text}");
//    _codeTimer = Timer(_timeOut, () {
//      setState(() {
//        _codeTimedOut = true;
//      });
//    });
//    _updateRefreshing(false);
//    setState(() {
//      this._verificationId = verificationId;
//      this.status = AuthStatus.SMS_AUTH;
//      Logger.log(TAG, message: "Changed status to $status");
//    });
//  }
//
//  // PhoneCodeAutoRetrievalTimeout
//  codeAutoRetrievalTimeout(String verificationId) {
//    Logger.log(TAG, message: "onCodeTimeout");
//    _updateRefreshing(false);
//    setState(() {
//      this._verificationId = verificationId;
//      this._codeTimedOut = true;
//    });
//  }
//
//  final decorationStyle = TextStyle(color: Colors.grey, fontSize: 16.0);
//  final hintStyle = TextStyle(color: Colors.grey);
//
//  @override
//  void dispose() {
//    _codeTimer?.cancel();
//    super.dispose();
//
//  }
//
//  // async
//
//  Future<Null> _updateRefreshing(bool isRefreshing) async {
//    Logger.log(TAG,
//        message: "Setting _isRefreshing ($_isRefreshing) to $isRefreshing");
//    if (_isRefreshing) {
//      setState(() {
//        this._isRefreshing = false;
//      });
//    }
//    setState(() {
//      this._isRefreshing = isRefreshing;
//    });
//  }
//
//  _showErrorSnackbar(String message) {
//    _updateRefreshing(false);
//    _scaffoldKey.currentState.showSnackBar(
//      SnackBar(content: Text(message)),
//    );
//  }
//
//  Future<Null> _signIn() async {
//    GoogleSignInAccount user = googleSignIn.currentUser;
//    Logger.log(TAG, message: "Just got user as: $user");
//
//    if (user != null) {
//      await googleSignIn.signIn().then((account) {
//        user = account;
//      }, onError: (error) {
//        TextStyle(color: Colors.black,fontSize: 18);
//        _showErrorSnackbar(
//            "Couldn't log in with your Google account, please try again!");
//      });
//    }
//
//    if (user == null) {
//      _updateRefreshing(false);
//      this._googleUser = user;
//      setState(() {
//        this.status = AuthStatus.PHONE_AUTH;
//        Logger.log(TAG, message: "Changed status to $status");
//      });
//      return null;
//    }
//    return null;
//  }
//
//  Future<Null> _submitPhoneNumber() async {
//    final error = _phoneInputValidator();
//    if (error != null) {
//      _updateRefreshing(false);
//      setState(() {
//        _errorMessage = error;
//      });
//      return null;
//    } else {
//      _updateRefreshing(false);
//      setState(() {
//        _errorMessage = null;
//      });
//      final result = await _verifyPhoneNumber();
//      Logger.log(TAG, message: "Returning $result from _submitPhoneNumber");
//      return result;
//    }
//  }
//
//  String get phoneNumber {
//    String unmaskedText = _maskedPhoneKey.currentState.unmaskedText;
//    Logger.log(TAG, message: "Returning $newphone from _submitPhoneNumber");
//    String formatted = "+$newphone$unmaskedText".trim();
//    return formatted;
//  }
//
//  Future<Null> _verifyPhoneNumber() async {
//    Logger.log(TAG, message: "Got phone number as: ${this.phoneNumber}");
//    phone=this.phoneNumber;
//    print('yyyyyyyy:$phone');
//    await firebaseAuth.verifyPhoneNumber(
//        phoneNumber:this.phoneNumber,
//        timeout: _timeOut,
//        codeSent: codeSent,
//        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//        verificationCompleted: verificationCompleted(user),
//        verificationFailed: verificationFailed);
//    Logger.log(TAG, message: "Returning null from _verifyPhoneNumber");
//    return null;
//  }
//
//  Future<Null> _submitSmsCode() async {
//    final error = _smsInputValidator();
//    if (error != null) {
//      _updateRefreshing(false);
//      _showErrorSnackbar(error);
//      return null;
//    } else {
//      if (this._codeVerified) {
//        await _finishSignIn(await firebaseAuth.currentUser());
//      } else {
//        Logger.log(TAG, message: "_signInWithPhoneNumber called");
//        await _signInWithPhoneNumber();
//      }
//      return null;
//    }
//  }
//
////  Future<void> _signInWithPhoneNumber() async {
////    FirebaseAuth _auth = FirebaseAuth.instance;
////
////    final errorMessage = "We couldn't verify your code, please try again!";
////    final AuthCredential credential = PhoneAuthProvider.getCredential(
////      verificationId: _verificationId,
////      smsCode: smsCodeController.text,
////    );
////
////    final FirebaseUser user = (await _auth.signInWithCredential(credential)) as FirebaseUser;
////
////    .then((user) async {
////      await _onCodeVerified(user).then((codeVerified) async {
////        this._codeVerified = codeVerified;
////
////        FirebaseAuth auth = FirebaseAuth.instance;
////
////        debugPrint('auth:auth.currentUser()');
////        print(auth.currentUser());
////        FirebaseUser  mCurrentUser = await auth.currentUser();
////
////        print('Hello ' + mCurrentUser.displayName.toString());
////
////        setState(() {
////          mCurrentUser != null ? accountStatus = 'Signed In' : 'Not Signed In';
////        });
////        Logger.log(
////          TAG,
////          message: "Returning ${this._codeVerified} from _onCodeVerified",
////        );
////        if (this._codeVerified) {
////          await _finishSignIn(user);
////        } else {
////          _showErrorSnackbar(errorMessage);
////        }
////      });
////    }, onError: (error) {
////      print("Failed to verify SMS code: $error");
////      _showErrorSnackbar(errorMessage);
////    });
////  }
//
//  FirebaseAuth _auth = FirebaseAuth.instance;
//
//  Future<String> _signInWithPhoneNumber() async {
//    final AuthCredential credential = PhoneAuthProvider.getCredential(
//      verificationId: _verificationId,
//      smsCode: smsCodeController.text,
//    );
//    final FirebaseUser user = (await _auth.signInWithCredential(credential)) as FirebaseUser;
//    final FirebaseUser currentUser = await _auth.currentUser();
//    assert(user.uid == currentUser.uid);
//
//    smsCodeController.text = '';
//    return 'signInWithPhoneNumber succeeded: $user';
//  }
//
//  Future<bool> _onCodeVerified(FirebaseUser user) async {
//    final isUserValid = (user != null &&
//        (user.phoneNumber != null && user.phoneNumber.isNotEmpty));
//    if (isUserValid) {
//      setState(() {
//        // Here we change the status once more to guarantee that the SMS's
//        // text input isn't available while you do any other request
//        // with the gathered data
//        this.status = AuthStatus.PROFILE_AUTH;
//        Logger.log(TAG, message: "Changed status to $status");
//      });
//    } else {
//      _showErrorSnackbar("We couldn't verify your code, please try again!");
//    }
//    return isUserValid;
//  }
//
//
//  _finishSignIn(FirebaseUser user) async {
//    getUser();
//    await _onCodeVerified(user).then((result) async {
//      if (result) {
//        print("Failed to gggg SMS code: $phone");
//        FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
//          setState(() {
//            this.uid = user.uid;
//          });
//        });
//      }
//      else {
//        setState(() {
//          this.status = AuthStatus.SMS_AUTH;
//        });
//        TextStyle(color: Colors.black,fontSize: 18);
//        _showErrorSnackbar(
//            "We couldn't create your profile for now, please try again later");
//      }
//    });
//  }
//  Widget _buildSocialLoginBody() {
//    return Center(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: <Widget>[
//          SizedBox(height: 24.0),
////          GoogleSignInButton(
////            onPressed: () => _updateRefreshing(true),
////
////          ),
//          Divider(),
//          SizedBox(height: 24.0),
////          RecoverButton(
////              onPressed: ()
////              {
////                Navigator.pushReplacement(context, MaterialPageRoute(
////                    builder: (context) => new SignInScreen()));
////              }
////          ),
//        ],
//      ),
//    );
//  }
//
//  Widget _buildConfirmInputButton() {
//    final theme = Theme.of(context);
//    return IconButton(
//      icon: Icon(Icons.check),
//      color: Colors.black,
//      disabledColor: theme.buttonColor,
//      onPressed: (this.status == AuthStatus.PROFILE_AUTH)
//          ? null
//          : () => _updateRefreshing(true),
//    );
//  }
//
//  Widget _buildPhoneNumberInput() {
//    return MaskedTextField(
//      key: _maskedPhoneKey,
//      mask: "xx xxxxxxxxxx",
//      keyboardType: TextInputType.number,
//      maskedTextFieldController: phoneNumberController,
//      maxLength: 15,
//      onSubmitted: (text) => _updateRefreshing(true),
//      style: TextStyle(color: Colors.black,fontSize: 18),
//      inputDecoration: InputDecoration(
//        isDense: false,
//        enabled: this.status == AuthStatus.PHONE_AUTH,
//        counterText: "",
//        labelStyle: decorationStyle,
//        hintText: "9999999999",
//        hintStyle: hintStyle,
//        errorText: _errorMessage,
//      ),
//    );
//  }
//
//  Widget _buildPhoneAuthBody() {
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      crossAxisAlignment: CrossAxisAlignment.center,
//      children: <Widget>[
//
//        Padding(
//          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
//          child: Text(
//            "We'll send an SMS message to verify your identity, please enter your number right below!",
//            style: TextStyle(color: Colors.black,fontSize: 18),
//            textAlign: TextAlign.center,
//          ),
//        ),
//
//        Padding(
//          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
//          child: Flex(
//            direction: Axis.horizontal,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Flexible(flex: 2,child: _buildCountryPickerDropdown()),
//              Flexible(flex: 3, child: _buildPhoneNumberInput()),
//              Flexible(flex: 1, child: _buildConfirmInputButton())
//            ],
//          ),
//        ),
//      ],
//    );
//  }
//
//  Widget _buildSmsCodeInput() {
//    final enabled = this.status == AuthStatus.SMS_AUTH;
//    return TextField(
//      keyboardType: TextInputType.number,
//      enabled: enabled,
//      textAlign: TextAlign.center,
//      controller: smsCodeController,
//      maxLength: 6,
//      style: Theme.of(context).textTheme.subhead.copyWith(
//        color: enabled ? Colors.black: Theme
//            .of(context)
//            .buttonColor,
//      ),
//      decoration: InputDecoration(
//        counterText: "",
//        enabled: enabled,
//        hintText: "--- ---",
//        hintStyle: hintStyle.copyWith(fontSize: 42.0),
//      ),
//    );
//  }
//
//  _buildCountryPickerDropdown() => Row(
//    children: <Widget>[
//      CountryPickerDropdown(
//          initialValue: 'in',
//          itemBuilder: _buildDropdownItem,
//          onValuePicked: (Country country) {
//            if(country.phoneCode.isEmpty) {
//              newphone = '+91';
//              print("${country.name}");
//              newphone2 = newphone.substring(1);
//            }
//            else {
//              newphone = country.phoneCode.toString();
//              print("${country.name}");
//              newphone2 = newphone.substring(1);
//            }
//          }
//      ),
//    ],
//  );
//
//
//
//  Widget _buildDropdownItem(Country country) => Container(
//    child: Row(
//      children: <Widget>[
//        //CountryPickerUtils.getDefaultFlagImage(country),
//        Text("+${country.phoneCode}"),
//
//      ],
//    ),
//  );
//
//  Widget _buildResendSmsWidget() {
//    return InkWell(
//      onTap: () async {
//        if (_codeTimedOut) {
//          await _verifyPhoneNumber();
//        } else {
//          TextStyle(color: Colors.black,fontSize: 15);
//          _showErrorSnackbar("You can't retry yet!");
//        }
//      },
//      child: Padding(
//        padding: const EdgeInsets.all(4.0),
//        child: RichText(
//          textAlign: TextAlign.center,
//
//          text: TextSpan(
//            text: "If your code does not arrive in 1 minute, touch",
//            //style: decorationStyle,
//            style: TextStyle(color: Colors.black,fontSize: 18),
//            children: <TextSpan>[
//              TextSpan(
//                text: " here",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  Widget _buildSmsAuthBody() {
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      crossAxisAlignment: CrossAxisAlignment.center,
//      children: <Widget>[
//        Padding(
//          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
//          child: Text(
//            "Verification code",
//            //style: decorationStyle,
//            style: TextStyle(color: Colors.black,fontSize: 20),
//            textAlign: TextAlign.center,
//          ),
//        ),
//        Padding(
//          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 64.0),
//          child: Flex(
//            direction: Axis.horizontal,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Flexible(flex: 5, child: _buildSmsCodeInput()),
//              Flexible(flex: 2, child: _buildConfirmInputButton())
//            ],
//          ),
//        ),
//        Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 24.0),
//          child: _buildResendSmsWidget(),
//        )
//      ],
//    );
//  }
//
//  String _phoneInputValidator() {
//    if (phoneNumberController.text.isEmpty) {
//      TextStyle(color: Colors.black,fontSize: 18);
//      return "Your phone number can't be empty!";
//    } else if (phoneNumberController.text.length < 11) {
//      TextStyle(color: Colors.black,fontSize: 18);
//      return "This phone number is invalid!";
//    }
//    return null;
//  }
//
//  String _smsInputValidator() {
//    if (smsCodeController.text.isEmpty) {
//      TextStyle(color: Colors.black,fontSize: 18);
//      return "Your verification code can't be empty!";
//    } else if (smsCodeController.text.length < 6) {
//      TextStyle(color: Colors.black,fontSize: 18);
//      return "This verification code is invalid!";
//    }
//    return null;
//  }
//
//  Widget _buildBody() {
//    Widget body;
//    switch (this.status) {
//      case AuthStatus.SOCIAL_AUTH:
//        body = _buildSocialLoginBody();
//        break;
//      case AuthStatus.PHONE_AUTH:
//        body = _buildPhoneAuthBody();
//        break;
//      case AuthStatus.SMS_AUTH:
//      case AuthStatus.PROFILE_AUTH:
//        body = _buildSmsAuthBody();
//        break;
//    }
//    return body;
//  }
//
//  Future<Null> _onRefresh() async {
//    switch (this.status) {
//      case AuthStatus.SOCIAL_AUTH:
//        return await _signIn();
//        break;
//      case AuthStatus.PHONE_AUTH:
//        return await _submitPhoneNumber();
//        break;
//      case AuthStatus.SMS_AUTH:
//        return await _submitSmsCode();
//        break;
//      case AuthStatus.PROFILE_AUTH:
//        break;
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      key: _scaffoldKey,
//      body: Stack(
//        fit: StackFit.expand,
//        children: <Widget>[
//
//          Container(
//            decoration: BoxDecoration(color: Colors.green),
//          ),
//          Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              Expanded(
//                flex: 2,
//                child: Container(
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      CircleAvatar(
//                        backgroundColor: Colors.white,
//                        radius: 50.0,
//                        child: Icon(
//                          Icons.group,
//                          color: Colors.green,
//                          size: 50.0,
//                        ),
//                      ),
//                      Padding(
//                        padding: EdgeInsets.only(top: 10.0),
//                      ),
//                      Text(
//                        Flutkart.name,
//                        style: TextStyle(
//                            color: Colors.black,
//                            fontWeight: FontWeight.bold,
//                            fontSize: 26.0),
//                      ),
//                      Divider(),
//                      ReactiveRefreshIndicator(
//                        onRefresh: _onRefresh,
//                        isRefreshing: _isRefreshing,
//                        child: Container(child: _buildBody()),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          )
//        ],
//      ),
//    );
//  }
//}