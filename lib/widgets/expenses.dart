import 'package:flutter/material.dart';
import 'package:expense/models/expense_mod.dart';
import 'package:expense/widgets/expenses_list/expenses_list.dart';
import 'package:expense/widgets/new_expense.dart';
import 'package:expense/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<ExpenseMod> _registeredExpenses = [];

  //methode pour activer le modal de configuration

  void _displayModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return NewExpense(onAdToList: _addToList);
      },
    );
  }

  void _addToList(ExpenseMod data) {
    setState(() {
      _registeredExpenses.add(data);
    });
  }

  void _removeExpense(ExpenseMod data) {
    final dataIndex = _registeredExpenses.indexOf(data);
    setState(() {
      _registeredExpenses.remove(data);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 10),
          content: Text(textAlign: TextAlign.center, data.title),
          action: SnackBarAction(
            label: "Garder ! ",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(dataIndex, data);
              });
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size.width;
    Widget displayListItems = Center(child: Text('Votre liste est vide ajouter des éléments...'));
    if (_registeredExpenses.isEmpty) {
      displayListItems;
    } else {
      displayListItems = ExpensesList(_registeredExpenses, onRemoveExpense: _removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ÉconoMe"),
        actions: [IconButton(onPressed: _displayModal, icon: Icon(Icons.add))],
      ),
      body: sizeScreen < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: displayListItems),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: displayListItems),
              ],
            ),
    );
  }
}
