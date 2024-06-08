
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/Db.dart';
import 'package:travel_app/HomePage.dart';
import 'package:travel_app/account_page_providers.dart';
import 'package:travel_app/create_account_page.dart';
import 'package:travel_app/functions.dart';
import 'package:travel_app/personProvider.dart';

// ignore: must_be_immutable
 
final logMail = StateProvider<String>((ref) {
  return '';
});


final logPassword = StateProvider<String>((ref) {
  return '';
});

final isCheckLoading = StateProvider<bool>((ref) {
  return false;
});




class LoginPage extends ConsumerWidget {
    LoginPage({super.key});

 

  @override
  Widget build(BuildContext context,WidgetRef ref) {
       
       return PopScope(
        canPop: false,
        onPopInvoked : (didPop){
   // logic
  },
       

    child: ScreenUtilInit(
      designSize: const Size(411.4, 820.6),
      minTextAdapt: false,
      splitScreenMode: false,
      builder: (_, child) {
        return Scaffold(
        
          body: SingleChildScrollView(
            child: Stack(
              children: [Column(
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
                      child:  UserNameForm()),
                  SizedBox(height: 20.h),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.w),
                      child:  PasswordForm()),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.w),
                    child: const MyRowWidget(),
                  ),
                  SizedBox(height: 30.h),
                   LoginButton(),
                  SizedBox(height: 25.h),
                  const CreateAccountButton(),
                ],
              ),
              ref.watch(isCheckLoading) == true
                                ? Padding(
                padding: EdgeInsets.only(top: 400.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 165.w),
                  child: Container(
                    width: double.infinity,
                    height: 60.h,
                   decoration: BoxDecoration(
                      color: Color.fromARGB(98, 7, 128, 227),
                    borderRadius: BorderRadius.circular(14)
                   ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child:  CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                  )
                      ),
                    ),
                  ),
                ),
              ) :SizedBox(),
             
              ] 
            ),
          ),
        );
      },
    )  );
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

        Consumer(
          builder: (context, WidgetRef ref, child) {
            
            ref.read(userNameProvider.notifier).state = "";
            
            ref.read(passwordProvider.notifier).state = "";
            
            ref.read(rpasswordProvider.notifier).state = "";
            
            ref.read(emailProvider.notifier).state = "";

            return child!; });


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

class LoginButton extends ConsumerWidget {
   const LoginButton({
    super.key,
  });
   
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return InkWell(
      onTap: () async {


        if(ref.watch(logMail)=="" || !ref.watch(logMail).contains("@") || !ref.watch(logMail).contains("com")){
          _showConfirmationDialog3(context, "Geçersiz e-mail !");
        }
        else if(ref.watch(logPassword)== ""){
                      _showConfirmationDialog3(context, "Şifre boş bırakılamaz !");

        }
        else{

// Veritabanı ve doğrulama
           ref.read(isCheckLoading.notifier).state = true;
           if(await DataBase.LoginUsersControl(ref,dbUrl, tableName,ref.watch(logMail),ref.watch(logPassword))){
             

//Kullanıcı bilgilerini aktarma
                 //    String gecici = await DataBase.LoginGetUserData(ref, dbUrl, tableName, ref.watch(logMail).toString()) as String;
                   //  ref.read(now_userNameProvider.notifier).state = gecici; 

                     String gecici2 = ref.watch(logMail);
                     ref.read(now_userMailProvider.notifier).state = gecici2;
 ref.read(isCheckLoading.notifier).state = false;
       Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  const HomePage(),
            ));
            ref.read(logMail.notifier).state="";
            ref.read(logPassword.notifier).state="";
           }

           else{
              ref.read(isCheckLoading.notifier).state = false;
              _showConfirmationDialog2(context, "Böyle bir kullanıcı bulunamadı");
            debugPrint("hatalı giriş hesap bulunamadı");
           }


        }


        
        
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
  void _showConfirmationDialog2(BuildContext context, String mesaj) {
        
    showDialog(
  
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: const Text('Hesap bulunamadı'),
          
          actions: <Widget>[
            
            TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Dialog'u kapat
                  },
                  child: const Text('Kapat',style: TextStyle(color: Colors.blue),),
                ),
           
          ],
        );
      },
    );
  }

  void _showConfirmationDialog3(BuildContext context, String mesaj) {
        
    showDialog(
  
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: const Text('Birşeyler ters gitti'),
          
          actions: <Widget>[
            
            Column(
             
              children: [
             
  Row(
    children: [
      Text(mesaj,style: TextStyle(color: Colors.red),), Spacer()
    ],
  ), SizedBox(height: 7.h,),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Dialog'u kapat
                  },
                  child: const Text('Kapat',style: TextStyle(color: Colors.blue),),
                ),
              ],
            ),
            ],)
          
           
          ],
        );
      },
    );
  }
}

class PasswordForm extends ConsumerWidget{
   PasswordForm({
    super.key,
  });
  
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SizedBox(
      height: 50,
      child: TextFormField(
       
        onChanged: (value) {
          ref.read(logPassword.notifier).state = value;
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
              borderSide: const BorderSide(color: Colors.blue, width: 1.5)),
        ),
      ),
    );
  }
}

class UserNameForm extends ConsumerWidget {
 UserNameForm({
    super.key,
  });
  
  
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    
    return SizedBox(
      height: 50,
      child: TextFormField(
        onChanged: (value) {
                    ref.read(logMail.notifier).state = value;

        },
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
    return Text("Seyahat Uygulaması",
        style:  TextStyle(
          fontSize: 30.h,
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
