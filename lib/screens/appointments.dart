import 'package:flutter/material.dart';
import 'package:pharm/utility.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {

  List<String> status = [];
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.group_add_outlined),
        onPressed: () {

        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeSelectedItem,
        currentIndex: selectedItem,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
              icon:  Icon(Icons.home_outlined)),
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.calendar_month)),
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.call_outlined)),
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.notifications_outlined)),
        ],
      ),
    );
  }

  changeSelectedItem(int index) {
    setState(() {
      selectedItem = index;
    });
  }

}
