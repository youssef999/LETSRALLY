import 'package:flutter/material.dart';

import 'Custom_Text.dart';



  class CustomButton extends StatelessWidget {

  final String  text;
  final Function  onPressed;
  final Color  color1,color2;

  const CustomButton({
    required this.text,
    required this.onPressed,
    required this.color1,
    required this.color2,
  });


  @override
  Widget build(BuildContext context) {
    return
      Container(
        width:155,
        height:52,
        child:InkWell(
          child: Container(
            decoration:  BoxDecoration(
              color: color1,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),

            child: Center(
              child:Custom_Text(
                text: text,
                fontSize: 22,
                alignment: Alignment.center,
                color: color2,
              ),
            ),
          ),
          onTap:(){
            onPressed();
          }
        )


        // RaisedButton(
        //
        //   elevation: 10,
        //   onPressed: onPressed(),
        //   color: color1,
        //   // shape: RoundedRectangleBorder(
        //   //     borderRadius: BorderRadius.circular(30)),
        //   child: Padding(
        //     padding: EdgeInsets.all(10),
        //     child: Text(
        //       text,
        //       style: getRegularStyle(color: color2,fontSize:20)
        //     ),
        //   ),
        // ),
      );



    }
}