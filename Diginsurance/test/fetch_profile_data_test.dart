import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:one_health_hospital_app/repositories/user_get_profile/user_get_profile_services.dart';
import 'package:one_health_hospital_app/repositories/user_register/user_register_data.dart';

import 'fixtures/fixture_reader.dart';
import 'user_register_test.mocks.dart';

@GenerateMocks([GetUserProfileServices])
void main() {
  MockUserRegisterServices mockUserRegisterServices =
      MockUserRegisterServices();

  test("Fetching user data", (() async {
    var userDataJson = jsonDecode(fixture('user_register_model.json'));
    var userData = UserRegisterInputModel.fromJson(userDataJson);
    when(mockUserRegisterServices.getUserRegisterResponse())
        .thenAnswer((_) async {
      Response response = Response(
          requestOptions: RequestOptions(path: '/'), data: userDataJson);
      return response;
    });
    final response = await mockUserRegisterServices.getUserRegisterResponse();
    var userDataConverted = UserRegisterInputModel.fromJson(response.data);
    expect(userData, userDataConverted);
  }));
}
