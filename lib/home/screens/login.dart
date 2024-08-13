  // ignore_for_file: use_build_context_synchronously

  import 'package:flutter/material.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'package:iconsax/iconsax.dart';
import 'package:rafi/home/api/auth_service.dart';
  import 'package:rafi/home/widgets/button.dart';
  import 'package:rafi/home/widgets/text_field.dart';
  class SignIn extends StatelessWidget {

    final TextEditingController _emailController = TextEditingController();

    final TextEditingController _passwordController = TextEditingController();
    final void Function()? onTap;
    SignIn({super.key, this.onTap});

    void login(BuildContext context)async{
      final authService = AuthService();

      try{
        await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
      }
      catch(e){
        showDialog(context: context, builder: ((context)=> AlertDialog(title: Text(e.toString()),)));
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                    left: 230,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100,
                        shape: BoxShape.circle,
                      ),
                    )
                ),
                Positioned(
                  top: 10,
                    left: 270,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100,
                        shape: BoxShape.circle,
                      ),
                    )
                ),
                Positioned(
                    bottom: 100,
                    right: 280,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        shape: BoxShape.circle,
                      ),
                    )
                ),
                Positioned(
                    bottom: 100,
                    right: 320,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        shape: BoxShape.circle,
                      ),
                    )
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sign In',style: GoogleFonts.quicksand(fontSize:20,fontWeight:FontWeight.bold),),
                        const SizedBox(height: 5,),
                        Text('Kindly Sign In to continue',style: GoogleFonts.quicksand(fontSize:16,fontWeight:FontWeight.w300),),
                        const SizedBox(),
                        PutTextField(controller: _emailController,obscureText:false,text: 'Email',icon: const Icon(Iconsax.message),),
                        const SizedBox(height: 10,),
                        PutTextField(controller: _passwordController,obscureText:true,text: 'Password',icon: const Icon(Iconsax.lock),),
                        const SizedBox(height: 25,),
                        ButtonE(text: 'SIGN IN',onPressed: ()=>login(context),),
                        const SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Not a member?'),
                            const SizedBox(width: 2,),
                            TextButton(onPressed: onTap, child: const Text('Sign Up',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold),))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      );
    }
  }
