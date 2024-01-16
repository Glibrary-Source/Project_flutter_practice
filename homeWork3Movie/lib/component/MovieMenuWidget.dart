
import 'package:flutter/material.dart';

class MovieMenuWidget extends StatelessWidget {

  final Function onTap;
  final String text;
  final bool isSelected;

  const MovieMenuWidget({super.key, required this.onTap, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child:  Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.grey,
            borderRadius: BorderRadius.circular(10)),
        child: Text(text),
      )
    );
  }
}
