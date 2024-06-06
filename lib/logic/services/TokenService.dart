import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const String _tokenKey = 'auth_token';
  static const String _expirationKey = 'token_expiration';
  static const int _tokenExpirationIntervalSeconds = 86400; // 1 day in seconds

  static Future<void> saveToken(String token, DateTime expiration) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_expirationKey, expiration.toIso8601String());
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    if (token != null) {
      await _checkTokenValidity();
    }
    return token;
  }

  static Future<DateTime?> getTokenExpiration() async {
    final prefs = await SharedPreferences.getInstance();
    final expirationString = prefs.getString(_expirationKey);
    return expirationString != null ? DateTime.parse(expirationString) : null;
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_expirationKey);
  }

  static Future<void> _checkTokenValidity() async {
    final expiration = await getTokenExpiration();
    if (expiration != null && expiration.isBefore(DateTime.now())) {
      final token = await getToken();
      if (token != null) {
        final bool needsRefresh = _needsTokenRefresh(expiration);
        if (needsRefresh) {
          await _refreshToken();
          if (kDebugMode) {
            print('Token refreshed!');
          }
        }
      }
    }
  }

  static bool _needsTokenRefresh(DateTime expiration) {
    final refreshThreshold = DateTime.now().add(const Duration(minutes: 5));
    return expiration.isBefore(refreshThreshold);
  }

  static Future<void> _refreshToken() async {
    final newToken = await getOrRefreshToken();
    await saveToken(newToken, DateTime.now().add(const Duration(seconds: _tokenExpirationIntervalSeconds)));
  }

  static const String _dummyToken = "dummy_token";

  static Future<String> getOrRefreshToken() async {
    await Future.delayed(const Duration(seconds: 1));
    return _dummyToken;
  }
}
