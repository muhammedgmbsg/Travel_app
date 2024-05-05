import 'package:flutter/material.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
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
          decoration: InputDecoration(labelText: 'Username'),
        ),
        SizedBox(height: 20.0),
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
        ),
        SizedBox(height: 20.0),
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
          child: Text('Login'),
        ),
      ],
    );
  }
}