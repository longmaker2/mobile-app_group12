import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(200, 238, 238, 238),
        border: null,
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search',
          focusedBorder: null,
          border: InputBorder.none,
          prefixIcon: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.search,
            ),
          ),
        ),
      ),
    );
  }
}
