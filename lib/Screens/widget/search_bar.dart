import 'package:flutter/material.dart';
import 'package:img_demo_app/Utilities/constant.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final Function(String) onTextChanged;
  final TextEditingController searchTextController;

  SearchBar({
    Key key,
    this.hintText,
    this.searchTextController,
    this.onTextChanged
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: TextField(
            controller: searchTextController,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  size: 24,
                ),
                hintText: hintText,
                hintStyle: kNormalFontTextStyleGrey(),
                border: InputBorder.none
            ),
            onChanged : (value) {
              onTextChanged(value);
            }
        ),
      ),
    );
  }
}
