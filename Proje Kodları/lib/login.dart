import 'package:flutter/material.dart';

void main() {
  runApp(const LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextFormField(
          controller: _usernameController,
          decoration: const InputDecoration(labelText: 'Username'),
        ),
        const SizedBox(height: 20.0),
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(labelText: 'Password'),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Burada kullanıcı adı ve şifre doğrulaması yapılabilir
            String username = _usernameController.text;
            String password = _passwordController.text;
            // Örneğin, doğrulama işlemini gerçekleştirmek için bir fonksiyon çağrılabilir
            // authenticate(username, password);
            // Şimdilik basitçe giriş bilgilerini yazdırıyoruz
            print('Username: $username');
            print('Password: $password');
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}