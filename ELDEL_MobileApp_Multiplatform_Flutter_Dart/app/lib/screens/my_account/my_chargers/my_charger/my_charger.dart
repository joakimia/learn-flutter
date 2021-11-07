import 'package:app/shared/constants/label.dart';
import 'package:flutter/material.dart';

import 'package:app/models/charge_points/charger_model.dart';
import 'package:app/shared/widgets/card.dart';

class MyCharger extends StatelessWidget {
  final Charger? _charger;

  const MyCharger({Key? key, required Charger? charger})
    : _charger = charger, 
      super(key: key);

  @override
  Widget build(BuildContext context) => EldelCard(
    child: Column(
      children: const [
        TextField(decoration: InputDecoration(hintText: nameLabel)),
        TextField(decoration: InputDecoration(hintText: addressLabel)),
        TextField(decoration: InputDecoration(hintText: contactPersonLabel)),
        TextField(decoration: InputDecoration(hintText: contactPhoneNumberLabel)),
        TextField(decoration: InputDecoration(hintText: socketTypeLabel)),
        TextField(decoration: InputDecoration(hintText: chargerTypeLabel)),
      ],
    ),
  );
}
