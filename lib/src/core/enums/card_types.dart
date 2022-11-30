import 'package:flutter_banking/src/core/abstract_classes/translator.dart';

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
