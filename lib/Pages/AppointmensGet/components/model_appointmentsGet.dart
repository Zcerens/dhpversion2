class Appointment {
  String doctor_name_;
  String date_start_;
  String date_end_;
  String country_;
  String city_;
  String ilce_;

  Appointment(
      {required this.doctor_name_,
      required this.date_start_,
      required this.date_end_,
      required this.country_,
      required this.city_,
      required this.ilce_});

  static List<Appointment> getAppointments() {
    return <Appointment>[
      Appointment(
          doctor_name_: "Ozlem",
          date_start_: "2022-12-13",
          date_end_: "2022-12-14",
          country_: "Turkey",
          city_: "Kutahya Province",
          ilce_: " "),
      Appointment(
          doctor_name_: "Ceren",
          date_start_: "2022-12-13",
          date_end_: "2022-12-14",
          country_: "Turkey",
          city_: "Kutahya Province",
          ilce_: " ")
    ];
  }
}
