// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:one_health_hospital_app/repositories/api_utilities.dart';
import 'package:one_health_hospital_app/repositories/user_register/user_register_data.dart';

class UserRegisterServices {
  Future<Response> getUserRegisterResponse(
      {required UserRegisterInputModel inputs}) async {
    Dio dio = Dio();
    String fileName = inputs.image!.path.split('/').last;

    FormData formData = FormData.fromMap({
      "firstName": inputs.firstName,
      "secondName": inputs.secondName,
      "age": inputs.age,
      "gender": inputs.gender,
      "email": inputs.email,
      "phone": inputs.phone,
      "blood": inputs.blood,
      "password": inputs.password,
      "image":
          await MultipartFile.fromFile(inputs.image!.path, filename: fileName),
    });
    Response response = await dio.post(
        ApiUtilities.baseUrl + ApiUtilities.registerUserPath,
        data: formData);
    return response;
  }
  Future<bool> getUserRegisterResponses(
      {required UserRegisterInputModel inputs}) async {
    Dio dio = Dio();
    // String fileName = inputs.image!.path.split('/').last;
    bool register = false;

    FormData formData = FormData.fromMap({
      "firstName": inputs.firstName,
      "secondName": inputs.secondName,
      "age": inputs.age,
      "gender": inputs.gender,
      "email": inputs.email,
      "phone": inputs.phone,
      "blood": inputs.blood,
      "password": inputs.password,
      // "image":
      //     await MultipartFile.fromFile(inputs.image!.path, filename: fileName),
    });
    Response response = await dio.post(
        ApiUtilities.baseUrl + ApiUtilities.registerUserPath,
        data: formData);
        if (response.statusCode==200){
          register=true;
        }
    return register;
  }
}