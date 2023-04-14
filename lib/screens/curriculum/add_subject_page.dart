import 'package:flutter/material.dart';
import 'package:assistant/constant.dart';
import 'package:assistant/components/rounded_button.dart';

class AddSubjectPage extends StatefulWidget {
  const AddSubjectPage({Key? key}) : super(key: key);

  @override
  State<AddSubjectPage> createState() => _AddSubjectPageState();
}

class _AddSubjectPageState extends State<AddSubjectPage> {
  late String subject;
  late String? teacher;
  late String? location;
  late Week week;
  List<Week> weeks = [Week.mon, Week.tues, Week.wed, Week.thur, Week.fri];
  TimeOfDay initTime = const TimeOfDay(hour: 10, minute: 00);
  TimeOfDay? startTime = const TimeOfDay(hour: 10, minute: 00);
  int duration = 3;
  List<DropdownMenuItem<String>> dropdownMenuItem = [];

  @override
  Widget build(BuildContext context) {
    String dropdownMenu = weeks.first.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Subject'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.grey.shade500,
                        size: 40.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        'Subject Info',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        subject = value;
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Enter the subject'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        teacher = value;
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Enter the teacher'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        location = value;
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Enter the location'),
                  ),
                ),
                const Divider(
                  height: 30.0,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                DropdownButton<String>(
                  value: dropdownMenu,
                  items: dropdownMenuItem,
                  onChanged: (value) {},
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.access_alarm,
                      size: 30.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Time',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextButton(
                  onPressed: () async {
                    var tempTime = await showTimePicker(
                      context: context,
                      initialTime: initTime,
                    );
                    setState(() {
                      startTime = tempTime;
                    });
                  },
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      'Start from : ${startTime?.hour}點 ${startTime?.minute}分',
                      style: const TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Duration : $duration Hours',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Slider(
                  value: duration.toDouble(),
                  // activeColor: kBottomContainerColor,
                  // inactiveColor: kGreyTextColor,
                  min: 2,
                  max: 6,
                  onChanged: (double newValue) {
                    setState(() {
                      duration = newValue.toInt();
                    });
                  },
                ),
                const Divider(
                  height: 30.0,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: RoundedButton(
              title: 'Add Subject',
              onPressed: () {},
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
