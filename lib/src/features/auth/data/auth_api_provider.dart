import 'dart:convert';

import 'package:flutter_banking/src/core/constants/endpoints_keys.dart';
import 'package:flutter_banking/src/core/errors/exceptions/auth_response_error_exception.dart';
import 'package:flutter_banking/src/core/errors/exceptions/no_internet_connection_exception.dart';
import 'package:flutter_banking/src/features/auth/models/register_model.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AuthApiProvider {
  Future<Map<String, dynamic>> loginWithPhoneNumber(
      {required String phoneNumber, required String password}) async {
    try {
      final body = {
        'phoneNumber': phoneNumber,
        'password': password,
      };
      return await _auth(body, EndpointsKeys.loginEndpoint);
    } catch (_) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> loginWithIpn(
      {required String ipn, required String password}) async {
    try {
      final body = {
        'ipn': ipn,
        'password': password,
      };
      return await _auth(body, EndpointsKeys.loginEndpoint);
    } catch (_) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> register(RegisterModel registerModel) async {
    try {
      final body = {
        "firstName": registerModel.firstName,
        "lastName": registerModel.lastName,
        "phoneNumber": registerModel.phoneNumber,
        "ipn": registerModel.ipn,
        "passportNumber": registerModel.passportNumber,
        "password": registerModel.password,
      };
      return await _auth(body, EndpointsKeys.registerEndpoint);
    } catch (_) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _auth(
      Map<String, dynamic> body, String endpoint) async {
    final hasConnection = await InternetConnectionChecker().hasConnection;

    if (!hasConnection) {
      throw NoInternetConnectionException('No internet connection');
    }

    final header = {
      'Content-type': 'application/json',
    };

    try {
      final response = await http.post(
        Uri.parse(EndpointsKeys.baseUrl + endpoint),
        body: json.encode(body),
        headers: header,
      );

      final responseBody = json.decode(response.body);
      if (responseBody['error'] != null) {
        throw AuthErrorException(responseBody['error']);
      }

      if (responseBody['refresh_token'] != null &&
          responseBody['access_token'] != null &&
          responseBody['access_expire_date'] != null &&
          responseBody['refresh_expire_date'] != null) {
        return responseBody;
      }

      throw AuthErrorException('Failed to login. Try again');
    } catch (_) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    try {
      return await _auth(
          {'refreshToken': refreshToken}, EndpointsKeys.refreshTokenEndpoint);
    } catch (_) {
      rethrow;
    }
  }
}
