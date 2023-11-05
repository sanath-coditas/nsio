import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nonstopioassignment/constants/text_style_constants.dart';
import 'package:nonstopioassignment/presentation/bloc/auth_bloc/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.user,
  });
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.38,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 48, left: 14),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(11),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 31,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -(MediaQuery.sizeOf(context).height * 0.112),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.29,
                    width: MediaQuery.sizeOf(context).height * 0.29,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD8D8D8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: user.photoURL != null
                        ? ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: user.photoURL!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.157,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: TextStyleConstants.s16W700c979797,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 28,
                      horizontal: 11,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Text(
                      user.displayName ?? '-',
                      style: TextStyleConstants.s16W700c1E2022,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Email Id',
                    style: TextStyleConstants.s16W700c979797,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 28,
                      horizontal: 11,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Text(
                      user.email ?? '',
                      style: TextStyleConstants.s16W700c1E2022,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.084,
                  ),
                  BlocProvider<AuthenticationBloc>(
                    create: (context) => GetIt.I<AuthenticationBloc>(),
                    child:
                        BlocConsumer<AuthenticationBloc, AuthenticationState>(
                      listener: (context, state) {
                        if (state is SignOutSuccessState) {
                          context.replace('/');
                        }
                        if (state is AuthenticationFailureState) {
                          log(state.failure.message.toString());
                        }
                      },
                      builder: (context, state) {
                        return FilledButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFFF0F00),
                            ),
                            minimumSize: MaterialStateProperty.all<Size>(
                              const Size.fromHeight(75),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                          onPressed: (state is AuthenticationLoadingState)
                              ? null
                              : () {
                                  context
                                      .read<AuthenticationBloc>()
                                      .add(SignOutEvent());
                                },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 28,
                            ),
                            child: Text(
                              (state is AuthenticationLoadingState)
                                  ? 'Logging out....'
                                  : 'Logout',
                              style: TextStyleConstants.s16W700cFFFFFF,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
