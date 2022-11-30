import 'package:pr2/data/repositories/auth_repository_impl.dart';
import 'package:pr2/domain/usercases/auth.dart';
import 'package:pr2/presentation/widgets/custom_button.dart';
import 'package:pr2/presentation/widgets/text_field_obscure.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _key = GlobalKey();

  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;
  final regex = RegExp(r'^[a-zA-Z0-9@.*%]+$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Color(0xFF98FB98),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Регистрация',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                const SizedBox(height: 50),
                SizedBox(
                  height: 90,
                  width: 500,
                  child: TextFormField(
                    maxLength: 16,
                    controller: _loginController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Поле логин пустое';
                      }
                      if (value.length < 3) {
                        return 'Логин должен быть не менее 3 символов';
                      }
                      if (!regex.hasMatch(value)) {
                        return 'Логин должен содержать буквы латинского алфавита, цифры и символы @.*%';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'Логин',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 90,
                  width: 500,
                  child: TextFormField(
                    maxLength: 20,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Поле пароль пустое';
                      }
                      if (value.length < 8) {
                        return 'Пароль должен быть длинной 8 символов';
                      }
                      if (!regex.hasMatch(value)) {
                        return 'Пароль должен содержать буквы латинского алфавита, цифры и символы @.*%';
                      } else {
                        return null;
                      }
                    },
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      hintText: 'Пароль',
                      suffixIcon: TextFieldObscure(isObscure: (value) {
                        setState(() {
                          isObscure = value;
                        });
                      }),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      signUp();
                    } else {}
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(225.0, 65.0)),
                  child: const Text(
                    'Зарегистрироваться',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const Spacer(flex: 3),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      _loginController.clear();
                      _passwordController.clear();
                      _key.currentState!.validate();
                      Navigator.pushNamed(context, 'sign_in');
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(210.0, 45.0)),
                    child: const Text(
                      'Назад',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void signUp() async {
    final AuthRepositoryImlp auth = AuthRepositoryImlp();

    var result = await Auth(auth).signUp(AuthParams(
      login: _loginController.text,
      password: _passwordController.text,
    ));

    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l.errorMessage),
        ),
      );
    }, (r) {
      Navigator.pushNamed(context, 'admin');
    });
  }
}
