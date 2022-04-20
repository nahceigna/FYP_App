import 'package:flutter/material.dart';
import 'package:fyp_app/components/day_choice_chip.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({Key? key}) : super(key: key);

  @override
  _TestingPageState createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  int displayDay = 0;
  int daySelectedIndex = 0;

  /// function for day choice chip widgets
  Widget dayChoiceChipList() {
    return Wrap(
      children: dayChipList(),
    );
  }

  List<Widget> dayChipList() {
    List<Widget> chips = [];
    for (int i = 0; i < chipList.length; ++i) {
      Widget item = Container(
          width: 40,
          height: 30,
          child: ChoiceChip(
            label: Text(
              chipList[i].label,
              style: const TextStyle(color: Colors.white),
            ),
            shape: const CircleBorder(), // circular chip
            selected: daySelectedIndex == i,
            onSelected: (bool value) {
              setState(() {
                if (value) {
                  displayDay = chipList[i].id;
                }
                daySelectedIndex = i;
              });
            },
            backgroundColor: const Color(0xFF6C757D),
            selectedColor: const Color(0xFF1565C0),
            // visualDensity:
            //     const VisualDensity(horizontal: -2), // density between chips
          ));
      chips.add(item);
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dayChoiceChipList(),
    );
  }
}
