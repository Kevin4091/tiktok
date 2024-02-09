import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tiktok/authentication/login_screen.dart';
import 'package:tiktok/widgets/input_text_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController usernameTextEditingController = TextEditingController();
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
              Text(
                "Create Account",
                style: GoogleFonts.acme(
                    fontSize: 34,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "to get Started Now!",
                style: GoogleFonts.acme(
                    fontSize: 34,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("images/profile_avatar.jpg"),
                  backgroundColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                    textEditingController: usernameTextEditingController,
                    labelString: "Username",
                    iconData: Icons.person_outlined,
                    isObsure: false),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                    textEditingController: emailTextEditingController,
                    labelString: "Email",
                    iconData: Icons.email_outlined,
                    isObsure: false),
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
                                "Sign Up",
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
                              "Already have an account?",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const LoginScreen());
                              },
                              child: const Text(
                                "Login Now",
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
      ),
    );
  }
}
