// TODO Implement this library.
class Alarm {
  //String id;
  //String user_id;
  String code;
  //String status;
  String phone;
  String mode = "car";
  //String configuration;
  //String updatedAt;
  Alarm({
    //required this.id,
    //required this.user_id,
    required this.code,
    //required this.status,
    required this.phone,
    required this.mode,
    //required this.configuration
    //required this.updatedAt
  });

  factory Alarm.fromJson(Map json) {
    return Alarm(
      //id: json["_id"],
      //user_id: json["user_id"],
      code: json["code"],
      //status: json["status"],
      phone: json["phone"],
      mode: json["mode"],
      //configuration: json["configuration"],
      //updatedAt: json["updated_at"]
    );
  }
}
