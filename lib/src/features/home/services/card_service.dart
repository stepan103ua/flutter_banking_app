import 'package:dartz/dartz.dart';
import 'package:flutter_banking/src/core/enums/card_providers.dart';
import 'package:flutter_banking/src/core/enums/card_types.dart';
import 'package:flutter_banking/src/core/enums/currencies.dart';
import 'package:flutter_banking/src/core/errors/exceptions/auth_response_error_exception.dart';
import 'package:flutter_banking/src/core/errors/exceptions/card_api_exception.dart';
import 'package:flutter_banking/src/core/errors/exceptions/no_internet_connection_exception.dart';
import 'package:flutter_banking/src/core/errors/exceptions/unknown_enum_value_exception.dart';
import 'package:flutter_banking/src/core/errors/failure.dart';
import 'package:flutter_banking/src/features/home/data/card_api_provider.dart';
import 'package:flutter_banking/src/features/home/models/card_model.dart';

class CardService {
  final CardApiProvider _cardApiProvider = CardApiProvider();

  Future<Either<List<CardModel>, Failure>> get allCards async {
    try {
      final body = await _cardApiProvider.allCards;

      final List<Map<String, dynamic>> cardsJson = body['ok'];

      final cards =
          cardsJson.map((cardJson) => CardModel.fromJson(cardJson)).toList();

      return Left(cards);
    } on NoInternetConnectionException catch (error) {
      return Right(Failure(error.message));
    } on AuthErrorException catch (error) {
      return Right(Failure(error.message));
    } on CardApiException catch (error) {
      return Right(Failure(error.message));
    } catch (_) {
      return Right(Failure('Unknown error'));
    }
  }

  Future<Either<CardModel, Failure>> cardByNumber(String cardNumber) async {
    try {
      final body = await _cardApiProvider.cardByNumber(cardNumber);

      return Left(CardModel.fromJson(body['ok']));
    } on NoInternetConnectionException catch (error) {
      return Right(Failure(error.message));
    } on AuthErrorException catch (error) {
      return Right(Failure(error.message));
    } on CardApiException catch (error) {
      return Right(Failure(error.message));
    } catch (_) {
      return Right(Failure('Unknown error'));
    }
  }

  Future<Either<String, Failure>> createCard({
    required CardProviders cardProvider,
    required CardTypes cardType,
    required Currencies currency,
  }) async {
    try {
      final body = {
        'provider': CardProvidersStringTranslator(cardProvider).value,
        'type': CardTypesStringTranslator(cardType).value,
        'currency': CurrenciesStringTranslator(currency).value,
      };
      final responseBody = await _cardApiProvider.createCard(body);

      if (responseBody['error'] != null) {
        return Right(responseBody['error']);
      }

      return Left(responseBody['new card']);
    } on NoInternetConnectionException catch (error) {
      return Right(Failure(error.message));
    } on AuthErrorException catch (error) {
      return Right(Failure(error.message));
    } on CardApiException catch (error) {
      return Right(Failure(error.message));
    } on UnknownEnumValueException catch (error) {
      return Right(Failure(error.message));
    } catch (_) {
      return Right(Failure('Unknown error'));
    }
  }
}
