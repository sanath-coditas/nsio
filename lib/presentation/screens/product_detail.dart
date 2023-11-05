import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nonstopioassignment/constants/asset_consatnts.dart';
import 'package:nonstopioassignment/constants/text_style_constants.dart';
import 'package:nonstopioassignment/domain/entities/beer_entity.dart';
import 'package:nonstopioassignment/presentation/widgets/beer_composition_title_value.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.beer});
  final Beer beer;
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
                  height: 347,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 48, left: 14),
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                      )),
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
                      Text(
                        beer.name ?? '',
                        style: TextStyleConstants.s16W700cAFB2B5,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        beer.tagline ?? '',
                        style: TextStyleConstants.s12W400c77838F,
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: -67,
                  child: Container(
                    height: 230,
                    width: 160,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD8D8D8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: beer.imageUrl != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 16,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: beer.imageUrl!,
                              height: 198,
                              width: 98,
                            ),
                          )
                        : null,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 95,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyleConstants.s16W500c1E2022,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    beer.description ?? '',
                    style: TextStyleConstants.s14W400c77838F,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    'First Brewed',
                    style: TextStyleConstants.s16W500c1E2022,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    beer.firstBrewed ?? '',
                    style: TextStyleConstants.s14W400c77838F,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    'Getting know your beer better',
                    style: TextStyleConstants.s16W500c1E2022,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      BeerCompositionDetailsWidget(
                        title: 'ABV',
                        value: (beer.abv ?? '').toString(),
                      ),
                      BeerCompositionDetailsWidget(
                        title: 'IBU',
                        value: (beer.ibu ?? '').toString(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      BeerCompositionDetailsWidget(
                        title: 'TARGET FG',
                        value: (beer.targetFg ?? '').toString(),
                      ),
                      BeerCompositionDetailsWidget(
                        title: 'TARGET OG',
                        value: (beer.targetOg ?? '').toString(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      BeerCompositionDetailsWidget(
                        title: 'EBC',
                        value: (beer.ebc ?? '').toString(),
                      ),
                      BeerCompositionDetailsWidget(
                        title: 'SRM',
                        value: (beer.srm ?? '').toString(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      BeerCompositionDetailsWidget(
                        title: 'PH',
                        value: (beer.ph ?? '').toString(),
                      ),
                      BeerCompositionDetailsWidget(
                        title: 'ATTENTION LEVEL',
                        value: (beer.attenuationLevel ?? '').toString(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
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

class BeerCompositionDetailsWidget extends StatelessWidget {
  const BeerCompositionDetailsWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AssetConstants.beerIcon),
          const SizedBox(
            width: 11,
          ),
          Flexible(
            child: BeerCompositionTitleValue(
              title: title,
              verticalSpacing: 5,
              titleStyle: TextStyleConstants.s14W500c1E2022,
              valueStyle: TextStyleConstants.s14W400c77838F,
              value: value,
            ),
          )
        ],
      ),
    );
  }
}
