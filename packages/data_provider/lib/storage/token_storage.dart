/// {@template token_storage}
/// Token storage for the authentication client.
/// {@endtemplate}
abstract class TokenStorage {
  /// Returns the current access token.
  Future<String?> readAccessToken();

  /// Returns the current refresh token.
  Future<String?> readRefreshToken();

  /// Saves the current tokens.
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });

  /// Clears the current tokens.
  Future<void> clearTokens();
}
