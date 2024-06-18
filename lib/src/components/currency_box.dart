import 'package:conversor_moedas/src/models/currency_models.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel>? items;
  final TextEditingController controller;
  final CurrencyModel? selectedItem;
  final void Function(CurrencyModel? model)? onChanged;

  // ignore: prefer_const_constructors_in_immutables
  CurrencyBox(
      {super.key,
      this.items,
      required this.controller,
      this.onChanged,
      this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 56,
              child: DropdownButton<CurrencyModel>(
                  value: selectedItem,
                  iconEnabledColor: Colors.amber,
                  isExpanded: true,
                  underline: Container(
                    height: 1,
                    color: Colors.amber,
                  ),
                  items: items
                      ?.map((e) => DropdownMenuItem<CurrencyModel>(
                          value: e, child: Text(e.name ?? 'haha')))
                      .toList(),
                  onChanged: onChanged),
            )),
        const SizedBox(
          width: 50,
        ),
        Expanded(
          flex: 2,
          child: TextField(
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
              )),
        ),
      ],
    );
  }
}
