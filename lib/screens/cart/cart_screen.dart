import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/model/dbCart.dart';
import 'package:provider_state_management/model/dbDrink.dart';
import 'package:provider_state_management/screens/cart/cart_view_model.dart';
import 'package:provider_state_management/widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, this.dirks = const <Drink>[]}) : super(key: key);

  final List<Drink> dirks;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartViewModel _cartViewModel = CartViewModel();
  List<Cart> carts = [];

  @override
  void initState() {
    super.initState();
    getCartList();
  }

  void getCartList() {
    for (var drink in widget.dirks) {
      carts.add(Cart(drink: drink, id: drink.id));
    }
    _cartViewModel.changeCart(carts);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _cartViewModel,
      child: Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: Consumer<CartViewModel>(
          builder: (context, vm, _) {
            return ListView.builder(
              padding: const EdgeInsets.only(bottom: 100),
              itemCount: vm.carts.length,
              itemBuilder: (context, index) {
                return CartItem(
                  cart: vm.carts[index],
                  add: (Cart cart) => vm.addItem(cart),
                  remove: (Cart cart) => vm.removeItem(cart),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            label: Consumer<CartViewModel>(
              builder: (context, vm, _) => Text('${vm.getTotalAmount()} vnd'),

            ),
          icon: const Icon(Icons.monetization_on_sharp),
        ),
      ),
    );
  }
}
