part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LogoutState) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/logout', (route) => false);
        }
      },
      builder: (context, state) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const FaIcon(FontAwesomeIcons.user, size: 100),
                  const SizedBox(
                    height: 15,
                  ),
                  (state is LoginSuccessState)
                      ? Text(_user!.email!, style: headingTextStyle)
                      : const SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: primaryColor, width: 1),
                            borderRadius: BorderRadius.circular(12),
                          )),
                      onPressed: () {
                        context.read<AuthBloc>().add(LogoutEvent());
                      },
                      child: Text('Logout',
                          style: subHeadingTextStyle.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
