// Student: Tumusifu Ombe Christophe
// Reg no: 27502
const String regNo = '27502';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));


// by TOC
int countVowels(String text) {
  final String lowerText = text.toLowerCase();
  int count = 0;
  int i = 0;
  while (i < lowerText.length) {
    if ('aeiou'.contains(lowerText[i])) {
      count++;
    }
    i++;
  }
  return count;
}

// by TOC
String initials(String fullName) {
  final String cleaned = fullName.trim();
  if (cleaned.isEmpty) return '';

  final List<String> names = cleaned.split(RegExp(r'\s+'));
  String result = '';
  int i = 0;
  while (i < names.length) {
    if (names[i].isNotEmpty) {
      result += '${names[i][0].toUpperCase()}.';
    }
    i++;
  }
  return result;
}

// by TOC
void drawTriangle(int height) {
  int row = 1;
  while (row <= height) {
    int spaces = height - row;
    String line = '';
    while (spaces > 0) {
      line += ' ';
      spaces--;
    }

    int column = 1;
    final String symbol = row.isEven ? '#' : '*';
    while (column <= row) {
      line += symbol;
      column++;
    }
    print(line);
    row++;
  }
}

// by TOC
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by TOC
String maskPhone(String phone) {
  if (phone.length != 10) return 'INVALID';
  return '${phone.substring(0, 3)}*****${phone.substring(8)}';
}

// by TOC
void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // B2
  const String fullName = 'Tumusifu Ombe Christophe';
  print('$fullName has ${countVowels(fullName)} vowels');

  // B3
  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' '));

  // C5
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2
  final String phone = '0788123456';
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    final int amount = i * 4000 + t * 100;
    final int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}
