import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timelines/timelines.dart';

import '../../../utility.dart';

class AppointmentsDetailsBody extends StatefulWidget {
  const AppointmentsDetailsBody({Key? key}) : super(key: key);

  @override
  State<AppointmentsDetailsBody> createState() => _AppointmentsDetailsBodyState();
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
                  borderRadius: BorderRadius.circular(8)
              ),
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
                      Text("has virtual consultation with", style: Utility.primaryText16),
                      Text("Dr. Ajit Bhalla", style: Utility.primaryText16),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utility.fullSizedButtonIcon(context, (){}, 'Chat', Colors.white, style: Utility.primaryTextGreen12, 'assets/images/ion_logo-whatsapp.svg'),
                      Utility.fullSizedButtonIcon(context, (){}, 'Call', Colors.white, style: Utility.primaryTextGreen12, 'assets/images/ic_baseline-call.svg'),
                      Utility.fullSizedButtonIcon(context, (){}, 'View Bills', Colors.white, style: Utility.primaryTextGreen12, 'assets/images/mingcute_bill-line.svg')
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              width: Utility.getWidth(context) - 32,
              decoration: BoxDecoration(
                  color: Utility.greyColor,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Utility.darkGreyColor,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('upload picture',style: Utility.primaryTextBlack,),
                        SvgPicture.asset(
                          uploadIcon,
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 8),
                      Text('OR', style: Utility.primaryText12,),
                      const SizedBox(height: 8),
                      Utility.fullSizedButton(context, (){}, 'Create Digital Prescription', Utility.primaryColor),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text('NOTES', style: Utility.primaryText16,),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TimelineTile(
                contents: Column(
                  children: [

                  ],
                ),
                node: TimelineNode(
                  indicator: DotIndicator(color: Utility.timeLineColor, size: 12),
                  startConnector: SolidLineConnector(),
                  endConnector: SolidLineConnector(),
                ),
                nodeAlign: TimelineNodeAlign.start,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintStyle: Utility.primaryTextGreen16,
                hintText: '+  Add a Self note ',
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Utility.fullSizedButton(context, (){}, 'End consultation', Utility.primaryColor, width: Utility.getWidth(context) - 32),
            ),
          ],
        ),
      ),
    );
  }


}
