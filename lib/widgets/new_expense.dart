import 'package:flutter/material.dart';
import 'package:expense/models/expense_mod.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAdToList});
  final Function(ExpenseMod expense) onAdToList;
  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  /*---------------Methode 1 pour recuperer les données des inputs   
  var inputTitle = '';

  void _inputTitleData(String inputData) {
    inputTitle = inputData;
  }
*/

  // Méthode 2 pour récuperer les donnnées des inputs
  final _inputTitleController = TextEditingController();
  final _inputAmountController = TextEditingController();
  DateTime? _selectedDate; // le ? pour dire quel stocke une valeur de type dateTime ou rien null
  Category _categorySelected = Category.travail;

  //methode d'affichage de la date
  void _datePicker() async {
    var now = DateTime.now();
    var firstDate = DateTime(now.year - 1);
    final pickerDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickerDate;
    });
  }

  // methode de soumission du formulaire

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_inputAmountController.text);
    final amountIsValid = enteredAmount == null || enteredAmount <= 0;
    if (_inputTitleController.text.trim().isEmpty || amountIsValid || _selectedDate == null) {
      //show error
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Formulaire non valide ! '),
          content: Text("Attention certaines informations du formaulaire sont invalide..."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('ok'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAdToList(
      ExpenseMod(
        amount: enteredAmount,
        date: _selectedDate!,
        title: _inputTitleController.text,
        category: _categorySelected,
      ),
    );

    Navigator.pop(context);
  }

  //Permet de ne pas garder en mémoire les informations et eviter d'alourdir l'application se qui permet une meilleur optimisation
  //a effetuer Sytématiquement sur chaque element input du formulaire
  @override
  void dispose() {
    _inputTitleController.dispose();
    _inputAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
      child: Column(
        children: [
          TextField(
            //onChanged: _inputTitleData, ---> Méthode 1
            controller: _inputTitleController,
            maxLength: 50,
            decoration: InputDecoration(label: const Text("Titre")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _inputAmountController,
                  maxLength: 7,

                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(label: Text("Montant"), prefixText: '€'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Aucune date'
                          : formatter.format(_selectedDate!), // le ! pour forcer la veur null
                    ),
                    IconButton(onPressed: _datePicker, icon: Icon(Icons.calendar_month_outlined)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            children: [
              DropdownButton(
                value: _categorySelected,
                items: Category.values.map((data) {
                  return DropdownMenuItem(value: data, child: Text(data.name.toUpperCase()));
                }).toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _categorySelected = value;
                    print(_categorySelected);
                  });
                },
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // permet de fermer les overlay des modal
                },
                child: Text('Annuler'),
              ),
              ElevatedButton(onPressed: _submitExpenseData, child: Text('Ajouter')),
            ],
          ),
        ],
      ),
    );
  }
}
