import 'package:flutter/material.dart';
import 'package:provider_state_management/model/dbDrink.dart';

class HomeViewModel extends ChangeNotifier {
  List<Drink> drinks = [];

  void changeCart(List<Drink> drinks) {
    this.drinks = drinks;
    notifyListeners();
  }

  void addItem(Drink drinks) {
    this.drinks.add(drinks);
    notifyListeners();
  }

  void removeItem(Drink drink) {
    drinks.remove(drink);
    notifyListeners();
  }

  bool isAdded(String drinkId){
    return drinks.any((drink) => drink.id == drinkId);
  }

  // void addItemAutomatic() {
  //   timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     addItem(Cart(
  //         id: '1',
  //         drink: Drink(
  //           id: '1',
  //           price: 1000,
  //           imageUrl: '',
  //           title: 'No name',
  //         )));
  //     if (carts.length > 15) {
  //       this.timer?.cancel();
  //     }
  //   });
  // }
}
