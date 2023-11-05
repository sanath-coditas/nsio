import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nonstopioassignment/constants/text_style_constants.dart';

class HomeScreenLoader extends StatelessWidget {
  const HomeScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 48,
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(11),
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_2_outlined),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Time to Cheers! Choose your beer...',
                style: TextStyleConstants.s16W700cAFB2B5,
              ),
              const SizedBox(
                height: 28,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 298,
                  mainAxisSpacing: 28,
                  crossAxisSpacing: 14,
                ),
                itemBuilder: (context, index) => DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.grey.shade900,
                  ),
                )
                    .animate(
                      onPlay: (controller) => controller.repeat(),
                    )
                    .shimmer(
                      duration: const Duration(
                        milliseconds: 900,
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
