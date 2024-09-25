import 'package:myskin_flutterbytes/src/cores/cores.dart';
import 'package:myskin_flutterbytes/src/features/features.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SeeAllTile(
          title: 'Recommended for you',
        ),
        SizedBox(
          height: screenHeight * .3,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              RecommendationBox(
                tagColor: Palette.bg4,
                tagName: "Product",
                imagePath: Assets.faceCream,
                title: "Hydrating Face Moisturizer",
                description:
                    "Deep hydration for dry and sensitive skin. Contains hyaluronic acid and vitamin E.",
              ),
              RecommendationBox(
                tagColor: Palette.bg3,
                tagName: "Diet",
                imagePath: Assets.veggies,
                title: "Glowing Skin Diet",
                description:
                    "Incorporate these super foods for radiant skin. Expert nutrition tips included.",
              ),
            ].separate(kfsVeryTiny.horizontalSpace),
          ),
        )
      ].separate(kfsMedium.verticalSpace),
    );
  }
}