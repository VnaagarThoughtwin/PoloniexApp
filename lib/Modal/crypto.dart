// To parse this JSON data, do
//
//     final crypto = cryptoFromJson(jsonString);

import 'dart:convert';

Crypto cryptoFromJson(String str) => Crypto.fromJson(json.decode(str));

String cryptoToJson(Crypto data) => json.encode(data.toJson());

class Crypto {
    Data data;
    String subject;
    String topic;
    String type;

    Crypto({
        required this.data,
        required this.subject,
        required this.topic,
        required this.type,
    });

    factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
        data: Data.fromJson(json["data"]),
        subject: json["subject"],
        topic: json["topic"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "subject": subject,
        "topic": topic,
        "type": type,
    };
}

class Data {
    String symbol;
    int sequence;
    String side;
    int size;
    double price;
    int bestBidSize;
    String bestBidPrice;
    String bestAskPrice;
    String tradeId;
    double ts;
    int bestAskSize;

    Data({
        required this.symbol,
        required this.sequence,
        required this.side,
        required this.size,
        required this.price,
        required this.bestBidSize,
        required this.bestBidPrice,
        required this.bestAskPrice,
        required this.tradeId,
        required this.ts,
        required this.bestAskSize,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        symbol: json["symbol"],
        sequence: json["sequence"],
        side: json["side"],
        size: json["size"],
        price: json["price"]?.toDouble(),
        bestBidSize: json["bestBidSize"],
        bestBidPrice: json["bestBidPrice"],
        bestAskPrice: json["bestAskPrice"],
        tradeId: json["tradeId"],
        ts: json["ts"]?.toDouble(),
        bestAskSize: json["bestAskSize"],
    );

    Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "sequence": sequence,
        "side": side,
        "size": size,
        "price": price,
        "bestBidSize": bestBidSize,
        "bestBidPrice": bestBidPrice,
        "bestAskPrice": bestAskPrice,
        "tradeId": tradeId,
        "ts": ts,
        "bestAskSize": bestAskSize,
    };
}
