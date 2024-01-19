import 'package:flutter/material.dart';

class LivingRoomPage extends StatefulWidget {
  const LivingRoomPage({Key? key}) : super(key: key);

  @override
  State<LivingRoomPage> createState() => _LivingRoomPageState();
}

class _LivingRoomPageState extends State<LivingRoomPage> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 40,
          centerTitle: true,
          titleSpacing: 0,
          leading: const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(Icons.arrow_back_ios)),
          title: const Text(
            'Living Room',
            style: TextStyle(
              color: Color(0xFF0F0F0F),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          )),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: MediaQuery.sizeOf(context).width,
            height: 140,
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: const Color(0xFFF7F7F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.light),
                    ),
                    Switch(
                        value: switchValue,
                        onChanged: (v) {
                          setState(() {
                            switchValue = !switchValue;
                          });
                        },
                        inactiveThumbColor: const Color(0xFF34E0A1),
                        inactiveTrackColor: Colors.white,
                        hoverColor: const Color(0xFF34E0A1),
                        focusColor: const Color(0xFF34E0A1),
                        activeTrackColor: const Color(0xFF34E0A1),
                        activeColor: Colors.white)
                  ],
                ),
                const SizedBox(height: 14),
                const Text(
                  'Lamp',
                  style: TextStyle(
                    color: Color(0xFF0F0F0F),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 2),
                const Opacity(
                  opacity: 0.60,
                  child: Text(
                    '1 Device',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
                  child: InnerShadowSlider(trackHeight: 140),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InnerShadowSlider extends StatefulWidget {
  final double trackHeight;
  const InnerShadowSlider({Key? key, this.trackHeight = 60}) : super(key: key);

  @override
  State<InnerShadowSlider> createState() => _InnerShadowSliderState();
}

class _InnerShadowSliderState extends State<InnerShadowSlider> {
  var _volume = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 340,
          child: RotatedBox(
            quarterTurns: -1,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: widget.trackHeight,
                thumbShape: SliderComponentShape.noOverlay,
              ),
              child: Slider(
                  activeColor: const Color(0xFF34E0A1),
                  min: 0,
                  max: 100,
                  value: _volume,
                  onChanged: (value) => setState(() => _volume = value),
                  inactiveColor: const Color(0xFFF7F7F7)),
            ),
          ),
        ),
        Positioned.fill(
            child: Center(
          child: Text(
            "${_volume.toStringAsFixed(0)}\%",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF0F0F0F),
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ))
      ],
    );
  }
}
