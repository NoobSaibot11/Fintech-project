import 'package:digischool/Components/material_button.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/MeetPages/MeetTabs/Components/OnlineLecture/Scheduled_Meet.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/MeetPages/MeetTabs/Components/OnlineLecture/instant_meeting.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/MeetPages/MeetTabs/Components/OnlineLecture/join_with_code.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/MeetPages/MeetTabs/Components/OnlineLecture/share_meet.dart';
import 'package:flutter/material.dart';
import 'Components/RecordedLectures/video_container.dart';

class LecturePage extends StatelessWidget {
  const LecturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  onTap: () {
                    _showNewMeetOptions(context);
                  },
                  text: 'New Meet',
                  bgColor: Colors.black,
                  textColor: Colors.white,
                  showBorder: true,
                ),
                MyButton(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const JoinWithCodePage()));
                  },
                  text: 'Join using Code',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  showBorder: true,
                ),
              ],
            ),
            // Recorded Lecture Section
            const Expanded(
              child: YoutubeVideoContainer(),
            ),
          ],
        ),
      ),
    );
  }

  void _showNewMeetOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildOptionTile(
              title: 'Instant Meet',
              icon: Icons.access_time,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const InstantMeetPage()));
                Navigator.pop(context);
              },
            ),
            _buildOptionTile(
              title: 'Share Instant Meet Link',
              icon: Icons.link,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShareMeetLinkPage()));
                Navigator.pop(context);
              },
            ),
            _buildOptionTile(
              title: 'Schedule a Meet',
              icon: Icons.event,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MeetingSchedulerPage()));
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildOptionTile(
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}
