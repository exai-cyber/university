import 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}
class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;  // STAN - zmienna, która może się zmieniać

  void incrementCounter() {
    setState(() {  // setState informuje o zmianie
      counter++;
    });

  }
  void decrementCounter() {
    setState(() {  // setState informuje o zmianie
      if(counter>=1){
        counter--;
      }
    });

  }
  void resetCounter() {
    setState(() {  // setState informuje o zmianie
        counter=0;

    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home:Scaffold(
      appBar: AppBar(title: Text('Moja wizytówka')),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius:71,
                    backgroundImage: NetworkImage("https://picsum.photos/110/110"),
                  ),
                  Text(
                    'Jakub Żak',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Cyberbezpieczeństwo',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                    ),

                  ),
                ],
              )
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                    Icons.email,
                  color: Colors.brown,
                  size:50
                ),
                Icon(Icons.phone,
                    color: Colors.orange,
                    size:50),
                Icon(Icons.location_city,
                    color: Colors.blue,
                    size:50),
              ],
            ),
            Text('Odwiedzono już:'),
            Text(
              '$counter',  // wyświetlamy wartość zmiennej
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: incrementCounter,  // wywołujemy funkcję
              child: Text('Odwiedź'),
            ),
            ElevatedButton(
              onPressed: resetCounter,  // wywołujemy funkcję
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green, width: 3),
                ),
                child: Text(
                  'Moje imię: Jakub',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Image.network('https://picsum.photos/300/200?grayscale'),
              Icon(
                Icons.favorite,
                color:Colors.pink,
                size:40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.star),
                  Icon(Icons.favorite),
                  Icon(Icons.thumb_up),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  print('Przycisk został kliknięty!');
                },
                child: Text('Wyświetl wiadomość'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      print('ADD');
                    },
                  )
                  ,
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      print('REMOVE');
                    },
                  )
                  ,
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      print('REFRESH');

                    },
                  )
                  ,

                ],
              )

            ],
          )
          
        ),
      ),
    );
  }
}
