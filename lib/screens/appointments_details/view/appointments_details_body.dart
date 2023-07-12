import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utility.dart';

class AppointmentsDetailsBody extends StatefulWidget {
  const AppointmentsDetailsBody({Key? key}) : super(key: key);

  @override
  State<AppointmentsDetailsBody> createState() =>
      _AppointmentsDetailsBodyState();
}

class _AppointmentsDetailsBodyState extends State<AppointmentsDetailsBody> {
  String uploadIcon = 'assets/images/upload-cloud.svg';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Utility.getWidth(context) - 32,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Utility.secondaryColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("14:20", style: Utility.primaryText36),
                        Text("Slot - 2 ", style: Utility.primaryText12),
                        Text("1 July, 2023", style: Utility.primaryText16),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ramesh Patel", style: Utility.primaryText24),
                      Text("has virtual consultation with",
                          style: Utility.primaryText16),
                      Text("Dr. Ajit Bhalla", style: Utility.primaryText16),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utility.fullSizedButtonIcon(
                          context,
                              () async {
                            final Uri launchUri = Uri(
                              scheme: 'sms',
                              path: 'https://wa.me/9655748359/?text=Hi',
                            );
                            await launchUrl(launchUri);
                          },
                          'Chat',
                          Colors.white,
                          style: Utility.primaryTextGreen12,
                          'assets/images/ion_logo-whatsapp.svg'),
                      Utility.fullSizedButtonIcon(
                          context,
                          () async {
                            final Uri launchUri = Uri(
                              scheme: 'tel',
                              path: '9874563215',
                            );
                            await launchUrl(launchUri);
                          },
                          'Call',
                          Colors.white,
                          style: Utility.primaryTextGreen12,
                          'assets/images/ic_baseline-call.svg'),
                      Utility.fullSizedButtonIcon(
                          context,
                          () async{
                            final Uri launchUri = Uri(
                              scheme: 'https',
                              path: 'https://www.invoicesimple.com/wp-content/uploads/2022/12/InvoiceSimple-PDF-Template.pdf',
                            );
                            await launchUrl(launchUri);
                          },
                          'View Bills',
                          Colors.white,
                          style: Utility.primaryTextGreen12,
                          'assets/images/mingcute_bill-line.svg')
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: Utility.getWidth(context) - 32,
              decoration: BoxDecoration(
                  color: Utility.greyColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Utility.darkGreyColor,
                        borderRadius: BorderRadius.circular(8)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'upload picture',
                          style: Utility.primaryTextBlack,
                        ),
                        SvgPicture.asset(
                          uploadIcon,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'OR',
                        style: Utility.primaryText12,
                      ),
                      const SizedBox(height: 8),
                      Utility.fullSizedButton(context, () {},
                          'Create Digital Prescription', Utility.primaryColor),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "TimeLine",
              style: Utility.primaryText14,
            ),
            SizedBox(
                width: 24,
                child: Divider(thickness: 2, color: Utility.primaryColor)),
            Timeline.tileBuilder(
              theme: TimelineThemeData(
                nodePosition: 0,
                color: Color(0xffc2c5c9),
                connectorTheme: ConnectorThemeData(
                  thickness: 3.0,
                ),
              ),
              padding: EdgeInsets.only(top: 20.0),
              shrinkWrap: true,
              builder: TimelineTileBuilder.connected(
                indicatorBuilder: (context, index) {
                  return DotIndicator(
                    color: Utility.timeLineColor,
                  );
                },
                connectorBuilder: (_, index, connectorType) {
                  return SolidLineConnector(
                    color: Colors.grey,
                  );
                },
                contentsBuilder: (_, index) {
                  return timeLineWidgets[index];
                },
                itemCount: 2,
              ),
            ),
            Text(
              'NOTES',
              style: Utility.primaryText16,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintStyle: Utility.primaryTextGreen16,
                hintText: '+  Add a Self note ',
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Utility.fullSizedButton(
                  context, () {}, 'End consultation', Utility.primaryColor,
                  width: Utility.getWidth(context) - 32),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> timeLineWidgets = [
    Text(''),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Follow-up appointment scheduled on 12 July, \n2023 at 3:20pm in the afternoon.',
            style: Utility.primaryText12,
          ),
          Text(DateFormat.yMMMd().format(DateTime.now()),
              style: Utility.greyText10),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Physical Consultation appointment of 23 July, \n2023 is rescheduled as of 25 July, 2023 at \n6:30pm in the evening.',
            style: Utility.primaryText12,
          ),
          Text(DateFormat.yMMMd().format(DateTime.now()),
              style: Utility.greyText10),
        ],
      ),
    ),
  ];

}
