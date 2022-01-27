import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDeffaultPadding),
          child: Icon(Icons.search, color: Colors.black),
        ),
        hintText: "Поиск...",
      ),
      style: TextStyle(fontSize: 17),
      cursorColor: Colors.black,
      cursorWidth: 0.5,
    );
  }
}
