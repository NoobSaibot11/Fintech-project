import 'package:flutter/material.dart';
import 'FeesDetails/FeesPageComponents/transaction_container.dart';
import 'FeesDetails/FeesPageComponents/transaction_details.dart';
import 'FeesDetails/FeesPageComponents/upi_transaction.dart';

class FeesPayment extends StatefulWidget {
  const FeesPayment({Key? key}) : super(key: key);

  @override
  _FeesPaymentState createState() => _FeesPaymentState();
}

class _FeesPaymentState extends State<FeesPayment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isFabVisible = true;

  void _showUPIPageBottomSheet() {
    setState(() {
      isFabVisible = false;
    });

    _scaffoldKey.currentState?.showBottomSheet(
      (BuildContext context) {
        return const UPIPage();
      },
    ).closed.whenComplete(() {
      setState(() {
        isFabVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Accounts",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        iconTheme:
            const IconThemeData(color: Colors.black), // Use your desired color
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_important_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const MySearchBar(),
            // TransactionContainer and other widgets
            TransactionContainer(
              transactions: [
                Transaction(
                  title: 'Regular',
                  date: DateTime.now(),
                  amount: 50.0,
                  isCredit: false,
                ),
                Transaction(
                  title: 'Extra-Curricular',
                  date: DateTime.now().subtract(const Duration(days: 2)),
                  amount: 30.0,
                  isCredit: true,
                ),
                Transaction(
                  title: 'Scholarship',
                  date: DateTime.now().subtract(const Duration(days: 2)),
                  amount: 300.0,
                  isCredit: true,
                ),
                Transaction(
                  title: 'Extra-Curricular',
                  date: DateTime.now().subtract(const Duration(days: 2)),
                  amount: 30.0,
                  isCredit: false,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFabVisible,
        child: FloatingActionButton(
          onPressed: _showUPIPageBottomSheet,
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.currency_rupee,
            color: Colors.black,
          ), // Customize the color as needed
        ),
      ),
    );
  }
}
