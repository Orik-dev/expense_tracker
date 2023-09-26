import 'package:flutter/material.dart';

import 'models/expense.dart';

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

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Expenses')),
        body: const Column(
          children: <Widget>[
            Text('The char...'),
            Text('List...'),
          ],
        ),
      );
}
