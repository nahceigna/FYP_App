/// Class Situation
class Situation {
  /// Set the variables
  late int iconColour; //colour in hex code
  late String message;

  //. Constructor
  Situation({
    required this.iconColour,
    required this.message,
  });
}

/// Different status for occupancy percentage
List<Situation> states = [
  Situation(iconColour: 0xFFF94144, message: 'As busy as it gets'),
  Situation(iconColour: 0xFFF9844A, message: 'A little busy'),
  Situation(iconColour: 0xFFF9C74F, message: 'Not too busy'),
  Situation(iconColour: 0xFF90BE6D, message: 'Not busy'),
];
