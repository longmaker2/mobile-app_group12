import 'package:flutter/material.dart';

class AddOn extends StatefulWidget {
  const AddOn({super.key});

  @override
  State<AddOn> createState() => _AddOnState();
}

class _AddOnState extends State<AddOn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(
        left: 25.0,
        right: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Colors.grey[300],

      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'images/rice.png',
          ),
        ),
      ),
    );
  }
}
