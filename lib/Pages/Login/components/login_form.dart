import 'package:flutter/material.dart';

import '../../../const/constant.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  var firstController = TextEditingController();
  String? email = "FullName";
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Text(email!),
          Image.asset(
            "assets/logo/logodhp2.PNG",
            width: 260,
          ),

          Text("Digital Health Platform",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Divider(
            height: MediaQuery.of(context).size.height * 0.08,
            color: Colors.grey[400],
            thickness: 1,
          ),

          TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.length < 4) {
                return 'Enter at least 4 characters';
              } else {
                return null;
              }
            },
            controller: firstController,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (value) => setState(() => email = value!),
            // onSaved: (value) {
            //   setState(() {
            //     email = value!;
            //   });
            // },
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(
                  Icons.person,
                  color: Colors.grey[300],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(
                    Icons.lock,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 0.06,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: defaultPadding),

          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Hero(
            tag: "deneme_btn",
            child: ElevatedButton(
              onPressed: () {
                //final isValid = formKey.currentState!.validate();
                var firstName = firstController.text;

                setState(() {
                  email = firstName;
                });
              },
              child: Text(
                "Deneme".toUpperCase(),
              ),
            ),
          ),

          const SizedBox(height: defaultPadding),
          // AlreadyHaveAnAccountCheck(
          //   press: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return SignUpScreen();
          //         },
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
