class EndpointsKeys {
  static const baseUrl = "http://10.0.2.2:7070";

  static const loginEndpoint = "/login";

  static const registerEndpoint = "/register";

  static const refreshTokenEndpoint = "/refresh_token";

  static const allCards = '/user/cards/';

  static const newCard = '/user/cards/new';

  static String getCard(String cardNumber) => '$allCards/$cardNumber';
}
