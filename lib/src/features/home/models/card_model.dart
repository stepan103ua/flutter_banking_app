import '../../../core/enums/card_providers.dart';
import '../../../core/enums/card_types.dart';
import '../../../core/enums/currencies.dart';

class CardModel {
  final String cardNumber;
  final DateTime creationTime;
  final DateTime expirationTime;
  final String cvvCode;
  final String pinCode;
  final CardTypes cardType;
  final Currencies currency;
  final CardProviders cardProvider;
  final double money;
  final double moneyLimit;
  final bool isBlocked;

  CardModel({
    required this.cardNumber,
    required this.creationTime,
    required this.expirationTime,
    required this.cvvCode,
    required this.pinCode,
    required this.cardType,
    required this.currency,
    required this.cardProvider,
    required this.money,
    required this.moneyLimit,
    required this.isBlocked,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        cardNumber: json['cardNumber'],
        creationTime: json['creationTime'],
        expirationTime: json['expirationTime'],
        cvvCode: json['cvvCode'],
        pinCode: json['pinCode'],
        cardType: CardTypesTranslator(json['cardType']['name']).value,
        currency: CurrenciesTranslator(json['currencyName']).value,
        cardProvider:
            CardProviderTranslator(json['providerEntity']['providerName'])
                .value,
        money: json['sum'],
        moneyLimit: json['sumLimit'],
        isBlocked: json['isBlocked'],
      );
}
