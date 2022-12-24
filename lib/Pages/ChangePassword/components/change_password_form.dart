import 'package:flutter/material.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final formKey = GlobalKey<FormState>();

  String? oldpassword = "";
  String? newpassword1 = "";
  String? newpassword2 = "";
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
                buildOldPassword(),
                SizedBox(height: 25),
                buildNewPassword(),
                SizedBox(height: 25),
                buildNewPassword2(),
                SizedBox(height: 25),
                buildSubmit(),
                SizedBox(height: 300)
              ],
            )));
  }

  Widget buildOldPassword() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Old Password',
          icon: Icon(Icons.lock),
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 7) {
            //backendden gelen eski parolayla karşılaştırılacak
            return 'Password must be at least 7 characters long';
          } else {
            return null;
          }
        },
        maxLength: 60,
        onSaved: (value) => setState(() => oldpassword = value!),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      );
  Widget buildNewPassword() => TextFormField(
        decoration: InputDecoration(
          labelText: 'New Password',
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
        onSaved: (value) => setState(() => newpassword1 = value!),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      );

  Widget buildNewPassword2() => TextFormField(
        decoration: InputDecoration(
          labelText: 'New Password again',
          icon: Icon(Icons.lock),
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 7) {
            return 'Password must be at least 7 characters long';
          } else if (value != newpassword2) {
            return 'Password cannot be equal';
          } else {
            return null;
          }
        },
        maxLength: 60,
        onSaved: (value) => setState(() => newpassword2 = value!),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      );

  Widget buildSubmit() => Builder(
        builder: (context) => ElevatedButton(
          onPressed: () {
            final isValid = formKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState!.save();

              final message = 'Şifre değiştirildi \n Password: $newpassword1';
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
}
