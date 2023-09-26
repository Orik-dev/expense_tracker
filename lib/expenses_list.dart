import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  //Конструктор
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  // Свойства класса
  final List<Expense> expenses;

// Стройка
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Text(expenses[index].title));
  }
}
