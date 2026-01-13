import "package:flutter/material.dart";

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    // final String? UName;
    // final String? Email;
    // final String? password;
    // final String? CPassword;
    // final String? Mob;
    // final String? Gender;
    // final String? address;
    // final int? age;

    final uname = TextEditingController(); // username
    final upass = TextEditingController(); // user password
    final cpass = TextEditingController(); // user confirm password
    final mob = TextEditingController(); // user mobile no
    final umail = TextEditingController(); // user email
    final addrs = TextEditingController(); // user address
    final Gender = TextEditingController(); // user gender
    final age = TextEditingController(); // user age

    return Scaffold(
      body: const Text("Hello!");
    );
  }
}
