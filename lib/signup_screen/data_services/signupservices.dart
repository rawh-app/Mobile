import 'package:dio/dio.dart';

class SignUpServices{
  Dio dio=Dio();
  Future<Response>signUp({required String email,required username,required password})async{
    Response response=await dio.post('',
        data: {
          'email':email,
          'userName':username,
          'password':password,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
          validateStatus: (_) => true,
        )
    );
    print(response.data);
    return response;
  }
}