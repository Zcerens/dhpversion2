import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  String? username = "";
  String? email = "";
  String? password = "";
  String? password2 = "";
  List<String> userTypes = ['Doctor', 'Trainer', 'Nutritionist'];
  String? selectedUserType = 'Doctor';
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                buildName(),
                SizedBox(height: 15),
                buildSurname(),
                SizedBox(height: 15),
                buildUserType(),
                SizedBox(height: 25),
                buildUsername(),
                SizedBox(height: 25),
                buildEmail(),
                SizedBox(height: 15),
                buildPassword(),
                SizedBox(height: 25),
                buildSubmit(),
                SizedBox(height: 300)
              ],
            )));
  }

  Widget buildName() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Name',
          icon: Icon(Icons.person),
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value!.length < 4) {
            return 'Enter at least 4 characters';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => username = value),
      );

  Widget buildSurname() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Surname',
          icon: Icon(Icons.person),
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value!.length < 4) {
            return 'Enter at least 4 characters';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => username = value),
      );

  Widget buildUsername() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Username',
          icon: Icon(Icons.person),
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value!.length < 4) {
            return 'Enter at least 4 characters';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => username = value),
      );

  Widget buildPassword() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Password',
          icon: Icon(Icons.lock),
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 7) {
            return 'Password must be at least 7 characters long';
          } else {
            return null;
          }
        },
        maxLength: 60,
        onSaved: (value) => setState(() => password = value!),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      );

  Widget buildPassword2() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Password again',
          icon: Icon(Icons.password),
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 7) {
            return 'Password must be at least 7 characters long';
          } else if (value != password) {
            return 'Password cannot be equal';
          } else {
            return null;
          }
        },
        maxLength: 60,
        onSaved: (value) => setState(() => password2 = value!),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      );

  Widget buildEmail() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
          icon: Icon(Icons.mail),
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
          final regExp = RegExp(pattern);

          if (value!.isEmpty) {
            return 'Enter an email';
          } else if (!regExp.hasMatch(value)) {
            return 'Enter a valid email';
          } else {
            return null;
          }
        },
        maxLength: 30,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => setState(() => email = value),
      );

  Widget buildSubmit() => Builder(
        builder: (context) => ElevatedButton(
          onPressed: () {
            final isValid = formKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState!.save();

              final message =
                  'Username: $username \nEmail: $email\nPassword: $password';
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                // width: 50,
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: Text("SUBMIT"),
        ),
      );

  Widget buildUserType() => DropdownButtonFormField<String>(
        validator: (value) {
          if (value == null) {
            return 'Select a User Type';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          labelText: "User Type",
          icon: Icon(Icons.person_pin_circle),

          enabledBorder: OutlineInputBorder(
              //borderSide: BorderSide(color: Colors.blue, width: 2),

              ),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 35, 35, 35), width: 0.4),
          ),
          //filled: true,
          fillColor: Colors.white,
        ),
        value: null,
        items: userTypes
            .map((userType) => DropdownMenuItem<String>(
                value: userType,
                child: Text(userType, style: TextStyle(fontSize: 16))))
            .toList(),
        onChanged: (userType) => setState(() => selectedUserType = userType),
      );
}
