import 'package:flutter_banking/src/core/data/session_data_provider.dart';
import 'package:flutter_banking/src/core/exceptions/auth_response_error_exception.dart';
import 'package:flutter_banking/src/core/exceptions/no_internet_connection_exception.dart';
import 'package:flutter_banking/src/features/auth/data/auth_api_provider.dart';
import 'package:flutter_banking/src/features/auth/models/login_model.dart';
import 'package:flutter_banking/src/features/auth/models/register_model.dart';

class AuthService {
  final _authApiProvider = AuthApiProvider();
  final _sessionDataProvider = SessionDataProvider();

  Future<String?> loginWithPhone(LoginModel loginModel) async {
    try {
      final responseData = await _authApiProvider.loginWithPhoneNumber(
          phoneNumber: loginModel.login, password: loginModel.password);

      await _saveToSession(responseData);
    } on AuthErrorException catch (error) {
      return error.message;
    }
    return null;
  }

  Future<String?> loginWithIpn(LoginModel loginModel) async {
    try {
      final responseData = await _authApiProvider.loginWithIpn(
          ipn: loginModel.login, password: loginModel.password);

      await _saveToSession(responseData);

      return null;
    } on AuthErrorException catch (error) {
      return error.message;
    }
  }

  Future<String?> register(RegisterModel registerModel) async {
    try {
      final responseData = await _authApiProvider.register(registerModel);

      _saveToSession(responseData);

      return null;
    } on AuthErrorException catch (error) {
      return error.message;
    }
  }

  Future<String?> refreshToken() async {
    try {
      final refreshToken = await _sessionDataProvider.getRefreshToken;
      if (refreshToken == null) {
        return 'No refresh token';
      }
      final responseData = await _authApiProvider.refreshToken(refreshToken);

      await _saveToSession(responseData);

      return null;
    } on AuthErrorException catch (error) {
      return error.message;
    } on NoInternetConnectionException catch (error) {
      return error.message;
    }
  }

  Future<void> _saveToSession(Map<String, dynamic> data) async {
    await _sessionDataProvider.saveAccessToken(data['access_token']);
    await _sessionDataProvider
        .saveAccessTokenExpireDate(data['access_expire_date']);
    await _sessionDataProvider.saveRefreshToken(data['refresh_token']);
    await _sessionDataProvider
        .saveRefreshTokenExpireDate(data['refresh_expire_date']);
  }

  Future<bool> checkPincode(String pincode) async =>
      (await _sessionDataProvider.pincode) == pincode;
}
