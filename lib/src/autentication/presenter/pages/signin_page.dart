import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const ImageIcon(
                        AssetImage('lib\\assets\\icons\\rocket_launch.png'),
                        size: 75,
                      ),
                      const SizedBox(height: 45),
                      Text(
                        'Acesso',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 35),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Usuário',
                        ),
                        validator: (value) {
                          value = value ?? '';
                          if (value.isEmpty) {
                            return 'Campo vazio!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 45),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Senha',
                        ),
                        obscureText: true,
                        validator: (value) {
                          value = value ?? '';
                          if (value.isEmpty) {
                            return 'Campo vazio!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 35),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Esqueci minha senha',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(height: 35),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Modular.to.navigate('/template/home-news/');
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          child: Text(
                            'ACESSAR',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
