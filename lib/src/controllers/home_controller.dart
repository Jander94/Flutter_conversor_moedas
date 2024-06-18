import 'package:conversor_moedas/src/models/currency_models.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  final TextEditingController fromText;
  final TextEditingController toText;

  CurrencyModel? fromCurrency;
  CurrencyModel? toCurrency;

  HomeController(this.toText, this.fromText) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[1];
    toCurrency = currencies[0];
  }

  void convert() {
    String text = fromText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1;
    double returnValue = 0;

    if (fromCurrency?.name == 'REAL') {
      returnValue = value * (toCurrency?.real ?? 0);
    } else if (fromCurrency?.name == 'DOLAR') {
      returnValue = value * (toCurrency?.dolar ?? 0);
    } else if (fromCurrency?.name == 'EURO') {
      returnValue = value * (toCurrency?.euro ?? 0);
    } else if (fromCurrency?.name == 'BITCOIN') {
      returnValue = value * (toCurrency?.bitcoin ?? 0);
    }
    fromText.text = returnValue.toStringAsFixed(2);
  }
}
