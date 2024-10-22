import 'package:flutter/material.dart';

import '../../../base/res/styles/app_styles.dart';

class AppTextIcon extends StatelessWidget {
  final String iconText;
  final IconData icon;
  const AppTextIcon({super.key, required this.iconText, required this.icon});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Container(
      width: size.width*.88,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),
      child: Row(
        children: [
          Icon(icon, color: AppStyles.planeColor,),
          const SizedBox(width:10,),
          Text(iconText, style: AppStyles.textStyle,),
        ],
      ),
    );
  }
}
