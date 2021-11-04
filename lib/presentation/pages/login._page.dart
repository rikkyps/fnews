part of 'pages.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OnLoginState) {
          Timer(const Duration(seconds: 1), () {
            context.read<AuthBloc>().add(
                  LoginProcess(_emailController.text, _passwordController.text),
                );
          });
        } else if (state is LoginFailState) {
          _showLoginFailResult(context, state.message!);
        } else if (state is LoginSuccessState) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(
                  height: 70,
                ),
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo2.png'),
                          fit: BoxFit.contain)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Login',
                    style: subHeadingTextStyle.copyWith(
                        fontSize: 18,
                        color: Colors.black45,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Email'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Password'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            context.read<AuthBloc>().add(LoginEvent());
                          },
                          child: (state is OnLoginState)
                              ? const SpinKitFadingCircle(
                                  color: Colors.white, size: 30)
                              : Text(
                                  'Login',
                                  style: subHeadingTextStyle.copyWith(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'Or',
                    style: subHeadingTextStyle.copyWith(
                        fontSize: 18,
                        color: Colors.black45,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: secondColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(LoginGoogleEvent());
                    },
                    child: (state is OnLoginGoogleState)
                        ? const SpinKitFadingCircle(
                            color: Colors.white, size: 30)
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.google,
                                size: 24.0,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Sign In with Google',
                                style: subHeadingTextStyle.copyWith(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<Object?> _showLoginFailResult(BuildContext context, String message) {
    return showFlash(
        context: context,
        duration: const Duration(seconds: 1),
        builder: (context, controller) {
          return Flash.bar(
            borderRadius: BorderRadius.circular(8),
            margin: const EdgeInsets.all(8),
            controller: controller,
            backgroundGradient: LinearGradient(
              colors: [tertiaryColor, Colors.amber],
            ),
            position: FlashPosition.top,
            enableVerticalDrag: true,
            forwardAnimationCurve: Curves.easeOutBack,
            horizontalDismissDirection: HorizontalDismissDirection.startToEnd,
            child: FlashBar(
              content: Text(
                message,
                style: headingTextStyle.copyWith(
                    fontSize: 14, color: Colors.black),
              ),
            ),
          );
        });
  }
}
