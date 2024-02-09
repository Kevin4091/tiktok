import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tiktok/authentication/registration_screen.dart';
import 'package:tiktok/widgets/input_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgressBar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Image.asset(
              "images/tiktok.png",
              width: 200,
            ),
            Text(
              "Welcome",
              style: GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Glad to see you!!",
              style: GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: InputTextWidget(
                textEditingController: emailTextEditingController,
                labelString: "Email",
                iconData: Icons.email_outlined,
                isObsure: false,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: InputTextWidget(
                  textEditingController: passwordTextEditingController,
                  labelString: "Password",
                  iconData: Icons.lock_outline,
                  isObsure: true),
            ),
            showProgressBar == false
                ? Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            showProgressBar = true;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 38,
                          height: 54,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an Account?",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(const RegistrationScreen());
                            },
                            child: const Text(
                              "Sign Up Now",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                : Container(
                    child: const SimpleCircularProgressBar(
                      progressColors: [
                        Colors.green,
                        Colors.blueAccent,
                        Colors.redAccent,
                        Colors.amber,
                        Colors.purpleAccent,
                      ],
                      animationDuration: 3,
                      backColor: Colors.white,
                    ),
                  ),
          ],
        ),
      ),
    ));
  }
}
