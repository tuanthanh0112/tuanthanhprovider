import 'package:flutter/material.dart';
import 'package:provider_state_management/model/dbDrink.dart';

class DrinkItem extends StatelessWidget {
  const DrinkItem(
      {Key? key,
      required this.drink,
      this.remove,
      this.add,
      this.isAdded = false})
      : super(key: key);
  final Drink drink;
  final void Function(Drink cart)? remove;
  final void Function(Drink cart)? add;
  final bool isAdded;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: Image.network(
            drink.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: _buildFooter(drink, context),
        ),
      ),
    );
  }

  Widget _buildFooter(Drink drink, BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black38,
      title: Text(drink.title),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text(
          '${drink.price} vnd',
          style: const TextStyle(fontSize: 12, color: Colors.white70),
        ),
      ),
      trailing: _getAddingStateIcon(),
    );
  }

  Widget _getAddingStateIcon() {
    if (isAdded) {
      return IconButton(
        onPressed: () {
          remove?.call(drink);
        },
        icon: const Icon(Icons.check_rounded),
      );
    }
    return IconButton(
      onPressed: () {
        add?.call(drink);
      },
      icon: const Icon(Icons.add_rounded),
    );
  }
}
