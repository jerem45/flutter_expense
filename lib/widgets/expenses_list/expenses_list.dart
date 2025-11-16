import 'package:flutter/material.dart';
import 'package:expense/models/expense_mod.dart';
import 'package:expense/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.userList, {super.key, required this.onRemoveExpense});
  //Récuperer la liste des expenses
  final List<ExpenseMod> userList;
  final Function(ExpenseMod expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            margin: Theme.of(context).cardTheme.margin,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Supprimer ${userList[index].title} ?",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.amber,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          onDismissed: (direction) => onRemoveExpense(userList[index]),
          key: ValueKey(userList[index]),
          child: ExpensesItem(userList[index]),
        );
      },
    );
  }
}
