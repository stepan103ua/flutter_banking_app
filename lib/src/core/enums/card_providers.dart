import 'package:flutter_banking/src/core/abstract_classes/translator.dart';

import '../errors/exceptions/unknown_enum_value_exception.dart';

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

class CardProvidersStringTranslator extends Translator<String> {
  final CardProviders _cardProviders;

  CardProvidersStringTranslator(this._cardProviders);

  @override
  String get value {
    switch (_cardProviders) {
      case CardProviders.mastercard:
        return 'Mastercard';
      case CardProviders.visa:
        return 'Visa';
      case CardProviders.unknown:
        throw UnknownEnumValueException('Unknown card provider');
    }
  }
}
