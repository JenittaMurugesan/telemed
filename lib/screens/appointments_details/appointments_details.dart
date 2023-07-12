import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharm/screens/appointments_details/view/appointments_details_body.dart';
import 'package:pharm/utility.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({Key? key}) : super(key: key);

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  SampleItem? selectedMenu;
  TextEditingController ScheduleDate = TextEditingController();
  TextEditingController ScheduleTime = TextEditingController();
  TextEditingController reScheduleDate = TextEditingController();
  TextEditingController reScheduleTime = TextEditingController();
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Appointment details", style: Utility.primaryText20),
        actions: [
          PopupMenuButton<SampleItem>(
            initialValue: selectedMenu,
            // Callback that sets the selected popup menu item.
            onSelected: (SampleItem item) {
              setState(() {
                selectedMenu = item;
              });

              switch (selectedMenu) {
                case SampleItem.scheduleFollowup:
                  showScheduleModal(context);
                  break;
                case SampleItem.rescheduleAppointment:
                  showReScheduleModal(context);
                  break;
                case SampleItem.cancelAppointment:
                  break;
                case SampleItem.viewPatientDetails:
                  break;
                case SampleItem.notifyPatient:
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              const PopupMenuItem<SampleItem>(
                value: SampleItem.scheduleFollowup,
                child: Text('Schedule Follow-up '),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.rescheduleAppointment,
                child: Text('Reschedule Appointment'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.cancelAppointment,
                child: Text('Cancel Appointment'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.viewPatientDetails,
                child: Text('View Patient details'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.notifyPatient,
                child: Text('Notify Patient'),
              ),
            ],
          ),
        ],
      ),
      body: const AppointmentsDetailsBody(),
    );
  }

  showScheduleModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        String formattedDate =
        DateFormat('yyyy-MM-dd').format(DateTime.now());final localizations = MaterialLocalizations.of(context);
        final formattedTimeOfDay =
        localizations.formatTimeOfDay(TimeOfDay.now());
        if(ScheduleDate.text.isEmpty) {
          ScheduleDate.text = formattedDate;
        }
        if(ScheduleTime.text.isEmpty) {
          ScheduleTime.text = formattedTimeOfDay;
        }
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Schedule Follow-up', style: Utility.primaryText18),
                SizedBox(
                    width: Utility.getWidth(context) / 6,
                    child: Divider(thickness: 2, color: Utility.primaryColor)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Follow-up date', style: Utility.primaryText18),
                    Utility.customTextForm('', 'Select', null, ScheduleDate,
                        readOnly: true, width: Utility.getWidth(context) / 2.5,
                        onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          ScheduleDate.text = formattedDate;
                        });
                      } else {}
                    }, icon: const Icon(Icons.expand_circle_down)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          ScheduleDate.text = '';
                          ScheduleTime.text = '';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Utility.secondaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text('none', style: Utility.primaryText18),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Utility.secondaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text('After 3 days', style: Utility.primaryText18),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Utility.secondaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text('After 7 days', style: Utility.primaryText18),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Time', style: Utility.primaryText18),
                    const SizedBox(width: 16),
                    Utility.customTextForm('', 'Select', null, ScheduleTime,
                        readOnly: true, width: Utility.getWidth(context) / 2.5,
                        onTap: () async {
                      var pickedDate = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());

                      if (pickedDate != null) {
                        final localizations = MaterialLocalizations.of(context);
                        final formattedTimeOfDay =
                            localizations.formatTimeOfDay(pickedDate);
                        setState(() {
                          ScheduleTime.text = formattedTimeOfDay.toString();
                        });
                      } else {}
                    }, icon: const Icon(Icons.expand_circle_down)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        value: false,
                        onChanged: (d) {
                          setState(() {
                            isChecked = true;
                          });
                        }),
                    Text('Notify patient on Whatsapp',
                        style: Utility.primaryText12),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                      'This will automatically send a remainder to patient’s \nWhatsapp 20hrs ago to visit again.',
                      style: Utility.miniGreyText),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Utility.fullSizedButton(context, () {
                      Navigator.pop(context);
                    }, 'Done', Utility.primaryColor,
                        width: Utility.getWidth(context) / 2 - 32),
                    SizedBox(
                      width: Utility.getWidth(context) / 2 - 32,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          //<-- SEE HERE
                          side: const BorderSide(width: 1.0),
                        ),
                        onPressed: () {
                          setState(() {
                            ScheduleDate.text = '';
                            ScheduleTime.text = '';
                          });
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Exit', style: Utility.primaryText16),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  showReScheduleModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        String formattedDate =
        DateFormat('yyyy-MM-dd').format(DateTime.now());final localizations = MaterialLocalizations.of(context);
        final formattedTimeOfDay =
        localizations.formatTimeOfDay(TimeOfDay.now());
        if(reScheduleDate.text.isEmpty) {
          reScheduleDate.text = formattedDate;
        }
        if(reScheduleTime.text.isEmpty) {
          reScheduleTime.text = formattedTimeOfDay;
        }
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Reschedule', style: Utility.primaryText18),
                SizedBox(
                    width: Utility.getWidth(context) / 6,
                    child: Divider(thickness: 2, color: Utility.primaryColor)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Follow-up date', style: Utility.primaryText18),
                    Utility.customTextForm('', 'Select', null, reScheduleDate,
                        readOnly: true, width: Utility.getWidth(context) / 2.5,
                        onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          reScheduleDate.text = formattedDate;
                        });
                      } else {}
                    }, icon: const Icon(Icons.expand_circle_down)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Time', style: Utility.primaryText18),
                    const SizedBox(width: 16),
                    Utility.customTextForm('', 'Select', null, reScheduleTime,
                        readOnly: true, width: Utility.getWidth(context) / 2.5,
                        onTap: () async {
                      var pickedDate = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());

                      if (pickedDate != null) {
                        final localizations = MaterialLocalizations.of(context);
                        final formattedTimeOfDay =
                            localizations.formatTimeOfDay(pickedDate);
                        setState(() {
                          reScheduleTime.text = formattedTimeOfDay.toString();
                        });
                      } else {}
                    }, icon: const Icon(Icons.expand_circle_down)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        value: false,
                        onChanged: (d) {
                          setState(() {
                            isChecked = true;
                          });
                        }),
                    Text('Notify patient on Whatsapp',
                        style: Utility.primaryText12),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                      'This will automatically send a remainder to patient’s \nWhatsapp 20hrs ago to visit again.',
                      style: Utility.miniGreyText),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Utility.fullSizedButton(context, () {
                      Navigator.pop(context);
                    }, 'Done', Utility.primaryColor,
                        width: Utility.getWidth(context) / 2 - 32),
                    SizedBox(
                      width: Utility.getWidth(context) / 2 - 32,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          //<-- SEE HERE
                          side: const BorderSide(width: 1.0),
                        ),
                        onPressed: () {
                          setState(() {
                            reScheduleDate.text = '';
                            reScheduleTime.text = '';
                          });
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Exit', style: Utility.primaryText16),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// This is the type used by the popup menu below.
enum SampleItem {
  scheduleFollowup,
  rescheduleAppointment,
  cancelAppointment,
  viewPatientDetails,
  notifyPatient
}
