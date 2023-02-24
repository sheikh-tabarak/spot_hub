import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelsScreen extends StatefulWidget {
  @override
  _ReelsScreenState createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  List<VideoPlayerController> _controllers = [];
  ScrollController _scrollController = ScrollController();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      _controllers.add(
        VideoPlayerController.network(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        ),
      );
    }
    _controllers.forEach((controller) {
      controller.setLooping(true);
      controller.initialize().then((_) {
        setState(() {});
      });
    });
    _scrollController.addListener(() {
      setState(() {
        _isPlaying = false;
      });
      _controllers.forEach((controller) {
        if (controller.value.isPlaying) {
          controller.pause();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.forEach((controller) => controller.dispose());
    _scrollController.dispose();
  }

  Widget _buildReel(int index) {
    return Stack(
      children: [
        SizedBox.expand(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isPlaying = true;
              });
              _controllers[index].play();
            },
            child: _controllers[index].value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controllers[index].value.aspectRatio,
                    child: VideoPlayer(_controllers[index]),
                  )
                : Container(),
          ),
        ),
        _isPlaying
            ? SizedBox.shrink()
            : Align(
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {
                    setState(() {
                      _isPlaying = true;
                    });
                    _controllers[index].play();
                  },
                ),
              ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.black.withOpacity(0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.mode_comment),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if (index < 5) {
                return _buildReel(index);
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}