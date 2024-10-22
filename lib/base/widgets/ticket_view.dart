import 'package:flutter/material.dart';
import 'package:ticket_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/widgets/big_circle.dart';
import 'package:ticket_app/base/widgets/big_dot.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';
import 'package:ticket_app/base/widgets/ticket_text_layout.dart';

import '../res/styles/app_styles.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView(
      {super.key, required this.ticket,  this.wholeScreen = true, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 180,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen ? 0 : 16),
        child: Column(
          children: [
            //Blue Ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isColor==null ? AppStyles.ticketBlue : AppStyles.ticketColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(21),
                    topRight: Radius.circular(21)),
              ),
              child: Center(
                child: Column(
                  children: [
                    //show departure and destination with icon
                    Row(
                      children: [
                        TextStyleThird(text: ticket["from"]["code"], isColor:isColor),
                        Expanded(child: Container()),
                         BigDot(isColor:isColor),
                        Expanded(
                            child: Stack(
                          children: [
                             SizedBox(
                              height: 24,
                              child: AppLayoutBuilderWidget(
                                randomDivider: 6,
                                isColor:isColor
                              ),
                            ),
                            Center(
                              child: Transform.rotate(
                                  angle: 1.57,
                                  child: Icon(
                                    Icons.local_airport_rounded,
                                    color: isColor==null ? AppStyles.ticketColor: AppStyles.planeSecondColor,
                                  )),
                            )
                          ],
                        )),
                         BigDot(isColor:isColor),
                        Expanded(child: Container()),
                        TextStyleThird(text: ticket["to"]["code"], isColor:isColor),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    //show departure and destination names with time
                    Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child:
                                TextStyleFourth(text: ticket["from"]["name"],isColor:isColor)),
                        Expanded(child: Container()),
                        TextStyleFourth(text: ticket["flying_time"],isColor:isColor),
                        Expanded(child: Container()),
                        SizedBox(
                            width: 100,
                            child: TextStyleFourth(
                              text: ticket["to"]["name"],
                              isColor:isColor,
                              align: TextAlign.end,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //Divider and Circles
            Container(
              color: isColor==null ? AppStyles.ticketOrange : Colors.white,
              child: Row(
                children: [
                  BigCircle(
                    isRight: false,
                    isColor: isColor,
                  ),
                  Expanded(
                      child: AppLayoutBuilderWidget(
                    randomDivider: 16,
                    width: 6,
                        isColor:isColor
                  )),
                   BigCircle(
                    isRight: true,
                    isColor: isColor,
                  ),
                ],
              ),
            ),
            //Orange Ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isColor==null ? AppStyles.ticketOrange : Colors.white,
                borderRadius:  BorderRadius.only(
                    bottomLeft: Radius.circular(isColor==null?21:0),
                    bottomRight: Radius.circular(isColor==null?21:0)),
              ),
              child: Center(
                child: Column(
                  children: [
                    //show departure and destination with icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TicketTextLayout(
                          topText: ticket["date"],
                          bottomText: "DATE",
                          alignment: CrossAxisAlignment.start,
                          isColor: isColor,
                        ),
                        TicketTextLayout(
                          topText: ticket["departure_time"],
                          bottomText: "Departure time",
                          alignment: CrossAxisAlignment.center,
                          isColor: isColor,
                        ),
                        TicketTextLayout(
                          topText: ticket["number"].toString(),
                          bottomText: "Number",
                          alignment: CrossAxisAlignment.end,
                          isColor: isColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
