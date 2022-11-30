import 'package:flutter_banking/src/core/abstract_classes/translator.dart';

enum CardProviders { mastercard, visa, unknown }

class CardProviderTranslator extends Translator<CardProviders> {
  final String _cardProvider;
  CardProviderTranslator(this._cardProvider);

  @override
  CardProviders get value {
    switch (_cardProvider) {
      case 'Visa':
        return CardProviders.visa;
      case 'Mastercard':
        return CardProviders.mastercard;
      default:
        return CardProviders.unknown;
    }
  }
}
