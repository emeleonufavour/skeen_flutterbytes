import 'package:flutter/cupertino.dart';
import 'package:skeen/cores/cores.dart';
import 'package:skeen/features/settings/presentation/components/faq_component.dart';

import '../../notifiers/email_notifier.dart';

List<Map<String, String>> faqs = [
  {
    "question": "How do I upload a skin image for analysis?",
    "answer":
        "You can upload images from your gallery or take a new photo using your camera by pressing the camera icon on the navigation bar."
  },
  {
    "question": "How do I set and track my skincare goals?",
    "answer":
        "In the 'Goals' section, you can set specific skincare goals, such as routine consistency or product usage. You’ll be able to track your progress over time."
  },
  {
    "question": "Can I update or change my skincare routine?",
    "answer":
        "Yes, you can update or modify your skincare routine anytime under the 'Routine' section. You can also add new products or adjust your goals as your routine evolves."
  },
];

class HelpSettingsView extends StatelessWidget {
  const HelpSettingsView({super.key});

  static const String route = "help_view";

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () => goBack(), icon: Icon(CupertinoIcons.back)),
              TextWidget(
                "FAQ",
                fontWeight: w600,
                fontSize: 16.sp,
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: faqs.length,
              separatorBuilder: (context, index) {
                return Divider(
                        height: .1.h, color: Colors.grey.withOpacity(0.5))
                    .padding(horizontal: kfsTiny.w);
              },
              itemBuilder: (context, index) {
                final String? question = faqs[index]["question"];
                final String? answer = faqs[index]["answer"];
                return FAQComponent(
                  text: question ?? "",
                  content: answer ?? "",
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextWidget(
            "Still stuck? Help is a mail away",
            fontWeight: w500,
          ),
          5.h.verticalSpace,
          EmailButton(),
        ],
      ).padding(horizontal: kGlobalPadding.w, vertical: 10.h),
      useSingleScroll: false,
    );
  }
}
