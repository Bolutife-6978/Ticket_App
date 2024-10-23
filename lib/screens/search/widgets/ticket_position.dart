import 'package:flutter/material.dart';

import '../../../base/res/styles/app_styles.dart';

class TicketPosition extends StatelessWidget {

  final bool? pos;

  const TicketPosition({super.key, this.pos});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: pos == true?8:null,
        right: pos==true?null:8,
        top: 250,
        child: Container(
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2,color: AppStyles.textColor)
          ),
          child: CircleAvatar(
            maxRadius: 4,
            backgroundColor: AppStyles.textColor,
          ),
        ));
  }
}
