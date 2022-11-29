class EndpointsKeys {
  static const baseUrl = "http://192.168.0.102:7070";

  static const loginEndpoint = "/login";

  static const registerEndpoint = "/register";

  static const refreshTokenEndpoint = "/refresh_token";

  static const allCards = '/user/cards';

  static const newCard = '/user/cards/new';

  static String getCard(String cardNumber) => '$allCards/$cardNumber';
}
