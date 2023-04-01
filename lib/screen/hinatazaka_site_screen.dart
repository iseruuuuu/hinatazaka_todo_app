import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/color_constants.dart';

class HinatazakaSiteScreen extends StatefulWidget {
  const HinatazakaSiteScreen({Key? key}) : super(key: key);

  @override
  State<HinatazakaSiteScreen> createState() => _HinatazakaSiteScreenState();
}

class _HinatazakaSiteScreenState extends State<HinatazakaSiteScreen> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InAppWebView(
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            initialUrlRequest: URLRequest(
              url: Uri.parse(
                'https://www.google.com/search?q=%E6%97%A5%E5%90%91%E5%9D%8246&rlz=1C5CHFA_enJP1030JP1030&oq=%E6%97%A5%E5%90%91%E5%9D%82&aqs=chrome.4.69i57j69i59l2j35i39j0i131i433i512j69i65j69i60j69i61.4321j0j7&sourceid=chrome&ie=UTF-8',
              ),
            ),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                useShouldOverrideUrlLoading: true,
              ),
            ),
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              var uri = navigationAction.request.url!;
              if ((uri.scheme == 'test') && (uri.host == "youtube")) {
                await launchUrl(Uri.parse('https://www.youtube.com'),
                    mode: LaunchMode.externalApplication);
                return NavigationActionPolicy.CANCEL;
              }
              return NavigationActionPolicy.ALLOW;
            },
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    webViewController?.goBack();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                IconButton(
                  onPressed: () {
                    webViewController?.goForward();
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
