import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap,required this.namButton});
  VoidCallback? onTap;
  String namButton;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(child: Text( namButton,style: const TextStyle(color: Colors.white,fontSize: 20),)),
      ),
    );
  }
}
