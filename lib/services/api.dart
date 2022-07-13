import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sample/model/email_response.dart';

Future<EmailResponse?> getEmail() async {
  try {
    Response response = await Dio().get('https://reqres.in/api/users/1');
    debugPrint(response.toString());
    return EmailResponse.fromJson(response.data);
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}

Future<EmailResponse?> getEmail1() async {
  try {
    Response response = await Dio().get('https://reqres.in/api/users/3');
    debugPrint(response.toString());
    return EmailResponse.fromJson(response.data);
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}

Future<EmailResponse?> getEmail2() async {
  try {
    Response response = await Dio().get('https://reqres.in/api/users/10');
    debugPrint(response.toString());
    return EmailResponse.fromJson(response.data);
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}
