import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _balance = 12345.67;
  final List<String> _transactions = [
    'Transaction: -\$50.00 on 2024-07-28',
    'Transaction: +\$200.00 on 2024-07-27',
    'Transaction: -\$25.50 on 2024-07-26',
  ];

  void _flashMoney() {
    // Simulate flashing money by adding a large amount to the balance
    // This is a placeholder for the actual "flash" functionality.
    setState(() {
      _balance += 1000000.00;
      _transactions.insert(0, 'Flash Money: +\$1,000,000.00 on ${DateTime.now().toIso8601String().substring(0, 10)}');
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Money Flashed Successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Account Balance',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${_balance.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _flashMoney,
              child: const Text('Flash Money'),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        _transactions[index].contains('+') ? Icons.arrow_downward : Icons.arrow_upward,
                        color: _transactions[index].contains('+') ? Colors.green : Colors.red,
                      ),
                      title: Text(_transactions[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
