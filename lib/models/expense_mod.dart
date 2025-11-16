import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; // importation du package de creation d'id
import 'package:intl/intl.dart'; // pour formatter

const uuid = Uuid(); //Permet la création d'id dynamique

// Permet de cree une liste d'element fixes, pratique pour les selection et eviter les erreurs de frappe
enum Category { nourriture, voyage, plaisir, travail }

// Mettre des icon en fonction de la catégories
const categoryIcons = {
  Category.nourriture: Icons.lunch_dining,
  Category.plaisir: Icons.movie,
  Category.voyage: Icons.travel_explore,
  Category.travail: Icons.work_off,
};

// Formatage de date intl
final formatter = DateFormat.yMd('fr');

class ExpenseMod {
  ExpenseMod({
    required this.amount,
    required this.date,
    required this.title,
    required this.category,
  }) : id = uuid.v4(); // permet apres les : d'initialiser certaines variables
  final double amount;
  final String title;
  final DateTime date;
  final String id;
  final Category category;

  // Les méthodes
  //formater la date pub : intl
  String get formatedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  final Category category;
  final List<ExpenseMod> expenses;

  ExpenseBucket.forCategory(List<ExpenseMod> allExpense, this.category)
    : expenses = allExpense.where((expense) => expense.category == category).toList();

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}
