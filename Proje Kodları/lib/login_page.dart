
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/HomePage.dart';
import 'package:travel_app/account_page_providers.dart';
import 'package:travel_app/create_account_page.dart';
import 'package:travel_app/functions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.4, 820.6),
      minTextAdapt: false,
      splitScreenMode: false,
      builder: (_, child) {
        return Scaffold(
        
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 120.w),
                  child: Container(
                    
                    width: double.infinity,
                    height: 250.h,
                    decoration: const BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(90))
                    
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30,top: 30),
                      child: Center(child: Container(
                        
                        width: 135.w,height: 135.h,decoration: const BoxDecoration(color: Colors.blue,
                        shape: BoxShape.circle
                        
                        ,  boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                //    offset: Offset(1, 1),
                  ),
                ],
                        ),
                        child: ClipOval(
                    
                          child: Image.asset(
                            'images/log2.png',
                             width: 500,
                             height: 500.h,
                             fit: BoxFit.cover,
                          
                          ),
                        )
                        ,),),
                    ),
                   ),
                ),
                
                SizedBox(height: 50.h),
                const ThemeText(),
                SizedBox(height: 50.h),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.w),
                    child: const UserNameForm()),
                SizedBox(height: 20.h),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.w),
                    child: const PasswordForm()),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  child: const MyRowWidget(),
                ),
                SizedBox(height: 30.h),
                const LoginButton(),
                SizedBox(height: 25.h),
                const CreateAccountButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyRowWidget extends StatelessWidget {
  const MyRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const CheckBox(),
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(
            "Beni Hatırla",
            style:  TextStyle(
              fontSize: 14.h,
            )),
          
        )
      ],
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterPage(),
            ));
      },
      child: Text(
        "Hesabın yok mu ?",
        style: TextStyle(
          fontSize: 13.h,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          color: Colors.blue,
        )),
      
    );
  }
}

class CheckBox extends ConsumerWidget {
  const CheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Checkbox(
      activeColor: Colors.blue,
      value: ref.watch(isChecking),
      onChanged: (value) {
        ref.read(isChecking.notifier).state = value!;
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Veritabanı ve doğrulama
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  const HomePage(),
            ));
      },
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(30)),
        child: const Center(
          child: Text(
            "Giriş Yap",
            style:  TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
          ),
        ),
    
    );
  }
}

class PasswordForm extends StatelessWidget {
  const PasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Şifre",
          hintStyle: fonts,
          isCollapsed: false,
          contentPadding: const EdgeInsets.only(left: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.blue, width: 1.5)),
        ),
      ),
    );
  }
}

class UserNameForm extends StatelessWidget {
  const UserNameForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Email",
          hintStyle: fonts,
          isCollapsed: false,
          contentPadding: const EdgeInsets.only(left: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.blue, width: 1.5)),
        ),
      ),
    );
  }
}

class ThemeText extends StatelessWidget {
  const ThemeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Seyahat App",
        style:  TextStyle(
          fontSize: 40.h,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ));
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(color: appBarColor),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h),
            /* child: Text("RentEasy",
                style: GoogleFonts.berkshireSwash(
                    textStyle: TextStyle(
                  fontSize: 40.h,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ))), */
          ),
        ));
  }
}
