// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebNegocio extends StatefulWidget {
//   const WebNegocio({Key? key, required this.web, required this.titulo}) : super(key: key);
//   final String web;
//   final String titulo;
//   @override
//   _WebNegocioState createState() => _WebNegocioState();
// }

// class _WebNegocioState extends State<WebNegocio> {
//   final Completer<WebViewController> _controller = Completer<WebViewController>();

//   @override
//   void initState() {
//     super.initState();
//     if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.grey),
//         title: Text(
//           widget.titulo,
//           style: const TextStyle(
//             color: Colors.grey,
//           ),
//         ),
//         actions: [
//           PopupMenuButton(
//             icon: const Icon(
//               Icons.more_horiz,
//               color: Colors.grey,
//             ),
//             enabled: true,
//             onSelected: (value) {
//               if (value == 1) {
//                 _launchURL(widget.web);
//               }
//             },
//             itemBuilder: (context) => [
//               const PopupMenuItem(
//                 child: Text("abrir en el navegador"),
//                 value: 1,
//               ),
//             ],
//           )
//         ],
//       ),
//       body: _contenidoWebview(),
//     );
//   }

//   _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   Builder _contenidoWebview() {
//     return Builder(
//       builder: (BuildContext context) {
//         return WebView(
//           initialUrl: widget.web,
//           javascriptMode: JavascriptMode.unrestricted,
//           onWebViewCreated: (WebViewController webViewController) {
//             _controller.complete(webViewController);
//           },
//           // ignore: prefer_collection_literals
//           javascriptChannels: <JavascriptChannel>[
//             _toasterJavascriptChannel(context),
//           ].toSet(),

//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           gestureNavigationEnabled: true,
//         );
//       },
//     );
//   }

//   JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
//     return JavascriptChannel(
//       name: 'Toaster',
//       onMessageReceived: (JavascriptMessage message) {
//         Scaffold.of(context).showSnackBar(
//           SnackBar(content: Text(message.message)),
//         );
//       },
//     );
//   }
// }

// class NavigationControls extends StatelessWidget {
//   const NavigationControls(this._webViewControllerFuture) : assert(_webViewControllerFuture != null);

//   final Future<WebViewController> _webViewControllerFuture;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<WebViewController>(
//       future: _webViewControllerFuture,
//       builder: (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
//         final bool webViewReady = snapshot.connectionState == ConnectionState.done;
//         final WebViewController controller = snapshot.data!;
//         return Row(
//           children: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.arrow_back_ios),
//               onPressed: !webViewReady
//                   ? null
//                   : () async {
//                       if (await controller.canGoBack()) {
//                         await controller.goBack();
//                       } else {
//                         Scaffold.of(context).showSnackBar(
//                           const SnackBar(content: Text("No back history item")),
//                         );
//                         return;
//                       }
//                     },
//             ),
//             IconButton(
//               icon: const Icon(Icons.arrow_forward_ios),
//               onPressed: !webViewReady
//                   ? null
//                   : () async {
//                       if (await controller.canGoForward()) {
//                         await controller.goForward();
//                       } else {
//                         Scaffold.of(context).showSnackBar(
//                           const SnackBar(content: Text("No forward history item")),
//                         );
//                         return;
//                       }
//                     },
//             ),
//             IconButton(
//               icon: const Icon(Icons.replay),
//               onPressed: !webViewReady
//                   ? null
//                   : () {
//                       controller.reload();
//                     },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
