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
        title: "Pandeiro Pagodinho",
        amount: 350,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Trezoitão pra matar o gato do vizinho",
        amount: 1500,
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
    Expense(
      title: "Quem tem medo de Teresinha Soares?",
      amount: 200,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
        title: "Umas brejas",
        amount: 50,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const NewExpense();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
