// Student: Tumusifu Ombe Christophe
// Reg no: 27502
const String regNo = '27502';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by TOC
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by TOC
String formatRwf(int amount) {
  final bool negative = amount < 0;
  final String digits = amount.abs().toString();
  String formatted = '';
  int i = 0;

  while (i < digits.length) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      formatted += ',';
    }
    formatted += digits[i];
    i++;
  }

  return '${negative ? '-' : ''}$formatted RWF';
}

// by TOC
bool isValidPin(String pin) {
  if (pin.length != 5) return false;
  if (pin == '12345') return false;

  int i = 0;
  while (i < pin.length) {
    if (pin[i].compareTo('0') < 0 || pin[i].compareTo('9') > 0) {
      return false;
    }
    i++;
  }

  bool allSame = true;
  i = 1;
  while (i < pin.length) {
    if (pin[i] != pin[0]) {
      allSame = false;
      break;
    }
    i++;
  }
  if (allSame) return false;

  return true;
}

// by TOC
int sendMoney(int balance, int amount) {
  final int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  final int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// by TOC
int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime amount must be from 100 to 50,000 RWF');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  final int newBalance = balance - amount;
  print('Airtime bought: ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// by TOC
void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  print(isValidPin('12345')); // false
  print(isValidPin('77777')); // false
  print(isValidPin('4821'));  // false
  print(isValidPin('48a21')); // false
  print(isValidPin('4821$d')); // true

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  final int amountToSend = (d + 1) * 3000;
  balance = sendMoney(balance, amountToSend);
  balance = sendMoney(balance, amountToSend);
  balance = sendMoney(balance, amountToSend);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  // Additional tests: expected output is written in each comment.
  print(formatRwf(0));        // 0 RWF
  print(formatRwf(1000000));  // 1,000,000 RWF
  print(formatRwf(-5000));    // -5,000 RWF
  print(isValidPin('90817')); // true
  print(isValidPin('55555')); // false
}
