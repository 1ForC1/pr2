import 'package:pr2/data/repositories/auth_repository_impl.dart';
import 'package:pr2/domain/entity/role_entity.dart';
import 'package:pr2/domain/usercases/auth.dart';
import 'package:pr2/presentation/widgets/text_field_obscure.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;
  bool _isValid = true;
  final regex = RegExp(r'^[a-zA-Z0-9@.*%]+$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          color: Color(0xFF98FB98),
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(child: SizedBox()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Авторизация',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 90,
                    width: 500,
                    child: TextFormField(
                      controller: _loginController,
                      validator: (value) {
                        if (!_isValid) {
                          return null;
                        }
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
                      maxLength: 16,
                      decoration: const InputDecoration(
                        labelText: 'Логин',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 90,
                    width: 500,
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (!_isValid) {
                          return null;
                        }
                        if (value!.isEmpty) {
                          return 'Поле пароль пустое';
                        }
                        if (value.length < 8) {
                          return 'Пароль должен быть длинной минимум 8 символов';
                        }
                        if (!regex.hasMatch(value)) {
                          return 'Пароль должен содержать буквы латинского алфавита, цифры и символы @.*%';
                        } else {
                          return null;
                        }
                      },
                      maxLength: 20,
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        labelText: 'Пароль',
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
                      _isValid = true;
                      if (_key.currentState!.validate()) {
                        signIn();
                      } else {}
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(225.0, 65.0)),
                    child: const Text(
                      'Войти',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const Expanded(flex: 3, child: SizedBox()),
                  ElevatedButton(
                    onPressed: () {
                      _loginController.clear();
                      _passwordController.clear();
                      _isValid = false;
                      _key.currentState!.validate();
                      Navigator.pushNamed(context, 'sign_up');
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(210.0, 45.0)),
                    child: const Text(
                      'Зарегистрироваться',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    final AuthRepositoryImlp auth = AuthRepositoryImlp();
    var result = await Auth(auth).signIn(AuthParams(
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
      switch (r) {
        case RoleEnum.admin:
          {
            Navigator.pushReplacementNamed(context, 'admin');
            break;
          }
        case RoleEnum.user:
          Navigator.pushNamedAndRemoveUntil(
              context, 'client', (route) => false);
          break;
      }
    });
  }
}
