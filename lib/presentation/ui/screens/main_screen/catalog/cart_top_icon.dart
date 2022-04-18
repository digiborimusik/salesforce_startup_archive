import 'package:***REMOVED***/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTopIcon extends StatefulWidget {
  static const String favorite_select_type = "favorite_select_type";
  static const String favorite_type = "favorite_type";
  static const String menu_type = "menu_type";
  static const String close_type = "close_type";
  final String type;
  CartTopIcon({required this.type});
  @override
  State<StatefulWidget> createState() => CartTopIconState();
}

class CartTopIconState extends State<CartTopIcon> {
  late String type;

  @override
  void initState() {
    type = widget.type;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case CartTopIcon.favorite_type:
        return getFavorite();
      case CartTopIcon.favorite_select_type:
        return getFavoriteSelect();
      case CartTopIcon.close_type:
        return getClose();
      case CartTopIcon.menu_type:
        return getMenu();
      default:
        return getFavorite();
    }
  }

  Widget getFavorite() {
    return Padding(
        padding:
            EdgeInsets.only(left: Get.width * 0.02, right: Get.width * 0.02),
        child: Image.asset(
          "assets/icons/favorite.png",
        ));
  }

  Widget getFavoriteSelect() {
    return Padding(
        padding:
            EdgeInsets.only(left: Get.width * 0.02, right: Get.width * 0.02),
        child: Image.asset(
          "assets/icons/favorite_select.png",
        ));
  }

  Widget getClose() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: MyColors.blue_00458C),
          shape: BoxShape.circle),
      child: Padding(
          padding: EdgeInsets.all(7),
          child: Image.asset("assets/icons/close.png")),
    );
  }

  Widget getMenu() {
    return Container(
      child: Icon(
        Icons.more_vert,
        color: MyColors.gray_B5C0CD,
      ),
    );
  }
}
