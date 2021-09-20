import 'package:get/get.dart';

import '../user_model.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://randomuser.me/api/?results=10';

  }

  Future<List<dynamic>> getUsers() async{
    final response = await get('https://randomuser.me/api/?results=100');
    if (response.status.hasError){
      return Future.error("error in fetching data");
    }else{
      return response.body['results'];
    }
  }

  Future<User?> getUser(int id) async {
    final response = await get('user/$id');
    return response.body;
  }

  Future<Response<User>> postUser(User user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');
}
