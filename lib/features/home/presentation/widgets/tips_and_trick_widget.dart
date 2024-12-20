import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeen/cores/cores.dart';
import 'package:skeen/features/features.dart';

List<Map<String, String>> carouselData = [
  {
    "img": Assets.healthyFood,
    "title": "Eat Well",
    "tip":
        "Include fruits, veggies, and healthy fats in your diet for glowing skin.",
  },
  {
    "img": Assets.manDrinking,
    "title": "Stay Hydrated",
    "tip":
        "Drink plenty of water throughout the day for plump, healthy-looking skin.",
  },
  {
    "img": Assets.nightSkinCare,
    "title": "Night Routine",
    "tip":
        "Never skip your nighttime skincare. Always remove makeup before bed.",
  },
  {
    "img": Assets.skinCareOil,
    "title": "Face Oils",
    "tip": "Use facial oils for extra moisture and nourishment when needed.",
  },
  {
    "img": Assets.womanSun,
    "title": "Sun Smart",
    "tip":
        "Apply SPF 30+ daily, even on cloudy days. Your future skin will thank you!",
  },
];

class TipsAndTrickWidget extends ConsumerWidget {
  const TipsAndTrickWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final tipsAndTricksState = ref.watch(getTipsAndTrickNotifier);
    // final tipsAndTricksData = tipsAndTricksState.data;
    return CarouselSlider.builder(
      options: CarouselOptions(
        viewportFraction: 1,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.ease,
        autoPlay: true,
        autoPlayInterval: duration4s,
      ),
      itemCount: carouselData.length,
      //  switch (tipsAndTricksState.status) {
      //   StateStatus.success => tipsAndTricksData?.length ?? 0,
      //   _ => 8,
      // },
      itemBuilder: (_, index, __) {
        final tip = TipsAndTricksEntity(
            id: index.toString(),
            title: carouselData[index]["title"]!,
            description: carouselData[index]["tip"]!,
            imagePath: carouselData[index]["img"]!);
        return
            // tipsAndTricksState.status == StateStatus.success
            //     ?
            __widget(tip, index, context);
        // : Shimmer.fromColors(
        //     highlightColor: Colors.grey[300]!,
        //     baseColor: Colors.grey[200]!,
        //     child: __widget(tip, index),
        //   );
      },
    ).padding(horizontal: kfsExtraLarge - 7);
  }

  Widget __widget(TipsAndTricksEntity? tip, int index, BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(kfsMedium),
      ),
      child: Stack(
        children: [
          Container(
            width: screenWidth,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xffC8A9AC)
                  : Palette.bg2,
              borderRadius: BorderRadius.circular(kfsMedium.w),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      tip?.title ?? '',
                      fontWeight: w700,
                      fontSize: kfsExtraLarge.sp,
                      textColor:
                          Theme.of(context).textTheme.displayLarge?.color ??
                              Palette.black,
                    ),
                    TextWidget(
                      tip?.description ?? '',
                      fontSize: 14.sp,
                      textColor:
                          Theme.of(context).textTheme.displayLarge?.color ??
                              Palette.black,
                    )
                  ],
                )
                    .padding(left: kGlobalPadding - 7, top: kXtremeLarge)
                    .expand(flex: 3),
                const Spacer(),
              ],
            ),
          ),
          Positioned(
            bottom: -10,
            right: -10,
            // right: switch (index) {
            //   2 => -100,
            //   3 => -100,
            //   7 => -80,
            //   _ => -50,
            // },
            child: ImageWidget(
              url: tip?.imagePath ?? '',
              height: screenHeight * .15,
            ),
          ),
        ],
      ),
    );
  }
}
