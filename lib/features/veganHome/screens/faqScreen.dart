import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/utils/url.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "FAQs",
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemBuilder: (_, index) => SingleQuestionItem(faq: faqs[index]),
        separatorBuilder: (_, index) => Padding(padding: const EdgeInsets.symmetric(vertical: 5)),
        itemCount: faqs.length,
      ),
    );
  }
}

class SingleQuestionItem extends StatelessWidget {
  const SingleQuestionItem({Key? key, required this.faq}) : super(key: key);

  final Map<String, dynamic> faq;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        faq.containsKey('action') ? faq["action"]() : null;
      },
      child: Card(
        color: themeShade200,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                faq['question']!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(faq['answer']!),
              faq.containsKey("icon")
                  ? SizedBox(
                      height: 10,
                    )
                  : SizedBox.shrink(),
              faq.containsKey("icon")
                  ? Image.asset(
                      faq['icon'],
                      width: MediaQuery.of(context).size.width * 0.1,
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> faqs = [
  {
    "question": "Need help with a recent order?",
    "answer":
        "Go to our website for live chat with a member of the vegi team.\nwww.vegiapp.co.uk \nAvailable 7 days a week, 8am - 9pm",
    "action": () => launchUrl("https://vegiapp.co.uk"),
  },
  {
    "question": "What is vegi?",
    "answer":
        "vegi is the place to shop plant-based! We connect you to local retailers, restaurants, suppliers and more broadly the vegan independent business community across the U.K."
  },
  {
    "question": "How can I tell if a business is fully vegan?",
    "answer":
        "vegi lists products from both vegan and non-vegan businesses, however all items on the platform are vegan. \nYou can tell if a business is exclusively vegan by looking for the following icon under the restaurant",
    "icon": "assets/images/vegan-only-icon.png"
  },
  {
    "question": "How do I keep my vegi wallet safe?",
    "answer":
        "You are the sole owner of your vegi wallet. Payments can only be made by you, and access is exclusively yours. Make sure you save your 12 word recovery phrase to enable you to access your wallet.\n\nIf you are logged out without this information, your wallet and balance could be lost.\n\nWe advise you to save this information immediately upon creating your vegi wallet, as you could be inadvertently logged out at any time. vegi does not take any responsibility for recovering wallets lost without their 12 word recovery phrases. You can read more about this in the vegi terms of service."
  },
  {
    "question": "How can I list my business on vegi?",
    "answer":
        "For more information and to book a chat about selling on vegi, check out https://vegiapp.co.uk where you can request more information or schedule a call or visit from a member of the team.",
    "action": () => launchUrl("https://vegiapp.co.uk")
  },
  {
    "question": "Jobs at vegi",
    "answer":
        "If you are passionate about increasing the availability of great vegan food and local businesses… join our mailing list to be the first to know of job vacancies and follow our LinkedIn page. "
  },
  {
    "question": "Who are your delivery partners?",
    "answer":
        "For deliveries within the Liverpool city region, we work with Agile courier service provided by the Peloton cooperative. Couriers are on employment contracts and are paid a living wage."
  },
  {
    "question": "What is Peepl?",
    "answer":
        "Peepl offers payments and rewards to its locally focused partner apps. Find out more about Peepl, PPL tokens and GBPX here",
    "action": () => launchUrl("https://itsaboutpeepl.com/peepl-faqs/")
  },
];
