import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final String itemName;
  final double itemPrice;
  final String itemImage;
  final int quantity;
  final void Function() onTap;

  const CartItem({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.quantity,
    required this.onTap
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int _countNumber = 1;

  void _increment() {
    setState(() {
      _countNumber++;
    });
  }

  void _decrement() {
    setState(() {
      if (_countNumber > 1) {
        _countNumber--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0), // Adjust padding as needed
          decoration: BoxDecoration(
            color: const Color.fromARGB(
                255, 247, 245, 245), // Set your desired background color
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              widget.itemImage,
              height: 80.0,
              width: 80.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.itemName,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  'Rwf ${_countNumber * widget.itemPrice}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow.shade600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _decrement,
                      icon: const Icon(
                        Icons.remove_circle_outline_outlined,
                        color: Colors.red,
                        size: 15.0,
                      ),
                    ),
                    Text(
                      '$_countNumber',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.red,
                          ),
                    ),
                    IconButton(
                      onPressed: _increment,
                      icon: const Icon(
                        Icons.remove_circle_outline_outlined,
                        color: Colors.red,
                        size: 15.0,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: widget.onTap,
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ))
      ],
    );
  }
}
