import 'package:flutter_banking/src/core/abstract_classes/translator.dart';

import '../errors/exceptions/unknown_enum_value_exception.dart';

enum Currencies { uah, usd, eur, unknown }

class CurrenciesTranslator extends Translator<Currencies> {
  final String _currency;

  CurrenciesTranslator(this._currency);

  @override
  Currencies get value {
    switch (_currency) {
      case 'UAH':
        return Currencies.uah;
      case 'USD':
        return Currencies.usd;
      case 'EUR':
        return Currencies.eur;
      default:
        return Currencies.unknown;
    }
  }
}

class CurrenciesStringTranslator extends Translator<String> {
  final Currencies _currencies;

  CurrenciesStringTranslator(this._currencies);

  @override
  String get value {
    switch (_currencies) {
      case Currencies.uah:
        return 'UAH';
      case Currencies.usd:
        return 'USD';
      case Currencies.eur:
        return 'EUR';
      case Currencies.unknown:
        throw UnknownEnumValueException('Unknown currency type');
    }
  }
}
