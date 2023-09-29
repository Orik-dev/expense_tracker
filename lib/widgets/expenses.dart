import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
//Список расходов
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 15.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.50,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  //Метод добавления расходов
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _openAddExpenseOverlay,
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            const Text('The char...'),
            Expanded(
              child: ExpensesList(expenses: _registeredExpenses),
            ),
          ],
        ),
      );
}
