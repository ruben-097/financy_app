import 'transaction.dart';

final List<Transaction> transactions = [
  Transaction(
    title: "Netflix",
    amount: 1500,
    isIncome: true,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    title: "BFA",
    amount: 200,
    isIncome: false,
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
  Transaction(
    title: "GloboPlay",
    amount: 500,
    isIncome: true,
    date: DateTime.now().subtract(const Duration(days: 3)),
  ),
  Transaction(
    title: "Crunchyroll",
    amount: 100,
    isIncome: false,
    date: DateTime.now().subtract(const Duration(days: 4)),
  ),
  Transaction(
    title: "Pionner",
    amount: 673,
    isIncome: true,
    date: DateTime.now().subtract(const Duration(days: 5)),
  ),
  Transaction(
    title: "BAI",
    amount: 150,
    isIncome: false,
    date: DateTime.now().subtract(const Duration(days: 7)),
  ),
  Transaction(
    title: "Redbull",
    amount: 52,
    isIncome: false,
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
  Transaction(
    title: "AMDRyzen",
    amount: 78,
    isIncome: true,
    date: DateTime.now().subtract(const Duration(days: 3)),
  ),
];
