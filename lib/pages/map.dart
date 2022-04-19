/// import libraries
import 'package:flutter/material.dart';

class Mappage extends StatefulWidget {
  const Mappage({Key? key}) : super(key: key);

  @override
  _MappageState createState() => _MappageState();
}

class _MappageState extends State<Mappage> {
  /// variables
  /// list of boolean, set the default value
  List<bool> isSelected = [false, false, true, false, false];
  List<String> imageNameList = [
    'images/map_1f.jpg',
    'images/map_gf.jpg',
    'images/map_lg1.jpg',
    'images/map_lg3.jpg',
    'images/map_lg4.jpg',
  ];
  int selectedImageIndex = 2;
  static const List<Widget> toggleButtonList = [
    Text('1/F', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
    Text('G/F', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
    Text('LG1', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
    Text('LG3', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
    Text('LG4', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9ECEF), // background colour
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        title: const Text('Floor Plan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            )),
      ),

      /// Main body
      body: SafeArea(
        child: Column(children: [
          const SizedBox(height: 25),
          Container(
            height: 30,
            color: const Color(0xFFADB5BD),
            child: LayoutBuilder(
              builder: (context, constraints) => ToggleButtons(
                isSelected: isSelected,
                fillColor: const Color(0xFF1565C0),
                selectedColor: Colors.white,
                color: Colors.white,
                renderBorder: false,
                constraints:
                    BoxConstraints.expand(width: constraints.maxWidth / 5),
                children: toggleButtonList,
                onPressed: (int newIndex) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; ++i) {
                      if (i == newIndex) {
                        isSelected[i] = true;
                      } else {
                        isSelected[i] = false;
                      }
                    }
                    selectedImageIndex = newIndex;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// show map image
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Image(
                  image: AssetImage(imageNameList[selectedImageIndex]),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
