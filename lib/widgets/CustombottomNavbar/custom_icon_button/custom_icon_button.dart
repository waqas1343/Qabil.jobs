import 'package:flutter/material.dart';
class CustomIconButton extends StatelessWidget {

  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final String iconText;
  final Color iconTextColor;
  final VoidCallback onTap;
  final double gap;

  const CustomIconButton({super.key,
    required this.icon,
    required this.iconColor,
    required this.iconSize,
    required this.iconText,
    required this.iconTextColor,
    required this.onTap,
    required this.gap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 72,
        height: 61,
        child: Column(
          children: [
            Icon(icon,color:iconColor,size: iconSize,),
           SizedBox(height: gap,),
           Text(iconText,style: TextStyle(
             fontSize: 13,
             color: iconTextColor,
           ),),
          ],
        ),
      ),
    );
  }
}
