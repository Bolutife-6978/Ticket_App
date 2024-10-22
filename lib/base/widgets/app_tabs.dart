import 'package:flutter/material.dart';

class AppTabs extends StatelessWidget {
  final String tabText;
  final bool tabColor;
  final bool tabBorder;
  const AppTabs(
      {super.key,
        this.tabColor = false,
         this.tabText = "",
         this.tabBorder = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      width: size.width * .44,
      decoration: BoxDecoration(
          color: tabColor==false ? Colors.white: Colors.transparent,
          borderRadius: tabBorder == false
              ? const BorderRadius.horizontal(left: Radius.circular(50))
              : const BorderRadius.horizontal(right: Radius.circular(50))),
      child: Center(child: Text(tabText)),
    );
  }
}
