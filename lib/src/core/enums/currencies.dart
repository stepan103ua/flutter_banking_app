import 'package:flutter_banking/src/core/abstract_classes/translator.dart';

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
