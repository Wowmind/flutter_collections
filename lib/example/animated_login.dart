import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();

  StateMachineController? controller;
  SMIInput<bool>? isChecking;
  SMIInput<double>? numLook;
  SMIInput<bool>? isHandsUp;

  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  @override
  void initState() {
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    super.initState();
  }

  @override
  void dispose() {
    emailFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
    super.dispose();
  }

  void emailFocus(){
    isChecking?.change(emailFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SizedBox(
        width: size.width,
        child:  Padding(
          padding: const EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               SizedBox(
                  width: 250,
                  height: 250,
                child: RiveAnimation.asset(
                  fit: BoxFit.fitHeight,
                  stateMachines: const ['Login Machine'],
                  onInit: ((artboard){
                    controller = StateMachineController.fromArtboard(artboard, 'Login Machine');
                    if(controller ==null)
                      return;
                    artboard.addController(controller!);
                    isChecking = controller?.findInput('isChecking');
                    isHandsUp = controller?.findInput('isHandsUp');
                    numLook = controller?.findInput('numLook');
                    trigSuccess = controller?.findInput('trigSuccess');
                    trigFail = controller?.findInput('trigFail');
                  }),
                  'assets/img/login.riv'
                ),
                ),
                Container(
                  padding:const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding:const  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          focusNode: emailFocusNode,
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                          onChanged: (value){
                            numLook?.change(value.length.toDouble());
                          },
                        ),
                      ),
                      const SizedBox(height: 10,),

                      Container(
                        padding:const  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          focusNode: passwordFocusNode,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                          onChanged: (value){},
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 60,
                  width: size.width/5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text('Login',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
