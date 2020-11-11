import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommercelayoutsy/src/screens/bottom_navigation_screen.dart';
import 'package:ecommercelayoutsy/src/utils/colors_page.dart';
import 'package:ecommercelayoutsy/src/utils/controllers_page.dart';
import 'package:ecommercelayoutsy/src/utils/validate_inputs.dart';
import 'package:ecommercelayoutsy/src/utils/validator_class.dart';
import 'package:ecommercelayoutsy/src/widgets/button_page.dart';
import 'package:ecommercelayoutsy/src/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ecommercelayoutsy/src/widgets/input_text_field.dart';
class DeliverAddress extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _deliveryAddress();
  }
}
//AIzaSyDZJEqajaFhUOZCZhh3irBvGsa5p9WHF7o
class _deliveryAddress extends State<DeliverAddress>{
  BitmapDescriptor myIcon;

  @override
  void initState() {
    super.initState();
    setCustomMapPin();

    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/lady.png')
        .then((onValue) {
      myIcon = onValue;
    });

    _markers.add(
        Marker(
          icon: myIcon,
            markerId: MarkerId('SomeId'),
            position: LatLng(37.42796133580664, -122.085749655962),
            infoWindow: InfoWindow(
                title: 'The title of the marker'
            )
        )
    );
  }

  BitmapDescriptor pinLocationIcon;

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/lady.png');
  }


//  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  LatLng pinPosition = LatLng(37.3797536, -122.1017334);
  Set<Marker> _markers = {};


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: ValidationData.scaffoldKeyDeliveryAddress,
      body: SafeArea(
        child: 
        Form(key: ValidationData.formKeyValidateDeliveryAddress,
          autovalidate: ValidationData.autoValidateDeliveryAddress,
          child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height/3,
                  width: width,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      GoogleMap(
                        mapType: MapType.hybrid,
                        initialCameraPosition: _kGooglePlex,
                        markers: Set<Marker>.of(_markers),
                        onMapCreated: (GoogleMapController controller) {
                        },
                      ),
                      Align(alignment: Alignment.topRight,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()));
                            },
                            child: Text("Skip for now >",style: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 12,color: WidgetColors.TextColor),),
                            color: Colors.white70,
                          )
                      )
                    ],
                  ),
                ),

                Container(
                  height: height / 30,
                ),
                InputWidget(
                   cursorColor: WidgetColors.TextColor,
                  starColor: Colors.red,
                  right: 80,
                  title: "House/ Flat No",
                  hintText: "Enter your house/ flat number",
                  textEditingController: AllControllers.housenoController,
                  formFieldValidator: ValidationData.AddressValidator,
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                ),
                Container(
                  height: height / 60,
                ),

                InputWidget(
                   cursorColor: WidgetColors.TextColor,
                  starColor: Colors.red,
                  right: 30,
                  title: "House/ Apartment name",
                  hintText: "Enter your house/ apartment name",
                  textEditingController: AllControllers.appartmentController,
                  formFieldValidator: ValidationData.AddressValidator,
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                ),

                Container(
                  height: height / 60,
                ),
                InputWidget(
                   cursorColor: WidgetColors.TextColor,
                  starColor: Colors.red,
                  right: 30,
                  title: "Road name and Area",
                  hintText: "Enter your area name/ road name",
                  textEditingController: AllControllers.areaController,
                  formFieldValidator: ValidationData.AddressValidator,
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                ),

                Container(
                  height: height / 60,
                ),
                InputWidget(
                   cursorColor: WidgetColors.TextColor,
                  starColor: Colors.red,
                  right: 30,
                  title: "Landmark",
                  hintText: "Enter your area name/ road name",
                  textEditingController: AllControllers.landmarkController,
                  formFieldValidator: ValidationData.AddressValidator,
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                ),

                Container(
                  height: height / 20,
                ),
                MaterialButtonClassPage(
                  height: 40,
                  radius: BorderRadius.circular(40),
                  buttonName: "Save Address",
                  onPress: () {
                    ValidateInputs.validateInputsDeliveryAddress(context);
                   },
                  color: WidgetColors.MainTitleColor,
                  minwidth: 150,
                ),
                Container(
                  height: height / 60,
                ),
              ],
            ),
          ),
        ),)
      ),
    );
  }
}