import 'package:firebase_project/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_project/screens/home/coffee_tile.dart';

class CoffeeList extends StatefulWidget {
  CoffeeList ({Key? key}) : super(key: key);

  @override
  State<CoffeeList > createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList > {
  @override
  Widget build(BuildContext context) {
    final coff = Provider.of<List<Coffee>>(context);
    coff.forEach((coffee){
      print(coffee.name);
      print(coffee.sugars);
      print(coffee.strength);
    });
    return ListView.builder(
      itemCount: coff.length,
      itemBuilder: (context, index){
        return CoffeeTile(coffee:coff[index]);
      },
    );
  }
}