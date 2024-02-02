import 'dart:convert';

import 'package:get/get.dart';
import 'package:poloniex_app/Modal/crypto.dart';
import 'package:poloniex_app/Modal/getTokenModal.dart';
import 'package:poloniex_app/networks/network_repo.dart';
import 'package:poloniex_app/utils/constant.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeController extends GetxController {
  RxList<Crypto> cryspoData = <Crypto>[].obs;
  var status = false;

  @override
  void onInit() {
    super.onInit();
    fetchToken();
  }

  Future<void> fetchToken() async {
    var jsonMap = await networkRepository.getToken(ApiConstant.getToken);
    var responseData = GetToken.fromJson(jsonMap);
    print(responseData.data.token);

    var webSocket =
        "${responseData.data.instanceServers.first.endpoint}?token=${responseData.data.token}&acceptUserMessage=true";

    final channel = WebSocketChannel.connect(
      Uri.parse(webSocket),
    );

    channel.sink.add(
      jsonEncode({
        "id": 1545910660740,
        "type": "subscribe",
        "topic": "/contractMarket/ticker:BTCUSDTPERP",
        "response": true
      }),
    );

    channel.stream.listen(
      (data) {
        var decodeDedData = jsonDecode(data);
print(decodeDedData);
        if (status) {
          cryspoData.add(cryptoFromJson(data));
        }
      },
      onError: (error) => print(error),
    );
  }
}
