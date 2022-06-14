import 'package:flutter_navigate_pages/listview_navigation.dart';
import 'package:flutter/material.dart';

class NavigatePages extends StatelessWidget {
  const NavigatePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main page'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Go to page 1 (push)'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const PageOne()),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Go to listview (push)'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const ListviewNavigation()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//------------------------------------- page 1
class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Back to main page without data (pop)'),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text('Go to page 2 (push)'),
              onPressed: () async {
                final newValue = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const PageTwo()),
                  ),
                );
                setState(() => value = newValue == null ? 0 : 14);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'value: $value',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//------------------------------------- page 2
class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Page 2'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'to Remove Back Button on Appbar in Flutter using:\nautomaticallyImplyLeading: false',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text(
                'Back to page 1 (pop) with data\nnew value is 14',
                textAlign: TextAlign.center,
              ),
              onPressed: () => Navigator.pop(context, 14),
            ),
            ElevatedButton(
              child: const Text(
                "Go to page 3 (push) and send values",
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) =>
                        const PageThree(myName: 'Hossein', age: 39)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//------------------------------------- page 3
class PageThree extends StatelessWidget {
  const PageThree({
    Key? key,
    required this.myName,
    required this.age,
  }) : super(key: key);

  final String myName;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(
                'Go to page 4 (push)\nsend data to StatefulWidget',
                textAlign: TextAlign.center,
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => FourPage(value: '✌️')),
              ),
            ),
            Text(
              "Page get value\n$myName age is $age",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//------------------------------------- page 4
class FourPage extends StatefulWidget {
  const FourPage({Key? key, required this.value}) : super(key: key);
  final String value;
  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 4'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Back to Home (pop all)'),
              onPressed: () =>
                  Navigator.of(context).popUntil((route) => route.isFirst),
            ),
            Text(
              "Received data: ${widget.value}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
