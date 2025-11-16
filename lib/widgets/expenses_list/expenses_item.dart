import 'package:expense/models/expense_mod.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});
  final ExpenseMod expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '€${expense.amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.amber),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formatedDate, style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
