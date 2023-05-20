import 'package:assistant/constant.dart';
import 'package:assistant/models/curriculum/curriculum.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:assistant/models/curriculum/class_data.dart';
import 'package:assistant/components/rounded_button.dart';
import 'package:assistant/db/curriculum_database.dart';
import 'package:assistant/db/NoteDB.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:assistant/models/note/note.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);
  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String? selectedSubject;
  List<String> items = [];
  String title = '';
  String description = '';
  CalendarFormat _calendarFormat = CalendarFormat.month;
  var _selectedDay;

  _AddNoteState() {
    items.add('其他');
  }
  @override
  void initState(){
    super.initState();
    items = getSubjectName();
  }
  Future initClassData() async {
    ClassData.curriculums = await ClassDatabase.instance.readAllLesson();
    ClassDatabase.instance.close();
  }

  List<String> getSubjectName() {
    initClassData();
    List<Curriculum> lessons = ClassData.curriculums;
    List<String> lessonSubjects = [];
    for(int i = 0; i < lessons.length; i++) {
      if(lessons[i].week == 'Mon') {
        lessonSubjects.add(lessons[i].subject);
      } else if(lessons[i].week == 'Tues') {
        lessonSubjects.add(lessons[i].subject);
      } else if(lessons[i].week == 'Wed') {
        lessonSubjects.add(lessons[i].subject);
      } else if(lessons[i].week == 'Thur') {
        lessonSubjects.add(lessons[i].subject);
      } else if(lessons[i].week == 'Fri') {
        lessonSubjects.add(lessons[i].subject);
      }
    }
    return lessonSubjects;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Add Note',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 30.0, right: 30.0, bottom: 10.0),
                  child: TextField(
                    onChanged: (value) {
                      title = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Enter your title'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 30.0, right: 30.0, bottom: 10.0),
                  child: TextField(
                    onChanged: (value) {
                      description = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Enter your Description'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 5.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'Select Subject',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedSubject,
                      onChanged: (value) {
                        setState(() {
                          selectedSubject = value as String;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: Colors.grey,
                        ),
                        elevation: 2,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 200,
                        padding: null,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.grey,
                        ),
                        elevation: 8,
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0),
                  child: TableCalendar(
                    firstDay: DateTime(2020),
                    focusedDay: DateTime.now(),
                    lastDay: DateTime(2030),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                      });
                    },
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: RoundedButton(
              title: 'Submit',
              color: Colors.blue,
              onPressed: () async {
                final db = NoteDB.instance;
                db.create(Note(
                  title: title,
                  description: description,
                  deadTime: _selectedDay,
                  subject: selectedSubject.toString(),
                ));
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
