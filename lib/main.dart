import 'package:flutter/material.dart';
import 'package:pharm/screens/appointments/appointments.dart';
import 'package:pharm/screens/appointments_details/appointments_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Appointments(),
        '/appointments-details': (context) => const AppointmentDetails(),
      },
    );
  }
}
