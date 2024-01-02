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
        title: "Steinway & Sons Flügel Modell D-274",
        amount: 150000.00,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cachaça 51",
        amount: 15,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Viagem pra Bahia",
        amount: 1500,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: "Jantar no Mocotó",
        amount: 150,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
      title: "Facsimile Tarsila do Amaral",
      amount: 150000.00,
      date: DateTime.now(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
      ),
      body: Column(
        children: [
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
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
