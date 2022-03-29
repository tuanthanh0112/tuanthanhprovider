import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/screens/home/home_view_model.dart';
import 'package:provider_state_management/widgets/badge.dart';
import 'package:provider_state_management/widgets/drink_list.dart';
import 'package:provider_state_management/screens/cart/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.homeViewModel}) : super(key: key);

  final HomeViewModel homeViewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tô Tuấn Thành'),
        centerTitle: true,
        actions:  [
          _buildCartAction(context)
        ],
      ),
      body:  DrinkList(homeViewModel: widget.homeViewModel),
    );
  }

  Widget _buildCartAction(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, vm, _) {
        return Badge(
          value: vm.drinks.length,
          iconButton: IconButton(
            icon: const Icon(Icons.shopping_bag_rounded),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  CartScreen(dirks: vm.drinks),
                ),
              );
            },
          ),
        );
      }
    );
  }
}
