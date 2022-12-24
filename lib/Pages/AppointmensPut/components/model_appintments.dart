class Appointment {
  int? max_number_of_admissions;
  String day;
  String time_start;
  String time_end;
  Appointment(
      {required this.max_number_of_admissions,
      required this.day,
      required this.time_end,
      required this.time_start});

  static List<Appointment> getAppointments() {
    return <Appointment>[
      Appointment(
          max_number_of_admissions: 100,
          day: "11",
          time_end: "12",
          time_start: "13")
    ];
  }
}
