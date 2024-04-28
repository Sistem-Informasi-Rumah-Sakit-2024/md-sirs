import 'package:flutter/material.dart';

const Color kPrimarySecondColor = Color(0xFF282828);

const Color kPrimaryDark100 = Color(0xFF121212);
const Color kPrimaryDark200 = Color(0xFF282828);
const Color kPrimaryDark300 = Color(0xFF3f3f3f);
// const Color kPrimaryblue500 = Color(0xFFa688fa);
const Color kPrimaryblue500 = Color(0xFF6F35A5);

abstract class PageType {
  PageType._();
  static const TAMBAH = 0;
  static const EDIT = 1;
  static const DETAIL = 2;
}
