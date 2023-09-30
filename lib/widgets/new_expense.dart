import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
// Класс который идет в метод добавления расходов

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  // Функция добавления расхода
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

//Cохраняем Пользовательксий текст (из Метода(_saveTitle)
var _enteredTitle = '';

class _NewExpenseState extends State<NewExpense> {
  //Обработка пользовательского текста
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure; //Сохраняем выбранную категорию

//Метод презентации даты
  void _presentDate() async {
    final now = DateTime.now();
    final firsDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context, initialDate: now, firstDate: firsDate, lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  //Метод проверки текста,суммы,даты пользователя
  void _sumbitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text('Invalid input'),
              content: const Text(
                  'Please make sure a valid title,amount,date and category was entered.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Okey'),
                ),
              ],
            )),
      );
      return;
    }
    //Создаем расходы и передаем эти расходы для доп расходов
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  //Обязательный метод удаления из памяти контроллера.
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  //Метод сохранения Текста в титуле
  void _saveTitleInput(String inputVale) {
    _enteredTitle = inputVale;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No date selected'
                        : formatter.format(_selectedDate!),
                  ),
                  IconButton(
                      onPressed: _presentDate,
                      icon: const Icon(
                        Icons.calendar_month,
                        color: Colors.black,
                      ))
                ],
              ))
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory, //Отображение на экране выбр категории
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value; //Сохраняем выбранную категорию
                  });
                },
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: _sumbitExpenseData,
                  child: const Text('Save Expense'))
            ],
          )
        ],
      ),
    );
  }
}
