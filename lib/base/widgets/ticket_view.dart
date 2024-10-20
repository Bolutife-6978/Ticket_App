import 'package:flutter/material.dart';
import 'package:ticket_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/widgets/big_circle.dart';
import 'package:ticket_app/base/widgets/big_dot.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';
import 'package:ticket_app/base/widgets/ticket_text_layout.dart';

import '../res/styles/app_styles.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 189,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            //Blue Ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppStyles.ticketBlue,
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
                        const TextStyleThird(text: "NYC"),
                        Expanded(child: Container()),
                        const BigDot(),
                        Expanded(
                            child: Stack(
                          children: [
                            const SizedBox(
                              height: 24,
                              child: AppLayoutBuilderWidget(
                                randomDivider: 6,
                              ),
                            ),
                            Center(
                              child: Transform.rotate(
                                  angle: 1.57,
                                  child: const Icon(
                                    Icons.local_airport_rounded,
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        )),
                        const BigDot(),
                        Expanded(child: Container()),
                        const TextStyleThird(text: "LDN"),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    //show departure and destination names with time
                    Row(
                      children: [
                        const SizedBox(
                            width: 100,
                            child: TextStyleFourth(text: "New York")),
                        Expanded(child: Container()),
                        const TextStyleFourth(text: "8H 30M"),
                        Expanded(child: Container()),
                        const SizedBox(
                            width: 100,
                            child: TextStyleFourth(
                              text: "London",
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
              color: AppStyles.ticketOrange,
              child: const Row(
                children: [
                  BigCircle(
                    isRight: false,
                  ),
                  Expanded(
                      child: AppLayoutBuilderWidget(
                    randomDivider: 16,
                    width: 6,
                  )),
                  BigCircle(
                    isRight: true,
                  ),
                ],
              ),
            ),
            //Orange Ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppStyles.ticketOrange,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(21),
                    bottomRight: Radius.circular(21)),
              ),
              child: const Center(
                child: Column(
                  children: [
                    //show departure and destination with icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TicketTextLayout(
                          topText: "1 MAY",
                          bottomText: "DATE",
                          alignment: CrossAxisAlignment.start,
                        ),
                        TicketTextLayout(
                          topText: "08:00 AM",
                          bottomText: "Departure time",
                          alignment: CrossAxisAlignment.center,
                        ),
                        TicketTextLayout(
                          topText: "23",
                          bottomText: "Number",
                          alignment: CrossAxisAlignment.end,
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
