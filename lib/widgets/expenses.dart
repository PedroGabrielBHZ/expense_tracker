import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now().subtract(const Duration(days: 2)),
      category: Category.work,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return NewExpense(
            onAddExpense: _addExpense,
          );
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Deleted ${expense.title}"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget expensesList = const Center(
      child: Text("No expenses added yet"),
    );

    if (_registeredExpenses.isNotEmpty) {
      expensesList = ExpensesList(
        expenses: _registeredExpenses,
        onDelete: _deleteExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: expensesList),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExpenseOverlay,
        child: const Icon(Icons.add),
      ),
    );
  }
}
