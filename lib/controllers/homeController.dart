import 'dart:io';

import 'package:get/get.dart';
import 'package:poloniex_app/Modal/getTokenModal.dart';
import 'package:poloniex_app/networks/network_repo.dart';
import 'package:poloniex_app/utils/constant.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:socket_io_client/socket_io_client.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchToken();
  }

  Future<void> fetchToken() async {
    var jsonMap = await networkRepository.getToken(ApiConstant.getToken);
    var responseData = GetToken.fromJson(jsonMap);

    var socketUrl =
        "${responseData.data.instanceServers.first.endpoint}?token=${responseData.data.token}&acceptUserMessage=true";
    print(socketUrl);
    IO.Socket socket = IO.io(
      socketUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableForceNewConnection()
          .setTimeout(5000)
          .setReconnectionDelay(10000)
          .enableReconnection()
          .build(),
    );

    print('socket init connected: ${socket.connected}');
    try {
      if (socket.connected == false) {
        socket.connect();
        socket.onConnect((_) {
          print('Connection established');
        });
        socket.on('unauthorized', (dynamic data) {
          print('Unauthorized');
        });
        socket.onError(
          (dynamic error) => {
            print(error),
          },
        );
        socket.onDisconnect((dynamic data) {
          print('socket instance disconnected');
        });
      } else {
        print('socket instance already connected');
      }
    } catch (e) {
      print("socket error - ${e.toString()}");
    }
  }
}
