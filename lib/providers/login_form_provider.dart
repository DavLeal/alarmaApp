import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = "";
  String password = "";

  bool isValidForm() {
    print(formKey.currentState?.validate());
    print("$email - ·$password");

    return formKey.currentState?.validate() ?? false;
  }
}

class Usuario {
  //int id;
  String name;
  String last_name;
  //String role;
  String email;
  String password;
  //String createdAt;
  //String updatedAt;
  Usuario({
    //required this.id,
    required this.name,
    required this.last_name,
    //required this.role,
    required this.email,
    required this.password,
    //required this.createdAt,
    //required this.updatedAt
  });

  factory Usuario.fromJson(Map<String, dynamic> parsedJson) {
    return Usuario(
      //id: json["_id"],
      name: parsedJson["name"],
      last_name: parsedJson["last_name"],
      //role: json["role"],
      email: parsedJson["email"],
      password: parsedJson["password"],
      //createdAt: json["created_at"],
      //updatedAt: json["updated_at"]
    );
  }
}
