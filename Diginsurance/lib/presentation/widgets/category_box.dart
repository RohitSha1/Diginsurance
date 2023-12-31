import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryBox extends StatelessWidget {
  // ignore: non_constant_identifier_names
  CategoryBox({ Key? key, required this.title, required this.icon, this.color, required Null Function() Onpress, required Null Function() press}) : super(key: key);
  IconData icon;
  Color? color;
  String title;

  @override
  Widget build(BuildContext context) {
    return  
      Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        
        child: Column(
          children: [
            Icon(icon, size: 40, color: color,),
            const SizedBox(height: 10),
            Text(title, style: TextStyle(color: color),)
          ],
        ) 
      );
  }
}