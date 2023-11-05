import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nonstopioassignment/constants/asset_consatnts.dart';
import 'package:nonstopioassignment/constants/text_style_constants.dart';
import 'package:nonstopioassignment/domain/entities/beer_entity.dart';
import 'package:nonstopioassignment/presentation/widgets/beer_composition_title_value.dart';

class BeerTile extends StatelessWidget {
  const BeerTile({super.key, required this.beer});
  final Beer beer;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(
                      AssetConstants.beerBackground,
                    ),
                  ),
                  beer.imageUrl != null
                      ? SizedBox(
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 12,
                              bottom: 30,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: beer.imageUrl!,
                              height: 108,
                              width: 53,
                            ),
                          ),
                        )
                      : Image.asset(
                          AssetConstants.loginImage,
                          height: 150,
                        ),
                ],
              ),
              Positioned(
                bottom: 4,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1E2022),
                  ),
                  child: Text(
                    'First Brewed: ${beer.firstBrewed}',
                    style: TextStyleConstants.s12W400cF2F2F2,
                  ),
                ),
              )
            ],
          ),
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: double.infinity,
                  ),
                  Text(
                    beer.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleConstants.s14W500c1E2022,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    beer.description ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleConstants.s12W400c77838F,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      BeerCompositionTitleValue(
                        title: 'ABV',
                        value: (beer.abv ?? '').toString(),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      BeerCompositionTitleValue(
                        title: 'IBU',
                        value: (beer.ibu ?? '').toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
