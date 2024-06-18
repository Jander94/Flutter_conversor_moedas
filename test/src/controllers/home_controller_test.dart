import 'package:conversor_moedas/src/controllers/home_controller.dart';
import 'package:conversor_moedas/src/models/currency_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController fromText = TextEditingController();
  final TextEditingController toText = TextEditingController();
  final homeController = HomeController(toText, fromText);

  test("Converter real com ponto para dólar", () {
    fromText.text = '2.0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  test("Converter real com vírgula para dólar", () {
    fromText.text = '2,0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  test('Converter dólar para real', () {
    fromText.text = '2.0';
    homeController.toCurrency = CurrencyModel(
        name: 'DOLAR', real: 5.65, dolar: 1.0, euro: 0.85, bitcoin: 0.000088);
    homeController.fromCurrency = CurrencyModel(
        name: 'REAL', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);

    homeController.convert();
    expect(fromText.text, '11.30');
  });
}
