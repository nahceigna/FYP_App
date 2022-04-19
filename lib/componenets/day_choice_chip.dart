/// Class ChipDay
class ChipDay {
  /// variables
  int id;
  String label;
  String title; // title is used for avoiding conflict in selected chip
  bool isSelected = false;

  /// constructor
  ChipDay(
      {required this.id,
      required this.label,
      required this.title,
      this.isSelected = false});

  /// copy function for updating
  ChipDay copy({int? id, String? label, String? title, bool? isSelected}) =>
      ChipDay(
        id: id ?? this.id,
        label: label ?? this.label,
        title: title ?? this.title,
        isSelected: isSelected ?? this.isSelected,
      );
}

/// Create list of chip data
List<ChipDay> chipList = [
  ChipDay(id: 0, label: 'M', title: 'Monday'),
  ChipDay(id: 1, label: 'T', title: 'Tuesday'),
  ChipDay(id: 2, label: 'W', title: 'Wednesday'),
  ChipDay(id: 3, label: 'T', title: 'Thursday'),
  ChipDay(id: 4, label: 'F', title: 'Friday'),
  ChipDay(id: 5, label: 'S', title: 'Saturday'),
  ChipDay(id: 6, label: 'S', title: 'Sunday'),
];
