// To parse this JSON data, do
//
//     final getToken = getTokenFromJson(jsonString);

import 'dart:convert';

GetToken getTokenFromJson(String str) => GetToken.fromJson(json.decode(str));

String getTokenToJson(GetToken data) => json.encode(data.toJson());

class GetToken {
    String code;
    Data data;

    GetToken({
        required this.code,
        required this.data,
    });

    factory GetToken.fromJson(Map<String, dynamic> json) => GetToken(
        code: json["code"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
    };
}

class Data {
    List<InstanceServer> instanceServers;
    String token;

    Data({
        required this.instanceServers,
        required this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        instanceServers: List<InstanceServer>.from(json["instanceServers"].map((x) => InstanceServer.fromJson(x))),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "instanceServers": List<dynamic>.from(instanceServers.map((x) => x.toJson())),
        "token": token,
    };
}

class InstanceServer {
    int pingInterval;
    String endpoint;
    String protocol;
    bool encrypt;
    int pingTimeout;

    InstanceServer({
        required this.pingInterval,
        required this.endpoint,
        required this.protocol,
        required this.encrypt,
        required this.pingTimeout,
    });

    factory InstanceServer.fromJson(Map<String, dynamic> json) => InstanceServer(
        pingInterval: json["pingInterval"],
        endpoint: json["endpoint"],
        protocol: json["protocol"],
        encrypt: json["encrypt"],
        pingTimeout: json["pingTimeout"],
    );

    Map<String, dynamic> toJson() => {
        "pingInterval": pingInterval,
        "endpoint": endpoint,
        "protocol": protocol,
        "encrypt": encrypt,
        "pingTimeout": pingTimeout,
    };
}
