import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidgetDemo(),
    );
  }
}

class MyWidgetDemo extends StatefulWidget {
  const MyWidgetDemo({super.key});

  @override
  State<MyWidgetDemo> createState() => _MyWidgetDemoState();
}

class _MyWidgetDemoState extends State<MyWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN"),
        backgroundColor: const Color.fromRGBO(255, 114, 94, 1),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white12,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                    height: 250,
                    width: 250,
                    child: Image.asset("assets/bg.png")),
              ),

              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  // const Text("Username"),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Username"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  // const Text("Password"),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      obscureText: true,
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Password"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // const Icon(Icons.summarize),
              // TextButton(
              //     onPressed: () {
              //       print("Clicked");
              //     },
              //     child: const Text("Submit")),
              OutlinedButton(
                  onPressed: () {
                    print("Button is pressed");
                  },
                  child: const Text("Submit")),
              // IconButton(
              //     onPressed: () {
              //       print("Clicked");
              //     },
              //     icon: const Icon(Icons.thumb_up)),
            ],
          ),
        ),
      ),
    );
  }
}
