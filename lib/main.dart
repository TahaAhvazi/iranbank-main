import 'package:chat/package.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Test());
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  BankType bankType = BankType.melat;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(221, 173, 144, 144),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IranBanks(
                height: 200,
                width: 300,
                usernameAndFamily: "طاها اهوازی",
                expCartMonth: "06",
                expCartYear: "05",
                shabbaNumber: "23456756736754747846",
                cvv2: "6118",
                cartNumber: 123456789101112,
                shomarehHesab: "123445678452",
                banktype: bankType,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.meli;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/melilogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.ayandeh;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/ayandehlogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.sepah;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/sepahlogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.keshavarzi;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/keshavarzilogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.maskan;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/maskanlogo.png"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.sanatvamadan;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/sanatvamadanlogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.saderat;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/saderatlogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.taavon;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/taavonlogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.postbank;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/postbanklogo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bankType = BankType.refah;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.white,
                      child: Image.asset("assets/refahlogo.png"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
