import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget header(){
      return AppBar();
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(),
    );
  }
}