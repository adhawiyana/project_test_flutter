import 'package:get_storage/get_storage.dart';

const String USER = 'USER';
const String TOKEN = 'TOKEN';
const String ISLOGIN = "ISLOGIN";

class LocalService {
  final local = GetStorage();

  Future setUser({dynamic user}) async {
    user ??= "";
    await local.write(USER, user);
  }
  Future<dynamic> getUser() async {
    return local.read(USER);
  }

  Future setToken({String? token}) async {
    token ??= "";
    await local.write(TOKEN, token);
  }
  Future<String?> getToken() async {
    return local.read(TOKEN);
  }

  Future setIsLogin({bool? isLogin}) async {
    isLogin ??= false;
    await local.write(ISLOGIN, isLogin);
  }
  Future<bool?> getLoginStatus() async {
    return local.read(ISLOGIN);
  }

  Future removeStorageForLogout() async {
    await local.remove(USER);
    await local.remove(TOKEN);
    await local.remove(ISLOGIN);
  }

}