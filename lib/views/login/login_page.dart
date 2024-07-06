import 'package:animal/controller/userController.dart';
import 'package:animal/routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserNameController userNameController =
        Provider.of<UserNameController>(context);

    String name = '';
    String password = '';

    final formKeys = GlobalKey<FormState>();

    return Scaffold(
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
            key: formKeys,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter Username',
                    icon: Icon(
                      Icons.supervised_user_circle,
                    ),
                  ),
                  onSaved: (val) {
                    name = val ?? '';
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    icon: Icon(
                      Icons.password,
                    ),
                  ),
                  obscureText: true,
                  onSaved: (val) {
                    password = val ?? '';
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKeys.currentState!.validate()) {
                      formKeys.currentState!.save();
                      if (name == userNameController.userName &&
                          password == userNameController.userPassword) {
                        Navigator.pushNamed(context, AppRoutes.Home);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Login Successful',
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
