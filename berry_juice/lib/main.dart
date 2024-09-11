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
        "/": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/forgot-password": (context) => const ForgotPasswordScreen(),
        "/verify-otp": (context) => const VerifyOtpScreen(),
        "/reset-password": (context) => const ResetPasswordScreen(),
        "/welcome": (context) => WelcomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/main.jpg", height: 500),
                const Column(
                  children: [
                    Text(
                      "BERRY JUICE",
                      style: TextStyle(
                          fontFamily: "Abril Fatface",
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.orange,
                              offset: Offset(2.5, 2.5),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          "We provide a variety of fresh juices with various flavours. Get fresh juices easily",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.yellow,
                          Colors.orange
                        ], // Gradient colors
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Explore Now",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscured = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset("assets/login-top.png"),
          const Text(
            "Welcome Back",
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Login to your account",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          inputBoxes(),
          rememberMeAndForgotPasswordScreen(),
          loginButton(),
          orSection(),
          socialMediaButtons(),
          dontHaveAccount(),
        ]),
      ),
    );
  }

  Widget inputBoxes() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Enter email or phone",
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black, width: 2.0), // Change the color here
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: passwordController,
            obscureText: _isObscured,
            decoration: InputDecoration(
              labelText: "Password",
              labelStyle: const TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black, width: 2.0), // Change the color here
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured
                      ? Icons.visibility
                      : Icons.visibility_off, // Change icon based on visibility
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured; // Toggle the visibility state
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget rememberMeAndForgotPasswordScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Color(0xFFF79515),
              ),
              SizedBox(width: 8),
              Text(
                "Remember me",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/forgot-password");
              },
              child: const Text(
                "Forgot Password?",
                style: TextStyle(color: Color(0xFFF79515)),
              ))
        ],
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.yellow, Colors.orange]),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/welcome");
            debugPrint(emailController.text);
            debugPrint(passwordController.text);
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "Log In",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget orSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 2,
          width: 150,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.orange],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "OR",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Container(
          height: 2,
          width: 150,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.orange],
            ),
          ),
        ),
      ],
    );
  }

  Widget socialMediaButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/google.png",
              height: 30,
              width: 30,
            ),
            Image.asset(
              "assets/facebook.png",
              height: 30,
              width: 30,
            ),
            Image.asset(
              "assets/apple.png",
              height: 30,
              width: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget dontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/register");
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Color(0xFFF79515)),
          ),
        ),
      ],
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscured = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/register-top.png",
                  fit: BoxFit.cover,
                )),
            const Text(
              "Register",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Create an account",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            inputFields(),
            termsAndConditions(),
            registerButton(),
            orSection(),
            socialMediaButtons(),
            alreadyHaveAccount(),
          ],
        ),
      ),
    );
  }

  Widget inputFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Name",
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black, width: 2.0), // Change the color here
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black, width: 2.0), // Change the color here
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
              labelText: "Phone",
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black, width: 2.0), // Change the color here
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: passwordController,
            obscureText: _isObscured,
            decoration: InputDecoration(
              labelText: "Password",
              labelStyle: const TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black, width: 2.0), // Change the color here
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured
                      ? Icons.visibility
                      : Icons.visibility_off, // Change icon based on visibility
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured; // Toggle the visibility state
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget termsAndConditions() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text("By signing up you agree to our",
                    style: TextStyle(color: Colors.grey)),
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: Colors.transparent,
                  ),
                  child: const Text(
                    "Terms & Conditions",
                    style: TextStyle(
                      color: Color(0xFFF79515),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFF79515),
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text("and", style: TextStyle(color: Colors.grey)),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: Colors.transparent,
                ),
                child: const Text(
                  "Privacy Policy",
                  style: TextStyle(
                    color: Color(0xFFF79515),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFF79515),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget registerButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.yellow, Colors.orange]),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/login");
            debugPrint(nameController.text);
            debugPrint(emailController.text);
            debugPrint(phoneController.text);
            debugPrint(passwordController.text);
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget orSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 2,
          width: 150,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.orange],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "OR",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Container(
          height: 2,
          width: 150,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.orange],
            ),
          ),
        ),
      ],
    );
  }

  Widget socialMediaButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/google.png",
              height: 30,
              width: 30,
            ),
            Image.asset(
              "assets/facebook.png",
              height: 30,
              width: 30,
            ),
            Image.asset(
              "assets/apple.png",
              height: 30,
              width: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget alreadyHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/login");
          },
          child: const Text(
            "Log In",
            style: TextStyle(color: Color(0xFFF79515)),
          ),
        ),
      ],
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child:
                  Image.asset("assets/forgot-pass-top.png", fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Forgot Your Password?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Enter your email",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.47,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2.0), // Change the color here
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            sendCodeButton(),
                          ],
                        ),
                        dontHaveAccount(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget sendCodeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.yellow, Colors.orange]),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/verify-otp");
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "Send Code",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget dontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/register");
          },
          child: const Text(
            "Create Account",
            style: TextStyle(color: Color(0xFFF79515)),
          ),
        ),
      ],
    );
  }
}

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                verifyOtpTop(),
                Image.asset("assets/verify-otp.png"),
                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 30),
                      child: Row(
                        children: [
                          Text(
                            "Verify OTP",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Text(
                            "An 4 digit code has been sent to your email",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                otpInputBox(),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You Should Receive an OTP in ",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "30 Seconds",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFED6400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                verifyButton(),
              ],
            ),
          ),
        ));
  }

  Widget verifyOtpTop() {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 30),
      child: Row(
        children: [
          Material(
            color: const Color.fromARGB(255, 255, 250, 205),
            borderRadius: BorderRadius.circular(100),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Colors.black,
              iconSize: 20,
              highlightColor: Colors.yellowAccent,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 35),
            child: Text(
              "OTP Verification",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget otpInputBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: SizedBox(
              height: 50,
              width: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: SizedBox(
              height: 50,
              width: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: SizedBox(
              height: 50,
              width: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: SizedBox(
              height: 50,
              width: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget verifyButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.yellow, Colors.orange]),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/reset-password");
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "Verify",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/reset-password-top.png",
              fit: BoxFit.cover,
            ),
          ),
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 30),
                child: Row(
                  children: [
                    Text(
                      "Create New Password",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text(
                      "Enter new password",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          resetPassInputBox(),
          resetPassButton(),
        ],
      ),
    );
  }

  Widget resetPassInputBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: Column(
        children: [
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "New Password",
              labelStyle: const TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black, width: 2.0), // Change the color here
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Confirm Password",
              labelStyle: const TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black, width: 2.0), // Change the color here
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget resetPassButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.yellow, Colors.orange]),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/login");
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "Submit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/berry-juice.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(children: [
                Text(
                  "WELCOME TO",
                  style: TextStyle(
                    fontFamily: "Abril Fatface",
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.orange,
                        offset: Offset(2.5, 2.5),
                      ),
                    ],
                  ),
                ),
                Text(
                  "BERRY JUICE",
                  style: TextStyle(
                    fontFamily: "Abril Fatface",
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.orange,
                        offset: Offset(2.5, 2.5),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Freshly squeezed berry juices to refresh your day. Enjoy the taste of nature!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF69515),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
