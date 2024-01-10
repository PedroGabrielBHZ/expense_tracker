import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onDelete});

  final List<Expense> expenses;
  final void Function(Expense expense) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: ((context, index) => Dismissible(
              key: ValueKey(expenses[index].id),
              background: Container(
                color: Theme.of(context).colorScheme.error,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                margin: Theme.of(context).cardTheme.margin,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                onDelete(expenses[index]);
              },
              child: ExpenseItem(expenses[index]),
            )));
  }
}
