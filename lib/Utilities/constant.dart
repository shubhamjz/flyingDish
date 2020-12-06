import 'package:flutter/material.dart';


const kTextColorGrey = Color(0xFFBBBBBB);
const kTextColorBlack = Color(0xFF2E2E2E);

TextStyle kNormalFontTextStyleGrey() {
  return TextStyle(
    color: kTextColorGrey,
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}

TextStyle kNormalFontTextStyleBlack() {
  return TextStyle(
    color: kTextColorBlack,
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}


TextStyle kH3FontTextStyleBlackBold() {
  return TextStyle(
    color: kTextColorBlack,
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

TextStyle kH3FontTextStyleGreyBold() {
  return TextStyle(
    color: kTextColorGrey,
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
