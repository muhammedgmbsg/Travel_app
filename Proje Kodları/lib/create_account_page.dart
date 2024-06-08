
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:travel_app/Db.dart';
import 'package:travel_app/HomePage.dart';
import 'package:travel_app/account_page_providers.dart';
import 'package:travel_app/functions.dart';
import 'package:travel_app/login_page.dart';
import 'package:travel_app/personProvider.dart';


final isCheckLoadingSingUp = StateProvider<bool>((ref) {
  return false;
});
final GoString = StateProvider<bool>((ref) {
  return false;
});


class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(411.4, 820.6),
      minTextAdapt: false,
      splitScreenMode: false,
      builder: (context, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [ Column(
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
                        padding:  EdgeInsets.only(left: 240.w,top:80.h),
                        
                          child: ClipOval(
                            child: Container(
              
                              width: 160.w,
                              height: 150.h,
                             decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(255, 73, 72, 72)),
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 5, 85, 204).withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                          )
                        ]
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
                    child:  UsernameFormRegister(),
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child:  MailFormRegister(),
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: PasswordFormRegister(),
                  ),
                  SizedBox(height: 5 .h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child:  RePasswordFormRegister(),
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
              ref.watch(isCheckLoadingSingUp) == true
                                ? Padding(
                padding: EdgeInsets.only(top: 400.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 165.w),
                  child: Container(
                    width: double.infinity,
                    height: 60.h,
                   decoration: BoxDecoration(
                      color: const Color.fromARGB(98, 7, 128, 227),
                    borderRadius: BorderRadius.circular(14)
                   ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child:  CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                  )
                      ),
                    ),
                  ),
                ),
              ) :const SizedBox(),]
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
   PasswordFormRegister({
    super.key,
  });
  final GlobalKey<FormFieldState<String>> pwKey = GlobalKey<FormFieldState<String>>();

   @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 70,
      child: Form(
        key: pwKey,
        child: TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
          ],
          enableInteractiveSelection: false,
          validator: (value) {
            if (value!.isEmpty) {
              
              return 'Bu alan boş bıraklamaz';
            }
            if (value.length < 6 ) {
                            debugPrint("hata 2");

              return 'Şifreniz uyuşmuyor';
            }

            return null;
          },
          onChanged: (value) {
            ref.read(passwordProvider.notifier).state = value;
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
   RePasswordFormRegister({
    super.key,
  });
  final GlobalKey<FormFieldState<String>> rpwKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 70,
      child: Form(
        key: rpwKey,
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
          onChanged: (value) {
            ref.read(rpasswordProvider.notifier).state = value;
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
  UsernameFormRegister({
    super.key,
  });
  final GlobalKey<FormFieldState<String>> userKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 70,
      child: Form(
        key: userKey,
        child: TextFormField(
          enableInteractiveSelection: false,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Bu alan boş bırakılamaz';
            } else if (value.length < 6) {
              return 'En az 6 karakter giriniz';
            } 
          },
          onChanged: (value) {
            ref.read(userNameProvider.notifier).state = value!;
            
          },
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
          ],
          decoration: InputDecoration(
            hintText: "Kullanıcı adı",
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
   MailFormRegister({
    super.key,
  });
  final GlobalKey<FormFieldState<String>> mailKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 70,
      child: Form(
        key: mailKey,
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
          onChanged: (value) {
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
      onTap: () async {
        
       if(ref.watch(userNameProvider) != "" && ref.watch(emailProvider) !="" && ref.watch(passwordProvider) != "" && ref.watch(rpasswordProvider)!="" && 
       ref.watch(passwordProvider)==ref.watch(rpasswordProvider)){
        
          ref.read(isCheckLoadingSingUp.notifier).state = true;
                

        if(await DataBase.SingUpUsersControl(dbUrl, tableName, ref.watch(emailProvider))){
      debugPrint("e posta daha önce kullanılmıs");
             

                ref.read(isCheckLoadingSingUp.notifier).state = false;
                       


       _showConfirmationDialog2(context, "Bu e posta kullanılmış");
        }

        else{        

       
         debugPrint(  ref.watch(userNameProvider));

        _showVerificationDialog(context, ref);
         
           ref.read(isCheckLoadingSingUp.notifier).state =false;

        }

     
       }
       else{
                        ref.read(isCheckLoadingSingUp.notifier).state = false;

               if(ref.watch(userNameProvider)==""){
                _showConfirmationDialog(context,"Kullanıcı adı boş bırakılamaz !");
               }
               else if( !ref.watch(emailProvider).contains("@") || !ref.watch(emailProvider).contains(".com")){
                                _showConfirmationDialog(context,"Geçerli bir e posta adresi girin !");

               }
               else if(ref.watch(passwordProvider).length < 6){
                _showConfirmationDialog(context, "Şifre en az 6 haneli olmalıdır !");
               }
               else if(ref.watch(passwordProvider) != ref.watch(rpasswordProvider)){
                _showConfirmationDialog(context, "Şifreler uyuşmuyor !");
               }
       }
       
      ref.watch(userNameProvider);


       
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

 Future<void> sendEmail(String eposta,String onaykod) async {
    try {
      String username =
          'scream.muhammedfethi@gmail.com'; // Gmail e-posta adresiniz
      String password = 'sztl mntz pwfe xkmo'; // Gmail şifreniz

      // E-posta içeriği
      var message = Message();
      message.from = Address(username.toString());
      message.recipients.add('$eposta'); // Alıcı e-posta adresi
      message.subject = 'Seyahat Uygulaması Onay Kodu  Doğrulaması';
      message.text = 'Onay kodunuz: $onaykod';

      var smtpServer = gmail(username, password);
      send(message, smtpServer);
      debugPrint('E-posta gönderildi.');
    } catch (e) {
      debugPrint('${e.toString()}');
    }
  }
  Future<void> _showVerificationDialog(BuildContext context,WidgetRef ref) async {
    TextEditingController _codeController = TextEditingController();
    String random = generateVerificationCode();
    sendEmail(ref.watch(emailProvider), random);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Dialog dışına tıklayınca kapanmaması için
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Doğrulama Kodu'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Lütfen e-posta adresinize gönderilen doğrulama kodunu girin:'),
                TextField(
                  
                  controller: _codeController,
                  decoration: const InputDecoration(hintText: 'Doğrulama Kodu',
                        enabledBorder: UnderlineInputBorder(
      
      borderSide: const BorderSide(color: Colors.black), 
    ),
              focusedBorder: UnderlineInputBorder(
      
      borderSide: const BorderSide(color: Colors.black), 
    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            
            TextButton(
              child: const Text('İptal',style: TextStyle(color: Colors.blue),),
              onPressed: () {
                                 
            ref.read(userNameProvider.notifier).state = "";
            
            ref.read(passwordProvider.notifier).state = "";
            
            ref.read(rpasswordProvider.notifier).state = "";
            
            ref.read(emailProvider.notifier).state = "";

                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Doğrula",style: TextStyle(color: Colors.blue)),
              onPressed: () async {
                                 
            


                if(_codeController.text == random){
                  ref.read(GoString.notifier).state = true;
                 ref.read(isCheckLoadingSingUp.notifier).state = false;
                 

                 await DataBase.CreateAccount(ref.watch(userNameProvider), ref.watch(emailProvider), ref.watch(passwordProvider));
                 Navigator.of(context).pop();
                  //Kullanıcı bilgileri
                     String gecici = ref.watch(userNameProvider);
                     ref.read(now_userNameProvider.notifier).state = gecici; 

                     String gecici2 = ref.watch(emailProvider);
                     ref.read(now_userMailProvider.notifier).state = gecici2;
                     

                     debugPrint(ref.watch(userNameProvider));
                     debugPrint("now:"+ ref.watch(now_userNameProvider));

                  _showConfirmationDialog3(context,ref);
                 
                
                  
                  debugPrint("kayıt basarılı"); 

                } else{
                  ref.read(isCheckLoadingSingUp.notifier).state = true;
                   Navigator.of(context).pop();
                  _showConfirmationDialog2(context, "Doğrulama kodu eşleşmiyor !");
ref.read(isCheckLoadingSingUp.notifier).state = false;
       
           ref.read(userNameProvider.notifier).state = "";
            
            ref.read(passwordProvider.notifier).state = "";
            
            ref.read(rpasswordProvider.notifier).state = "";
            
            ref.read(emailProvider.notifier).state = "";
                }
           /* ref.read(isCheckLoadingSingUp.notifier).state = false;
       
           ref.read(userNameProvider.notifier).state = "";
            
            ref.read(passwordProvider.notifier).state = "";
            
            ref.read(rpasswordProvider.notifier).state = "";
            
            ref.read(emailProvider.notifier).state = "";*/

              },
            ),
          ],
        );
      },
    );
  }
String generateVerificationCode() {
  Random random = Random();
  int verificationCode = random.nextInt(900000) + 100000; // 100000 ile 999999 arasında bir sayı üretir
  return verificationCode.toString();
}

      void _showConfirmationDialog(BuildContext context, String mesaj) {
        
    showDialog(
  
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: const Text('Hatalı Deneme'),
          
          actions: <Widget>[
            
            Column(
             
              children: [
             
  Row(
    children: [
      Text(mesaj,style: const TextStyle(color: Colors.red),), const Spacer()
    ],
  ), SizedBox(height: 7.h,),
            Row(
              children: [
                const Spacer(),
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

  void _showConfirmationDialog2(BuildContext context, String mesaj) {
        
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
      Text(mesaj,style: const TextStyle(color: Colors.red),), const Spacer()
    ],
  ), SizedBox(height: 7.h,),
            Row(
              children: [
                const Spacer(),
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
  void _showConfirmationDialog3(BuildContext context,WidgetRef ref) {
        
    showDialog(
  
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: const Text('Kayıt başarılı'),
          
          actions: <Widget>[
         TextButton(
                  onPressed: () {
                      
                    Navigator.of(context).pop(); // Dialog'u kapat
                     

                     
                      ref.read(isCheckLoadingSingUp.notifier).state = false;
       
           ref.read(userNameProvider.notifier).state = "";
            
            ref.read(passwordProvider.notifier).state = "";
            
            ref.read(rpasswordProvider.notifier).state = "";
            
            ref.read(emailProvider.notifier).state = "";

                    Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  const HomePage(),
            ));
                  },
                  child: const Text('Devam',style: TextStyle(color: Colors.blue),),
                ),
           
          ],
        );
      },
    );
  }
}
