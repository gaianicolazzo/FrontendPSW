import 'dart:convert';


Request requestFromJson(String str) => Request.fromJson(json.decode(str));

String requestToJson(Request data) => json.encode(data.toJson());

class Request {
    String email;
    String password;

    Request({
        required this.email,
        required this.password,
    });
    
      factory Request.fromJson(Map<String, dynamic> json) => Request(
        email: json["email"],
        password: json["password"]
      );
      
      Map<String, dynamic> toJson() => {
        "email" : email,
        "password" : password
    };
}
