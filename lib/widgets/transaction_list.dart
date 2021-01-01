import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_Item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx) {
    print('Constructor TransactionList');
  }
  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height * 0.6,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: [
                    Text(
                      'No transactions added yet',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(
                  mediaQuery: mediaQuery,
                  deleteTx: deleteTx,
                  transaction: transactions[index],
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
