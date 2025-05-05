import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/data/local_data.dart';
import '../../../shared/widgets/master_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

@RoutePage()
class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({
    super.key,
  });

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  late WebViewController controller;
  final Set<Factory<OneSequenceGestureRecognizer>> _gestureRecognizers =
      <Factory<OneSequenceGestureRecognizer>>{
    Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())
  };
  PlatformWebViewControllerCreationParams params =
      const PlatformWebViewControllerCreationParams();

  @override
  void initState() {
    super.initState();
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{
          PlaybackMediaTypes.audio,
        },
      );
    }

    String webviewLink = LocalData.getLangCode() == "ar"
        ? 'https://kf-bot-qc.azurewebsites.net/kfund-websitebot/kf.mobile.ar.html?token=${LocalData.getUser()!.tokenInfo.token}'
        : 'https://kf-bot-qc.azurewebsites.net/kfund-websitebot/kf.mobile.en.html?token=${LocalData.getUser()!.tokenInfo.token}';
    controller = WebViewController.fromPlatformCreationParams(params)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            // Inject meta tag to disable scaling and horizontal scrolling
            controller.runJavaScript('''
              var meta = document.createElement('meta');
              meta.name = 'viewport';
              meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';
              document.getElementsByTagName('head')[0].appendChild(meta);
              document.body.style.overflowX = "hidden";
            ''');
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'DisableHorizontalScroll',
        onMessageReceived: (JavaScriptMessage message) {
          // Handle messages if needed.
        },
      )
      ..loadRequest(Uri.parse(webviewLink));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
                color: Colors.white,

      child: MasterWidget(
        
        screenTitle: context.tr('chat_bot'),
        isBackEnabled: true,
        widget: Container(
          color: Colors.white,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewInsets.bottom - // Adjust height dynamically
                    220.h,
                width: double.infinity,
                child: WebViewWidget(
                  controller: controller,
                  gestureRecognizers: _gestureRecognizers,
                )),
          )),
        ),
      ),
    );
  }
}