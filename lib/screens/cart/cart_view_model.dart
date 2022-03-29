import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider_state_management/model/dbCart.dart';
import 'package:collection/collection.dart';

class CartViewModel extends ChangeNotifier {
  List<Cart> carts = [];

  void changeCart(List<Cart> carts) {
    this.carts = carts;
    notifyListeners();
  }

  void addItem(Cart cart) {
    var selectedCart = carts.firstWhereOrNull((currentCart) => currentCart.id == cart.id);
    if (selectedCart != null){
      selectedCart.quantity++;
      notifyListeners();
    }
  }

  void removeItem(Cart cart) {
    var selectedCart = carts.firstWhereOrNull((currentCart) => currentCart.id == cart.id);
    if(selectedCart != null){
      if(selectedCart.quantity - 1 >= 0) {
        selectedCart.quantity--;
        notifyListeners();
      }
    }
  }

  bool isAdded(String drinkId){
    return carts.any((cart) => cart.drink.id == drinkId);
  }

  int getTotalAmount(){
    var total = 0;
    for(var cart in carts){
      total += cart.drink.price * cart.quantity;
    }
    return total;
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
