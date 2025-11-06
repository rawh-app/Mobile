import 'package:dio/dio.dart';

class Loginservices{
  Dio dio=Dio();
  Future<Response>signUp({required String email,required password})async{
    Response response=await dio.post('https://rawh.runasp.net/api/Auth/Login',
                                    //https://rawh.runasp.net/api/Auth/Login
        data: {
          'email':email,
          'password':password,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
          validateStatus: (_) => true,
        ),
    );
    print(response.data);
    return response;
  }
}
//"email": "user@example.com",
//"password": "string"