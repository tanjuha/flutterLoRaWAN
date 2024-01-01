import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();

  }

  void menuOpen () {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Menu'),
                ),
                body: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (route) => false
                          );
                        },
                        child: const Text('Go to Initial')
                    ),
                  ],
                ),
              );
            }
        )
    );
  }

  @override
  Widget build(BuildContext contexts) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('LoRaWAN'),
        centerTitle: true,
        backgroundColor: Colors.black38,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: menuOpen,
              icon: const Icon(Icons.menu)
          ),
        ],
      ),
      body: const Text("Home"),
    );
  }
}
