import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/app_json.dart';
import 'package:ticket_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';

import '../../base/res/media.dart';
import '../../base/widgets/ticket_text_layout.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const SizedBox(
            height: 40,
          ),
          Text("Tickets", style: AppStyles.headLineStyle1),
          const SizedBox(
            height: 20,
          ),
          const AppTicketTabs(firstTab: 'Upcoming', secondTab: 'Previous'),
          const SizedBox(height: 20),
          Container(
            child: TicketView(
              ticket: ticketList[0],
              isColor: true,
            ),
          ),
          const SizedBox(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            color: AppStyles.ticketColor,
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TicketTextLayout(
                      topText: "Flutter DB",
                      bottomText: "Passenger",
                      alignment: CrossAxisAlignment.start,
                      isColor: true,
                    ),
                    TicketTextLayout(
                      topText: "5221 36869",
                      bottomText: "Passport",
                      alignment: CrossAxisAlignment.end,
                      isColor: true,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const AppLayoutBuilderWidget(
                  randomDivider: 16,
                  width: 6,
                  isColor: false,
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TicketTextLayout(
                      topText: "364738 28274478",
                      bottomText: "Number of E-ticket",
                      alignment: CrossAxisAlignment.start,
                      isColor: true,
                    ),
                    TicketTextLayout(
                      topText: "B2SG28",
                      bottomText: "Booking code",
                      alignment: CrossAxisAlignment.end,
                      isColor: true,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const AppLayoutBuilderWidget(
                  randomDivider: 16,
                  width: 6,
                  isColor: false,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppMedia.visaCard,
                              scale: 11,
                            ),
                            Text(
                              " *** 2462",
                              style: AppStyles.headLineStyle3,
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text("Payment method", style: AppStyles.headLineStyle4)
                      ],
                    ),
                    const TicketTextLayout(
                      topText: "5221 36869",
                      bottomText: "Passport",
                      alignment: CrossAxisAlignment.end,
                      isColor: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 1),
          //ticket barcode
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(21),
                    bottomLeft: Radius.circular(21)),
                color: AppStyles.ticketColor),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BarcodeWidget(
                  height: 70,
                  data: 'https://flutter.dev',
                  barcode: Barcode.code128(),
                  drawText: false,
                  color: AppStyles.textColor,
                  width: double.infinity,
                ),
              ),
            ),
          ),
         const SizedBox(height: 25),
          TicketView(ticket: ticketList[0])
        ],
      ),
    );
  }
}
