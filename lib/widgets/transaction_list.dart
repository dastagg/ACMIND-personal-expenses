import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, this.deleteTx, {Key? key})
      : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 30.0),
                SizedBox(
                  height: 200.0,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 5.0),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: Theme.of(context).textTheme.headline6),
                    trailing: IconButton(
                      onPressed: () {
                        deleteTx(transactions[index].id);
                      },
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
              // children: transactions.map((tx) {}).toList(),
            ),
    );
  }
}
