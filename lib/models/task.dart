class Task {
  String description;
  bool checked;
  DateTime checkTime;

  Task(this.description, this.checked, this.checkTime);

  Task.fromMap(Map<String, dynamic> map) {
    this.description = map["description"];
    this.checked = map["checked"];
    this.checkTime = DateTime.tryParse(map["time"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "description": description,
      "checked": checked,
      "time": checkTime.toString()
    };
  }

  @override
  String toString() {
    return "$description | $checked | $checkTime";
  }
}