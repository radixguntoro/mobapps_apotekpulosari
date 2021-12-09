import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:flutter/material.dart';
// import 'package:mdi/mdi.dart';

class CashBalanceScreen extends StatefulWidget {
  @override
  _CashBalanceScreenState createState() => _CashBalanceScreenState();
}

class _CashBalanceScreenState extends State<CashBalanceScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorTheme.primary,
        title: Text(
          "Cash Balance",
        ),
      ),
      body: Center(
        child: Text('Cash Balance Page'),
      ),
    );
  }
}