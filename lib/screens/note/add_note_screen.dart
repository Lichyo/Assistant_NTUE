import 'package:assistant/constant.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:assistant/models/curriculum/class_data.dart';
import 'package:assistant/components/rounded_button.dart';
import 'package:assistant/models/note/note_data.dart';
import 'package:provider/provider.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);
  @override
  State<AddNote> createState() => _AddNoteState();
}

ClassData classData = ClassData();

class _AddNoteState extends State<AddNote> {
  List<String> items = classData.getClassName();
  String? selectedValue;
  late String title;
  late String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
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
          Padding(
            padding: const EdgeInsets.only(
                top: 50.0, left: 30.0, right: 30.0, bottom: 10.0),
            child: TextField(
              onChanged: (value) {
                title = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(labelText: 'Enter your title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: TextField(
              onChanged: (value) {
                description = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  labelText: 'Enter your Description'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Row(
                  children: const [
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
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 300,
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
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: ElevatedButton(
              style: ButtonStyle(),
              onPressed: () async {
                var result = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2003),
                  lastDate: DateTime(2030),
                );

                if (result != null) {
                  setState(() {
                    var deadTime = result;
                  });
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  'Enter the deadTime',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: RoundedButton(
              title: 'Submit',
              color: Colors.lightBlue,
              onPressed: () {
                Provider.of<NoteData>(context, listen: false).addNote(
                  title: title,
                  description: description,
                  deadTime: DateTime.now(),
                  subject: selectedValue.toString(),
                );
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
