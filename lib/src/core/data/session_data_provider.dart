import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionDataProvider {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> saveAccessToken(String accessToken) async =>
      await _secureStorage.write(key: 'access_token', value: accessToken);

  Future<String?> get getAccessToken async =>
      await _secureStorage.read(key: 'access_token');

  Future<void> saveRefreshToken(String refreshToken) async =>
      await _secureStorage.write(key: 'refresh_token', value: refreshToken);

  Future<String?> get getRefreshToken async =>
      await _secureStorage.read(key: 'refresh_token');

  Future<void> saveAccessTokenExpireDate(String accessTokenExpireDate) async =>
      await _secureStorage.write(
          key: 'access_expire_date', value: accessTokenExpireDate);

  Future<DateTime?> get getAccessTokenExpireDate async {
    final expireDate = await _secureStorage.read(key: 'access_expire_date');
    if (expireDate == null) {
      return null;
    }
    return DateTime.tryParse(expireDate);
  }

  Future<void> saveRefreshTokenExpireDate(
          String refreshTokenExpireDate) async =>
      await _secureStorage.write(
          key: 'refresh_expire_date', value: refreshTokenExpireDate);

  Future<DateTime?> get getRefreshTokenExpireDate async {
    final expireDate = await _secureStorage.read(key: 'refresh_expire_date');
    if (expireDate == null) {
      return null;
    }
    return DateTime.tryParse(expireDate);
  }

  Future<void> logout() async => await _secureStorage.deleteAll();

  Future<bool> get isAuthenticated async {
    final accessExpireDateData =
        await _secureStorage.read(key: 'access_expire_date');
    final refreshExpireDateData =
        await _secureStorage.read(key: 'refresh_expire_date');

    final hasTokens = await _secureStorage.containsKey(key: 'access_token') &&
        await _secureStorage.containsKey(key: 'refresh_token') &&
        refreshExpireDateData != null &&
        accessExpireDateData != null;

    if (!hasTokens) return false;

    final accessExpireDate = DateTime.tryParse(accessExpireDateData);
    final refreshExpireDate = DateTime.tryParse(refreshExpireDateData);

    if (accessExpireDate == null || refreshExpireDate == null) {
      return false;
    }

    return accessExpireDate.isAfter(DateTime.now()) &&
        refreshExpireDate.isAfter(DateTime.now());
  }
}
