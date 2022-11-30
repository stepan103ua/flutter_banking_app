import 'package:flutter_banking/src/core/abstract_classes/translator.dart';
import 'package:flutter_banking/src/core/errors/exceptions/unknown_enum_value_exception.dart';

enum CardTypes { debit, credit, unknown }

class CardTypesTranslator extends Translator<CardTypes> {
  final String _cardType;

  CardTypesTranslator(this._cardType);

  @override
  CardTypes get value {
    switch (_cardType) {
      case 'Debit':
        return CardTypes.debit;
      case 'Credit':
        return CardTypes.credit;
      default:
        return CardTypes.unknown;
    }
  }
}

class CardTypesStringTranslator extends Translator<String> {
  final CardTypes _cardType;

  CardTypesStringTranslator(this._cardType);

  @override
  String get value {
    switch (_cardType) {
      case CardTypes.debit:
        return 'Debit';
      case CardTypes.credit:
        return 'Credit';
      case CardTypes.unknown:
        throw UnknownEnumValueException('Unknown card type');
    }
  }
}
