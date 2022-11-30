import 'dart:convert';

import 'package:flutter_banking/src/core/constants/endpoints_keys.dart';
import 'package:flutter_banking/src/core/data/session_data_provider.dart';
import 'package:flutter_banking/src/core/errors/exceptions/auth_response_error_exception.dart';
import 'package:flutter_banking/src/core/errors/exceptions/card_api_exception.dart';
import 'package:flutter_banking/src/core/errors/exceptions/no_internet_connection_exception.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CardApiProvider {
  Future<Map<String, String>> get _header async {
    final accessToken = await SessionDataProvider().getAccessToken;
    if (accessToken == null) {
      throw AuthErrorException('No access token');
    }
    return {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
  }

  Future<Map<String, dynamic>> get allCards async {
    try {
      if (!await InternetConnectionChecker().hasConnection) {
        throw NoInternetConnectionException('No internet connection');
      }
      final response = await http.get(
        Uri.parse(EndpointsKeys.allCards),
        headers: await _header,
      );
      final responseBody = json.decode(response.body);
      if (responseBody['ok'] == null) {
        throw CardApiException('Failed to load your cards');
      }
      return responseBody;
    } catch (_) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> cardByNumber(String cardNumber) async {
    try {
      if (!await InternetConnectionChecker().hasConnection) {
        throw NoInternetConnectionException('No internet connection');
      }
      final response = await http.get(
        Uri.parse(EndpointsKeys.getCard(cardNumber)),
        headers: await _header,
      );
      final responseBody = json.decode(response.body);
      if (responseBody['ok'] == null) {
        throw CardApiException('Failed to load the card');
      }
      return responseBody;
    } catch (_) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createCard(Map<String, dynamic> body) async {
    try {
      if (!await InternetConnectionChecker().hasConnection) {
        throw NoInternetConnectionException('No internet connection');
      }
      final response = await http.post(
        Uri.parse(EndpointsKeys.newCard),
        headers: await _header,
        body: body,
      );
      final responseBody = json.decode(response.body);
      if (responseBody['error'] != null) {
        throw CardApiException(responseBody['error']);
      }
      return responseBody;
    } catch (_) {
      rethrow;
    }
  }
}
