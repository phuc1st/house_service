import 'models/transaction.dart';
import 'models/bank_account.dart';
import 'models/monthly_data.dart';

// Mock wallet data
const String mockUserName = 'Nguyễn Văn A';
const String mockUserAvatar = 'images/home/avatar.png';
const int mockBalance = 200000;

const BankAccount mockBankAccount = BankAccount(
  bankName: 'BIDV',
  accountNumber: '****4321',
  expiryDate: '05/2025',
);

final List<Transaction> mockTransactions = [
  Transaction(
    description: 'Dọn nhà',
    date: DateTime(2021, 5, 12),
    amount: 100000,
    isDebit: true,
  ),
  Transaction(
    description: 'Dọn nhà',
    date: DateTime(2021, 5, 12),
    amount: 100000,
    isDebit: true,
  ),
  Transaction(
    description: 'Dọn nhà',
    date: DateTime(2021, 5, 12),
    amount: 100000,
    isDebit: true,
  ),
  Transaction(
    description: 'Dọn nhà',
    date: DateTime(2021, 5, 12),
    amount: 100000,
    isDebit: true,
  ),
  Transaction(
    description: 'Dọn nhà',
    date: DateTime(2021, 5, 12),
    amount: 100000,
    isDebit: true,
  ),
];

// Financial summary data
const int mockIncome = 3000000; // 3 tr
const int mockExpenses = 1000000; // 1 tr

// Monthly chart data
final List<MonthlyData> mockMonthlyData = [
  const MonthlyData(month: 'JAN', value: 350),
  const MonthlyData(month: 'FEB', value: 480),
  const MonthlyData(month: 'MAR', value: 250),
  const MonthlyData(month: 'APR', value: 300),
  const MonthlyData(month: 'MAY', value: 550),
  const MonthlyData(month: 'JUN', value: 300),
];

