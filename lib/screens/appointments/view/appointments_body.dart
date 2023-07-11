import 'package:flutter/material.dart';
import 'package:pharm/utility.dart';

class AppointmentsBody extends StatefulWidget {
  const AppointmentsBody({Key? key}) : super(key: key);

  @override
  State<AppointmentsBody> createState() => _AppointmentsBodyState();
}

class _AppointmentsBodyState extends State<AppointmentsBody> {
  TextEditingController search = TextEditingController();
  List<String> statusText = [
    'All',
    'Urgent',
    'Upcoming',
    'Cancelled',
    'Completed'
  ];
  int selectedStatus = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utility.customTextForm('', 'Quick Search', null, search),
            Container(
              height: 72,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: statusText.length,
                separatorBuilder: (_, __) {
                  return const SizedBox(
                    width: 8,
                  );
                },
                itemBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: selectedStatus == index ? Utility.primaryColor : Utility.greyColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                      child: Text(statusText[index],
                          style: selectedStatus == index
                              ? Utility.primaryTextWhite
                              : Utility.primaryTextBlack),
                    ),
                  );
                },
              ),
            ),
            Text('All 12 appointments are listed', style: Utility.miniGreyText,),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              separatorBuilder: (_, __) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemBuilder: (context, _) {
                return buildAppointmentCard(context);
              },
            )
          ],
        ),
      ),
    );
  }

  buildAppointmentCard(BuildContext context) {
    return IntrinsicHeight (
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Utility.secondaryColor,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ramesh Patel", style: Utility.primaryTitleBlack,),
                Text("Dr. Ajit Bhalla", style: Utility.primaryText12,),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Last appointment : 24/8/22", style: Utility.miniGreyText10,),
                    const SizedBox(width: 8),
                    const CircleAvatar(radius: 4, backgroundColor: Colors.red,),
                    const SizedBox(width: 4),
                    Text("Virtual", style: Utility.primaryText12,),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                VerticalDivider(
                  color: Utility.darkGreyColor,
                  thickness: 2,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("14:20", style: Utility.primaryText24,),
                    Text("Slot - 2 ", style: Utility.primaryText12,),
                    Text("1 July", style: Utility.primaryText12,),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}
