import 'dart:convert';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());

class Response {

    String accessToken;
    String refreshToken;

    Response({
        required this.accessToken,
        required this.refreshToken,
    });
    
     factory Response.fromJson(Map<String, dynamic> json) => Response(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"]
      );
      
        Map<String, dynamic> toJson() => {
        "access_token" : accessToken,
        "refresh_token" : refreshToken
    };

}
