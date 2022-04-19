/// import libraries
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fyp_app/componenets/datetime.dart';
import 'package:fyp_app/componenets/display_no_of_ppl.dart';
import 'package:fyp_app/services/occupancy_data.dart';
import 'package:fyp_app/services/world_time.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fyp_app/componenets/piechart.dart';
import 'package:fyp_app/componenets/barchart.dart';
import 'package:fyp_app/componenets/location_dropdown_menu.dart';
import 'package:fyp_app/componenets/day_choice_chip.dart';
import 'package:fyp_app/componenets/situation.dart';
import 'package:fyp_app/componenets/situation_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  /// variables
  Map data = {
    'time': 'time',
    'date': 'date',
    'hour': 'hour',
    'day': 'Monday',
    'updateTime': 'Not yet update',
    'occupied': 0,
    'available': 3217,
  };
  late TooltipBehavior _tooltipBehavior;
  bool isSelected = false;
  String selectedDay = 'Monday';
  late String displayLocaton;
  int displayDay = 0;
  int daySelectedIndex = 0;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  void setupOccupancyData() async {
    /// get data online
    OccupancyDataJSON instance = OccupancyDataJSON();
    await instance.getOccupancy();
    data['occupied'] = instance.occupied;
    data['available'] = instance.available;
  }

  void setupWorldTime() async {
    /// Get data online
    /// Get online clock
    WorldTime instance = WorldTime();
    await instance.getTime();
    data['time'] = instance.time;
    data['date'] = instance.date;
    data['hour'] = instance.hour;
    data['day'] = instance.day;
    data['updateTime'] = instance.updateTime;
  }

  Future<void> refreshPageJSON() async {
    debugPrint('Refreshing Page');
    OccupancyDataJSON occupancyInstance = OccupancyDataJSON();
    await occupancyInstance.getOccupancy();
    WorldTime timeInstance = WorldTime();
    await timeInstance.getTime();

    return setState(() => {
          data['occupied'] = occupancyInstance.occupied,
          data['available'] = occupancyInstance.available,
          data['time'] = timeInstance.time,
          data['date'] = timeInstance.date,
          data['hour'] = timeInstance.hour,
          data['day'] = timeInstance.hour,
          data['updateTime'] = timeInstance.updateTime,
        });
  }

  /// Change the status according to occupancy
  Widget situationTemplate(int occupancyPercentage, String hour) {
    /// 0 - 24%: Display Not busy
    if (occupancyPercentage <= 24) {
      return SituationCard(state: states[3], time: hour);
    }

    /// 25-49%: Display Not too busy
    else if (occupancyPercentage <= 49) {
      return SituationCard(state: states[2], time: hour);
    }

    /// 50-74%: Display A little busy
    else if (occupancyPercentage <= 74) {
      return SituationCard(state: states[1], time: hour);
    }

    /// 75-100%: Display As busy as it gets
    else {
      return SituationCard(state: states[0], time: hour);
    }
  }

  /// function for day choice chip widgets
  Widget dayChoiceChipList() {
    return Wrap(
      children: dayChipList(),
    );
  }

  List<Widget> dayChipList() {
    List<Widget> chips = [];
    for (int i = 0; i < chipList.length; ++i) {
      Widget item = SizedBox(
        width: 40.0,
        height: 40.0,
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
          visualDensity:
              const VisualDensity(horizontal: -2), // density between chips
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  Widget locationDropdownMenu() {
    return Container(
      width: 155.0,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // circular boundaries
        color: Colors.white, // background colour
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            iconSize: 35,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Color(0xFF343A40),
            ),
            hint: const Text(
                'Select location'), // things to show when nothing is chosen
            items: locations.map(buildLocationMenuItem).toList(),
            value: selectedLocation,
            onChanged: (location) => setState(() => {
                  displayLocaton = location.toString(),
                  selectedLocation = location.toString()
                }),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    /// Set the variables from data here
    if (ModalRoute.of(context)!.settings.arguments != null) {
      data = ModalRoute.of(context)!.settings.arguments as Map;
    }
    return Scaffold(
      /// App bar
      appBar: AppBar(
        centerTitle: false,
        // Delete the return button
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Finder',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              letterSpacing: 0.7,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF1565C0),
        actions: [
          IconButton(
              tooltip: 'Refresh',
              onPressed: () => {
                    refreshIndicatorKey.currentState!.show(),
                    refreshPageJSON(),
                  },
              icon: const Icon(Icons.refresh_rounded)),
        ],
      ),

      /// Set background colour
      backgroundColor: const Color(0xFFE9ECEF),

      /// Main body
      body: RefreshIndicator(
        key: refreshIndicatorKey,
        onRefresh: refreshPageJSON,
        color: const Color(0xFF1565C0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  StreamBuilder(
                    stream: Stream.periodic(const Duration(minutes: 3))
                        .asyncMap((i) => setupOccupancyData()),
                    builder: (context, snapshot) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        /// Pie chart for occupancy
                        pieChart(data, _tooltipBehavior),

                        /// Display overall occupancy
                        numberOfPeople(data['occupied']),
                      ],
                    ),
                  ),

                  /// sapce between overall people and day chip list
                  const SizedBox(height: 5.0),
                  // timeText(data['time']),

                  /// Choose day
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      /// Text: 'Day:'
                      const Text(
                        'Day:',
                        style: TextStyle(
                          color: Color(0xFF343A40),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      /// space between text day and the chip list
                      const SizedBox(width: 5.0),

                      /// Insert choice chip for day
                      dayChoiceChipList(),
                    ],
                  ),

                  /// space between day chip list and location dropdown
                  const SizedBox(height: 10.0),

                  /// Choose location
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      /// Text: 'Select Location:'
                      const Text(
                        'Location: ',
                        style: TextStyle(
                          color: Color(0xFF343A40),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      /// space between text and dropdown menu
                      const SizedBox(width: 5.0),

                      /// Dropdown menu for select location
                      locationDropdownMenu(),
                    ],
                  ),

                  /// space between location and the graph
                  const SizedBox(height: 15.0),

                  /// Insert bar chart
                  barChart(selectedLocation.toString(), displayDay),

                  /// space between the graph and status
                  const SizedBox(height: 10.0),

                  /// Insert status
                  StreamBuilder(
                    stream: Stream.periodic(const Duration(minutes: 10))
                        .asyncMap((i) => setupWorldTime()),
                    builder: (context, snapshot) => situationTemplate(
                        (data['occupied'] / 3217 * 100).toInt(), data['hour']),
                  ),

                  /// space between the status card and late updated time
                  const SizedBox(height: 5.0),

                  StreamBuilder(
                    stream: Stream.periodic(const Duration(minutes: 3))
                        .asyncMap((i) => setupOccupancyData()),
                    builder: (context, snapshot) =>
                        lastUpdated(data['updateTime']),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
