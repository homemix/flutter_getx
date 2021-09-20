import 'package:get/get.dart';
import 'package:getx_cli_demo/app/modules/home/providers/user_provider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>>{
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    UserProvider().getUsers().then((resp) {
      change(resp,status: RxStatus.success());
    },onError: (err){
      change(null,status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
