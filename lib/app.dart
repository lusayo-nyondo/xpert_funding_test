import 'dart:io';

import 'package:flutter/material.dart';

enum TransactionStages { evaluation1, evaluation2, masterAccount }

bool _isDesktop() {
  return Platform.isWindows || Platform.isLinux || Platform.isIOS;
}

class App extends StatelessWidget {
  const App({super.key});

  final transactions = const [
    {
      "title": "Two Step Challenge",
      "amount": 5000,
      "balance": 6340,
      "bought_at": "Mar 20, 2025",
      "id": "123453FDfd",
      "isFunded": false,
      "stage": TransactionStages.evaluation1,
    },
    {
      "title": "Two Step Challenge",
      "amount": 10000,
      "balance": 6340,
      "bought_at": "Mar 20, 2025",
      "id": "123453FDfd",
      "isFunded": true,
      "stage": TransactionStages.masterAccount,
    },
    {
      "title": "Two Step Challenge",
      "amount": 5000,
      "balance": 6340,
      "bought_at": "Mar 20, 2025",
      "id": "123453FDfd",
      "isFunded": true,
      "stage": TransactionStages.evaluation1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF000F33), Color(0xFF070707)],
            stops: [0.1859, 1.0],
          ),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height - 56,
          padding: EdgeInsets.all(28),
          alignment: Alignment.center,
          child: GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 5),
            crossAxisCount: _isDesktop() ? 2 : 1,
            childAspectRatio: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: transactions
                .map((transaction) => TransactionCard(transaction: transaction))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color(0x0DFFFFFF),
      ),
      child: Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    transaction["title"],
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(),
                onPressed: () {},
                child: Text(
                  transaction["isFunded"] ? "Funded" : "On Challenge",
                ),
              ),
            ],
          ),
          Text(
            "\$${transaction["amount"].toString()}",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontSize: 47.09,
              fontWeight: FontWeight.w600,
              letterSpacing: 0,
            ),
          ),
          Row(
            spacing: 5,
            children: [
              Row(
                spacing: 5,
                children: [
                  Text(
                    "Balance: ",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      height: 1.4,
                      letterSpacing: 0,
                    ),
                  ),
                  Text("\$${transaction["amount"]}"),
                ],
              ),
              Text(
                "•",
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  height: 1.4,
                  letterSpacing: 0,
                ),
              ),
              Row(
                spacing: 5,
                children: [
                  Text(
                    "Bought ",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      height: 1.4,
                      letterSpacing: 0,
                    ),
                  ),
                  Text(
                    transaction["bought_at"],
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      height: 1.4,
                      letterSpacing: 0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
              Text(
                "•",
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  height: 1.4,
                  letterSpacing: 0,
                ),
              ),
              Row(
                children: [
                  Text(
                    "ID: ${transaction["id"]}",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      height: 1.4,
                      letterSpacing: 0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 48,
            constraints: BoxConstraints(
              maxWidth: _isDesktop()
                  ? (MediaQuery.of(context).size.width / 2) - 28
                  : MediaQuery.of(context).size.width - 28,
            ),
            child: TransactionCardStepper(transaction),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bar_chart, color: Colors.black),
                Text(
                  'Dashboard',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionCardStepper extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const TransactionCardStepper(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -25,
            child: Container(
              alignment: Alignment.center,
              width: 25,
              height: 48,
              child: Divider(color: Colors.red, thickness: 5),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              children: [
                FilledButton(
                  onPressed: () {},
                  child: Row(
                    children: [Icon(Icons.bar_chart), Text("Elevated 1")],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    width: 25,
                    height: 48,
                    child: Divider(color: Colors.red, thickness: 5),
                  ),
                ),
                FilledButton(
                  onPressed: () {},
                  child: Row(
                    children: [Icon(Icons.bar_chart), Text("Elevated 2")],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    width: 25,
                    height: 48,
                    child: Divider(color: Colors.red, thickness: 5),
                  ),
                ),
                FilledButton(
                  onPressed: () {},
                  child: Row(
                    children: [Icon(Icons.bar_chart), Text("Master Account")],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -25,
            child: Container(
              alignment: Alignment.center,
              width: 25,
              height: 48,
              child: Divider(color: Colors.red, thickness: 5),
            ),
          ),
        ],
      ),
    );
  }
}
