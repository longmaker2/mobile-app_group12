import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final void Function(String text) onSearchedFood;

  SearchField({
    super.key,
    required this.onSearchedFood,
  });

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(157, 222, 218, 218),
        border: null,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: 'Search',
          focusedBorder: null,
          border: InputBorder.none,
          prefixIcon: GestureDetector(
            onTap: () {
              onSearchedFood(_searchController.text);
            },
            child: const Icon(
              Icons.search,
            ),
          ),
        ),
      ),
    );
  }
}
