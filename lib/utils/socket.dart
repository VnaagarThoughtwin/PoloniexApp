// import 'dart:async';

// import 'package:poloniex_app/utils/constant.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client/socket_io_client.dart';


// class SocketApi {



//   factory SocketApi() {
//     return _socketApi;
//   }

//   SocketApi._internal();

//   static void init() {
//     print('socket init connected: ${socket.connected}');
//     try {
//       if (socket.connected == false) {
//         socket.connect();
//         socket.onConnect((_) {
//           print('Connection established');
//         });
//         socket.on('unauthorized', (dynamic data) {
//           print('Unauthorized');
//         });
//         socket.onError(
//           (dynamic error) => {
//             print(error),
//           },
//         );
//         socket.onDisconnect((dynamic data) {
//           print('socket instance disconnected');
//         });
//       } else {
//         print('socket instance already connected');
//       }
//     } catch (e) {
//       //socket error - ${e.toString()}");
//     }
//   }

//   // A static private instance to access _socketApi from inside class only
  
// }
