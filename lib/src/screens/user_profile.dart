import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommercelayoutsy/src/screens/delivery_full_address.dart';
import 'package:ecommercelayoutsy/src/utils/colors_page.dart';
import 'package:ecommercelayoutsy/src/utils/controllers_page.dart';
import 'package:ecommercelayoutsy/src/utils/validate_inputs.dart';
import 'package:ecommercelayoutsy/src/utils/validator_class.dart';
import 'package:ecommercelayoutsy/src/widgets/button_page.dart';
import 'package:ecommercelayoutsy/src/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommercelayoutsy/src/widgets/input_text_field.dart';

class UserProfile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserProfile();
  }
  
}

class _UserProfile extends State<UserProfile>{

  Future signoutUser() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.signOut();
   }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      key: ValidationData.scaffoldKeyuserProfile,
      body: SafeArea(child: Form(
          key: ValidationData.formKeyValidateuserProfile,
          autovalidate: ValidationData.autoValidateuserProfile,
          child: Container(child:  NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
            }, child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 30,
                  ),
                  Padding(padding: EdgeInsets.only(left: 25),
                    child: AutoSizeText("Title of Application",
                      style: GoogleFonts.montserrat(color: WidgetColors.MainTitleColor, fontSize: 25, ),),),
                  SizedBox(
                    height: height / 30,
                  ),
                  Padding(padding: EdgeInsets.only(left: 25
                  ),
                    child: AutoSizeText("Welcome to title",
                      style: GoogleFonts.montserrat(color: WidgetColors.TextColor, fontSize: 14),),),

                  Padding(padding: EdgeInsets.only(left: 25, top: 10),
                    child: AutoSizeText("Please provide your details, they will be secure with us.",
                      style: GoogleFonts.montserrat(color: WidgetColors.TextColor, fontSize: 10),),),

                  SizedBox(
                    height: height / 25
                  ),
                  Padding(padding: EdgeInsets.only(left: 30 ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(FontAwesome.user, color: WidgetColors.TextColor,size: 20,),
                        SizedBox(
                          width: 10,
                        ),
                        AutoSizeText("Personal details",
                          style: GoogleFonts.montserrat(color: WidgetColors.TextColor, fontSize: 14),)
                      ],
                    ),),

                  Padding(padding: EdgeInsets.only(left: 30,right: 30),
                    child: Divider(
                      color: WidgetColors.TextColor,
                    ),),

                  SizedBox(
                    height: 10,
                  ),

                  InputWidget(
                    cursorColor: WidgetColors.TextColor,
                    starColor: Colors.white,
                    right: 30,
                    title: "First name",
                    hintText: "Enter your first name",
                    textEditingController: AllControllers.nameController,
                    formFieldValidator: ValidationData.NameValidator,
                    textInputType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                  ),


                  SizedBox(
                    height: height / 30,
                  ),

                  InputWidget(starColor: Colors.white,
                    right: 30,
                    cursorColor: WidgetColors.TextColor,
                    title: "Last name",
                    hintText: "Enter your last name",
                    textEditingController: AllControllers.lastNameController,
                    formFieldValidator: ValidationData.NameValidator,
                    textInputType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                  ),

                  SizedBox(
                    height: height / 30,
                  ),
                  InputWidget(starColor: Colors.white,
                    right: 30,
                    title: "Email",
                    cursorColor: WidgetColors.TextColor,
                    hintText: "Enter your email address",
                    textEditingController: AllControllers.emailController,
                    formFieldValidator: ValidationData.EmailValidator,
                    textInputType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                  ),
                  SizedBox(
                    height: height / 15,
                  ),

                  MaterialButtonClassPage(
                    height: 40,
                    radius: BorderRadius.circular(40),
                    buttonName: "Sign Up",
                    onPress: () {
                        ValidateInputs.validateInputsUserprofile(context);
                       },
                    color: WidgetColors.MainTitleColor,
                    minwidth: 150,
                  ),
                ],
              ),
            )
        )
        ),
      ))
      )
    );
  }
}



