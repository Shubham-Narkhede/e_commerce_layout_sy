import 'package:ecommercelayoutsy/src/utils/colors_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_textfield.dart';

class InputWidget extends StatefulWidget{
  double right;
  var title;
  var hintText;
  TextEditingController textEditingController;
  Function formFieldValidator;
  TextInputType textInputType;
  TextCapitalization textCapitalization;
  Color starColor = Colors.white;
  Color focusBorder;
  Color cursorColor;

  InputWidget({
    this.title,this.right,this.textInputType,this.formFieldValidator,this.textEditingController,this.hintText,
    this.textCapitalization,this.starColor, this.focusBorder, this.cursorColor
});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _inputWidget();
  }
}

class _inputWidget extends State<InputWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:Padding(padding: EdgeInsets.only(left: 30,right: widget.right,),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.title, style: GoogleFonts.montserrat(color: WidgetColors.TextColor,fontSize: 12,fontWeight: FontWeight.w400 ),),
                Container(
                  width: 1,
                ),
                Icon(Icons.star,color: widget.starColor,size: 6,)
              ],
            ),
            SizedBox(
              height: 7,
            ),
            CustomTextField(
              cursorColor: widget.cursorColor,
              textCapitalization: widget.textCapitalization,
              validator: widget.formFieldValidator,
              textEditingController: widget.textEditingController,
              hintText: widget.hintText,
              enabledcolor: WidgetColors.HintColor,
              bordercolor: WidgetColors.TextColor,
              textInputType: widget.textInputType,

            )
          ],
        ),),
    );
  }

}