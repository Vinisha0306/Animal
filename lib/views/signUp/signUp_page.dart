import 'package:animal/controller/userController.dart';
import 'package:animal/routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final formKey = GlobalKey<FormState>();

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserNameController userNameController =
        Provider.of<UserNameController>(context);
    String password = '';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/singUpBg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                TextFormField(
                  onSaved: (val) {
                    userNameController.userName = val ?? 'userName';
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.supervised_user_circle),
                    labelText: 'Username',
                    hintText: 'Enter Your userName',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onSaved: (val) {
                    password = val ?? "";
                  },
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    icon: Icon(
                      Icons.password_outlined,
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onSaved: (val) {
                    if (password == val) {
                      userNameController.userPassword = val ?? "";
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Enter Confirm Password',
                    icon: Icon(
                      Icons.done,
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Sign Up Successful',
                          ),
                        ),
                      );
                      userNameController.userNameF();
                      Navigator.pushNamed(context, AppRoutes.login);
                    }
                  },
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  child: const Text(
                    'Already Account : Login',
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
