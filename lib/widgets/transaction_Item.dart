import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.mediaQuery,
    @required this.deleteTx,
    @required this.transaction,
  }) : super(key: key);

  final MediaQueryData mediaQuery;
  final Function deleteTx;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        trailing: mediaQuery.size.width > 412
            ? FlatButton.icon(
                onPressed: () => deleteTx(transaction.id),
                icon: const Icon(
                  Icons.delete,
                ),
                label: const Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
                icon: const Icon(
                  Icons.delete,
                ),
              ),
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(
            transaction.date,
          ),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
