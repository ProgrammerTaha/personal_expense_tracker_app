import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;
  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }
    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: 'title',
              ),
              controller: titleController,
            ),
            TextField(
              // android keyboardType: TextInputType.number,
              // ios keyboardType: TextInputType.numberWithOptions(decimal: true),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: 'amount',
              ),
              controller: amountController,
            ),
            FlatButton(
              onPressed: submitData,
              child: Text(
                'Add transaction',
              ),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
