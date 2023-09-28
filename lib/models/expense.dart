import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

//Импортируем и помощаем в переменную Uuid
const uuid = Uuid();

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
}
