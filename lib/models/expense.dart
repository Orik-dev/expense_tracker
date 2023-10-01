import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//Импортируем и помощаем в переменную
const uuid = Uuid();
final formatter = DateFormat.yMd();

// Создаем собственный тип(пользовательский) с помощью Enum
enum Category {
  food,
  travel,
  leisure,
  work,
}

//Наши значки расходов
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

//Класс расходов
class Expense {
  final String id; // Каждый расход будет иметь свой ID
  final String title; // Титул
  final double amount; //Сумма
  final DateTime date; // Дата и время расходов
  final Category category; // Категории

//Конструктор с Именовыными параметрами
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid
            .v4(); // - это часть инициализатора, которая выполняется после создания объекта, но перед выполнением тела конструктора.

  String get formatDate => formatter.format(date);
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  // Геттер суммирует все расходы
  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount; // sum = sum + expense.amount
    }
    return sum;
  }
}
