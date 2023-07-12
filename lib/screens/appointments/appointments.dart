import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharm/screens/appointments/view/appointments_body.dart';
import 'package:pharm/utility.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Appointments", style: Utility.primaryTitleBlack,),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Utility.darkGreenColor,
        child: const Icon(Icons.group_add_outlined),
        onPressed: () {

        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeSelectedItem,
        currentIndex: selectedItem,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: Utility.buttonPrimaryWhite,
        unselectedLabelStyle: Utility.navUnselected,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Utility.primaryColor,
            label: 'Home',
              icon:  SvgPicture.asset(
                'assets/images/icon_home.svg',
                colorFilter: ColorFilter.mode(
                    selectedItem == 0 ? Colors.white : Colors.black, BlendMode.srcIn),
              )),
          BottomNavigationBarItem(
              backgroundColor: Utility.primaryColor,
              label: 'Appointments',
              icon: SvgPicture.asset(
                'assets/images/uis_schedule.svg',
                colorFilter: ColorFilter.mode(
                    selectedItem == 1 ? Colors.white : Colors.black, BlendMode.srcIn),
              )),
          BottomNavigationBarItem(
              backgroundColor: Utility.primaryColor,
              label: 'Chat',
              icon:  SvgPicture.asset(
                'assets/images/ion_logo-whatsapp.svg',height: 32,
                colorFilter: ColorFilter.mode(
                    selectedItem == 2 ? Colors.white : Colors.black, BlendMode.srcIn),
              )),
          BottomNavigationBarItem(
              backgroundColor: Utility.primaryColor,
              label: 'Notifications',
              icon:SvgPicture.asset(
                'assets/images/icon_notifications.svg',height: 32,
                colorFilter: ColorFilter.mode(
                    selectedItem == 3 ? Colors.white : Colors.black, BlendMode.srcIn),
              )),
        ],
      ),
      body: const AppointmentsBody(),
    );
  }

  changeSelectedItem(int index) {
    setState(() {
      selectedItem = index;
    });
  }

}

