import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nonstopioassignment/constants/text_style_constants.dart';
import 'package:nonstopioassignment/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:nonstopioassignment/presentation/widgets/beer_tile.dart';
import 'package:nonstopioassignment/presentation/widgets/home_screen_loader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.user,
  });
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider<HomeBloc>(
        create: (context) => GetIt.I<HomeBloc>()..add(GetBeers()),
        child: Builder(builder: (context) {
          return RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.black,
            onRefresh: () async {
              context.read<HomeBloc>().add(
                    GetBeers(
                      isPullToRefresh: true,
                    ),
                  );
            },
            child: HomeScreenBody(user: user),
          );
        }),
      ),
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    int page = 2;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if ((context.read<HomeBloc>().state is HomeLoadedState) &&
            (context.read<HomeBloc>().state as HomeLoadedState).isFetching) {
          return;
        }
        context.read<HomeBloc>().add(GetNextPageBeers(page: page));
        page = page + 1;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const HomeScreenLoader();
        }
        if (state is HomeFailureState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Something went wrong',
                  style: TextStyleConstants.s16W700cFFFFFF,
                ),
                TextButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(GetBeers());
                  },
                  child: const Text(
                    'Refresh',
                    style: TextStyleConstants.s16W700cFFFFFF,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is HomeLoadedState) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
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
                          onPressed: () {
                            context.push(
                              '/profile',
                              extra: {'user': widget.user},
                            );
                          },
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
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                ),
                sliver: SliverGrid.builder(
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    if (index == state.beers.length) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        context.push(
                          '/product_detail',
                          extra: {
                            'beer': state.beers[index],
                          },
                        );
                      },
                      child: BeerTile(
                        beer: state.beers[index],
                      ),
                    );
                  },
                  itemCount: (state.isFetching)
                      ? state.beers.length + 1
                      : state.beers.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 298,
                    mainAxisSpacing: 28,
                    crossAxisSpacing: 14,
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
