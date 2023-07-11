import 'package:flutter/material.dart';
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
              icon:  Icon(Icons.home_outlined)),
          BottomNavigationBarItem(
              backgroundColor: Utility.primaryColor,
              label: 'Appointments',
              icon: Icon(Icons.calendar_month)),
          BottomNavigationBarItem(
              backgroundColor: Utility.primaryColor,
              label: 'Chat',
              icon: Icon(Icons.call_outlined)),
          BottomNavigationBarItem(
              backgroundColor: Utility.primaryColor,
              label: 'Notifications',
              icon: Icon(Icons.notifications_outlined)),
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

