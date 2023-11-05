import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nonstopioassignment/constants/asset_consatnts.dart';
import 'package:nonstopioassignment/constants/text_style_constants.dart';
import 'package:nonstopioassignment/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:nonstopioassignment/presentation/widgets/sign_in_option.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<AuthenticationBloc>(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red.withOpacity(0.6),
                  content:
                      Text(state.failure.message ?? 'Something went wrong!!'),
                ),
              );
            }
            if (state is AuthenticationSuccessState) {
              context
                  .replace('/home', extra: {'user': state.userCredential.user});
            }
          },
          builder: (context, state) {
            if (state is AuthenticationLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.black,
                ),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox()),
                Image.asset(
                  AssetConstants.loginImage,
                ),
                const Expanded(child: SizedBox()),
                const Text(
                  'Sign in with',
                  style: TextStyleConstants.s16W700cFFFFFF,
                ),
                const SizedBox(
                  height: 23,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  child: Column(
                    children: [
                      SignInOption(
                        image: AssetConstants.googleIcon,
                        onTap: () {
                          context
                              .read<AuthenticationBloc>()
                              .add(SignInWithGoogleEvnet());
                        },
                        signInType: 'Google',
                        textStyle: TextStyleConstants.s16W700c1E2022,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SignInOption(
                        image: AssetConstants.facebookIcon,
                        onTap: () {},
                        signInType: 'Facebook',
                        color: const Color(0xFF3D6AD6),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SignInOption(
                        image: AssetConstants.linkedInIcon,
                        onTap: () {},
                        signInType: 'Linkedin',
                        color: const Color(0xFF0077B5),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            );
          },
        ),
      ),
    );
  }
}
