import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewDemo(),
    );
  }
}

class ListViewDemo extends StatelessWidget {
  ListViewDemo({super.key});
  final List<String> items =
      List<String>.generate(20, (index) => "Name ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text(
                "WhatsApp",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  debugPrint("Pressed");
                },
                icon: const Icon(Icons.qr_code_scanner),
                color: Colors.black,
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  debugPrint("Pressed");
                },
                icon: const Icon(Icons.camera_alt_outlined),
                color: Colors.black,
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  debugPrint("Pressed");
                },
                icon: const Icon(Icons.more_vert),
                color: Colors.black,
              )
            ],
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  debugPrint("Tapped on item ${index + 1}");
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 6, bottom: 6, left: 5, right: 5),
                  child: SizedBox(
                      height: 60,
                      // color: Colors.blueAccent.withOpacity(0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[100],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.supervisor_account,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  const Text(
                                    "Satish: Hello, How are you?",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  "Yesterday",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              );
            }));
  }
}
