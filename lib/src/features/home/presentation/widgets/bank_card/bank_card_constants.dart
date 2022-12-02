import 'package:flutter/material.dart';

import '../../../../../core/constants/icons/card_provider_icons_icons.dart';
import '../../../../../core/enums/card_providers.dart';

Color get cardBlackBackground => const Color.fromRGBO(30, 29, 29, 1);
Color get cardGreyBackground => const Color.fromRGBO(83, 83, 83, 1);

TextStyle get bankCardTextStyle => const TextStyle(
      color: Colors.white,
      fontSize: 16,
    );

Map<CardProviders, IconData> get providerIcons => {
      CardProviders.mastercard: CardProviderIcons.cc_mastercard,
      CardProviders.visa: CardProviderIcons.visa,
    };
