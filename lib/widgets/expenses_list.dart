import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  //Конструктор
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  // Свойства класса
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
// Стройка
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        key: ValueKey(expenses[index]),
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
