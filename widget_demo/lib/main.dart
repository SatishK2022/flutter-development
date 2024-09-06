import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginScreen(),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/welcome": (context) => WelcomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(31, 255, 0, 0),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                        height: 250, child: Image.asset("assets/bg.png")),
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      child: const Text(
                        "Getting Started",
                        style: TextStyle(color: Colors.black),
                      )),
                ]))));
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("LOGIN"),
      //   backgroundColor: const Color.fromRGBO(255, 114, 94, 1),
      //   centerTitle: true,
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white12,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    icon: const Icon(Icons.home)),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                      height: 200,
                      // width: 250,
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
                      Navigator.pushNamed(context, '/welcome');
                    },
                    child: Text("Submit")),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text("Register"))
                    ],
                  ),
                )
                // IconButton(
                //     onPressed: () {
                //       print("Clicked");
                //     },
                //     icon: const Icon(Icons.thumb_up)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("REGISTER"),
      //   backgroundColor: const Color.fromRGBO(255, 114, 94, 1),
      //   centerTitle: true,
      // ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white12,
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      IconButton.filled(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          icon: const Icon(Icons.home)),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SizedBox(
                            height: 200,
                            // width: 250,
                            child: Image.asset("assets/bg.png")),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Username"),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Email",
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Password",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text("Register"),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text("Login"))
                  ],
                )
              ],
            ),
          ))),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orangeAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
                height: 300,
                width: 200,
              ),
              const Text(
                "Welcome to Flutter",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
