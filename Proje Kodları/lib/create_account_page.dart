
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/account_page_providers.dart';
import 'package:travel_app/functions.dart';
import 'package:travel_app/login_page.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.4, 820.6),
      minTextAdapt: false,
      splitScreenMode: false,
      builder: (context, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
              Stack(
                children: [

                   Container(
                   width: double.infinity,
                  height: 170.h,
                  decoration: const BoxDecoration(
                    
                   
                    color: Colors.blue,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150))),
                   child: Padding(
                     padding: EdgeInsets.only(top: 10.h),
                     child: const ClipOval(
                      
                      
                     ),
                   ),),
                    Padding(
                      padding:  EdgeInsets.only(left: 240.w,top: 110.h),
                      
                        child: ClipOval(
                          child: Container(
                            width: 300,
                            height: 100.h,
                            decoration: const BoxDecoration(
                
                            
                            ),
                            child: Image.asset(
                                          'images/img3.png',
                                           
                                           fit: BoxFit.cover,
                                        
                                        ),
                          ),
                        ),
                      
                    ),
                     Padding(
                  padding: EdgeInsets.only(top: 200.h, left: 30.w),
                  
                  child: const BackPageButton(),
                ),
                ],
              
              ),
          
                
               
                SizedBox(height: 15.h),
                const Center(
                  child: RegisterThemeText(),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: const UsernameFormRegister(),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: const MailFormRegister(),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: const PasswordForm(),
                ),
                SizedBox(height: 20 .h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: const RePasswordFormRegister(),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: 60.w,),
                  child: Text(
                          "Hüküm ve Koşullar",
                          style: TextStyle(
                            fontSize: 13.h,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            color: Colors.blue,
                          )),
                ),
                SizedBox(height: 25.h,),
                const Center(child: CreateButton()),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RegisterThemeText extends StatelessWidget {
  const RegisterThemeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Seyahat App",
        style: 
             TextStyle(
          fontSize: 40.h,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ));
  }
}

class BackPageButton extends StatelessWidget {
  const BackPageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: appBarColor),
        ),
        child: Icon(
          Icons.arrow_back_sharp,
          color: appBarColor,
        ),
      ),
    );
  }
}

class PasswordFormRegister extends ConsumerWidget {
  const PasswordFormRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 70,
      child: Form(
        key: ref.watch(pwKey),
        child: TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
          ],
          enableInteractiveSelection: false,
          validator: (value) {
            value = "";
            if (ref.watch(pwKey).currentState == null) {
              return "Null";
            }
            if (value.isEmpty) {
              return 'Bu alan boş bırakılamaz';
            } else if (value.length < 6) {
              return 'En az 6 karakter giriniz';
            } else {
              return null;
            }
          },
          onSaved: (value) {
            ref.read(userNameProvider.notifier).state = value!;
          },
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
                borderSide: BorderSide(color: appBarColor, width: 1.5)),
          ),
        ),
      ),
    );
  }
}

class RePasswordFormRegister extends ConsumerWidget {
  const RePasswordFormRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 70,
      child: Form(
        key: ref.watch(rpwKey),
        child: TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
          ],
          enableInteractiveSelection: false,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Bu alan boş bıraklamaz';
            }
            if (value != ref.watch(passwordProvider)) {
              return 'Şifreniz uyuşmuyor';
            }

            return null;
          },
          onSaved: (value) {
            ref.read(rpasswordProvider.notifier).state = value!;
          },
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Şifrenizi Doğrulayın",
            hintStyle: fonts,
            isCollapsed: false,
            contentPadding: const EdgeInsets.only(left: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: appBarColor, width: 1.5)),
          ),
        ),
      ),
    );
  }
}

class UsernameFormRegister extends ConsumerWidget {
  const UsernameFormRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 70,
      child: Form(
        key: ref.watch(userKey),
        child: TextFormField(
          enableInteractiveSelection: false,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Bu alan boş bırakılamaz';
            } else if (value.length < 6) {
              return 'En az 6 karakter giriniz';
            } else {
              return null;
            }
          },
          onSaved: (value) {
            ref.read(userNameProvider.notifier).state = value!;
          },
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
          ],
          decoration: InputDecoration(
            hintText: "Ad-Soyad",
            hintStyle: fonts,
            isCollapsed: false,
            contentPadding: const EdgeInsets.only(left: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: appBarColor, width: 1.5)),
          ),
        ),
      ),
    );
  }
}

class MailFormRegister extends ConsumerWidget {
  const MailFormRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 70,
      child: Form(
        key: ref.watch(mailKey),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Bu alan boş bırakılamaz';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Geçerli bir mail giriniz';
            }
            return null;
          },
          onSaved: (value) {
            ref.read(emailProvider.notifier).state = value!;
          },
          keyboardType: TextInputType.emailAddress,
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
                borderSide: BorderSide(color: appBarColor, width: 1.5)),
          ),
        ),
      ),
    );
  }
}

class CreateButton extends ConsumerWidget {
  const CreateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        if (ref.watch(userKey).currentState!.validate() &&
            ref.watch(mailKey).currentState!.validate() &&
            ref.watch(pwKey).currentState!.validate() &&
            ref.watch(rpwKey).currentState!.validate()) {}
      },
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: appBarColor, borderRadius: BorderRadius.circular(30)),
        child: const Center(
          child: Text(
            "Kayıt Ol",
            style:  TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
          
        ),
      ),
    );
  }
}
