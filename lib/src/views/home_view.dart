// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:conversor_moedas/src/components/currency_box.dart';
import 'package:conversor_moedas/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController fromText = TextEditingController();
  final TextEditingController toText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText, fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 70, left: 20, right: 20, bottom: 20),
              child: Column(children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                ),
                SizedBox(
                  height: 100,
                ),
                CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  items: homeController.currencies,
                  controller: toText,
                  onChanged: (value) {
                    setState(() {
                      homeController.toCurrency = value;
                    });
                  },
                ),
                SizedBox(height: 40),
                CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  items: homeController.currencies,
                  controller: fromText,
                  onChanged: (value) {
                    setState(() {
                      homeController.fromCurrency = value;
                    });
                  },
                ),
                SizedBox(height: 80),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        homeController.convert();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Define bordas quadradas
                          ),
                          backgroundColor: Color.fromARGB(255, 145, 99, 1)),
                      child: Text('Converter'),
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
