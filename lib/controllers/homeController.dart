import 'package:get/get.dart';
import 'package:poloniex_app/Modal/getTokenModal.dart';
import 'package:poloniex_app/networks/network_repo.dart';
import 'package:poloniex_app/utils/constant.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeController extends GetxController {
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
    channel.stream.listen(
      (data) {
      },
      onError: (error) => print(error),
    );
  }
}
