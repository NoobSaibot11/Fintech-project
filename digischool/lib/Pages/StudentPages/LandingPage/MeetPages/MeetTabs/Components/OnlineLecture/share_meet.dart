import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareMeetLinkPage extends StatelessWidget {
  const ShareMeetLinkPage({Key? key}) : super(key: key);
  void _shareInstantMeetLink(BuildContext context) {
    try {
      String instantMeetLink = "https://example.com/instant_meet";
      Share.share(instantMeetLink);
    } on Exception {
      // Handle MissingPluginException (share_plus plugin not available on the platform)
      _showErrorDialog(context, 'Share functionality is not available on this platform.');
    } catch (e) {
      // Handle other exceptions
      _showErrorDialog(context, 'Error sharing instant meet link: $e');
    }
  }
  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share Instant Meet Link"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _shareInstantMeetLink(context),
          child: const Text("Share Instant Meet Link"),
        ),
      ),
    );
  }
}
