import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/Patients/Screens/page5_7/linkCard.dart';

class ChatPage extends StatefulWidget {
  final String? imageUrl, name;
  ChatPage({
    this.imageUrl,
    this.name,
  });
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageEditingController = TextEditingController();

  addMessage() {
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        // 'sendBy': ,
        // 'message': ,
        'time': DateTime.now()
      };
    }
    setState(() {
      messageEditingController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: BackIcon(),
        toolbarHeight: size.height * 0.1,
        shadowColor: Theme.of(context).buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.09),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: size.height * 0.05,

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.imageUrl!,
                    ),
                    fit: BoxFit.contain,
                  ),
                  shape: BoxShape.circle,
                ),
                // child: Image.network(widget.imageUrl!),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.0005),
                child: Text(widget.name!),
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            StreamBuilder(
                stream: null,
                builder: (context, snapshot) {
                  // if (!snapshot.hasData)
                  //   return Center(child: Text('No Messages Yet...'));
                  // if (snapshot.connectionState == ConnectionState.none)
                  //   return Center(
                  //     child: Icon(
                  //       Icons.error,
                  //       size: 100,
                  //     ),
                  //   );
                  return MessageTile(
                    message:
                        'hello Nigeria, bbgghbghNigeria NigeriaNigeriaNigeriaNigeriaNigeriaNigeriaNigeriaNigeriaNigeria',
                    sendByMe: false,
                    size: size,
                    time: '12:45',
                  );
                }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.12,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).buttonColor.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1.3),
                      BoxShadow(
                          color: Theme.of(context).highlightColor,
                          spreadRadius: 0.2,
                          blurRadius: 0.1)
                    ]),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.all(13),
                            hintText: 'Message...',
                            fillColor:
                                Theme.of(context).accentColor.withOpacity(0.2),
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor,
                                  style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor,
                                  style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        width: size.width * 0.75,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).buttonColor,
                        ),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.solidPaperPlane,
                            color: Theme.of(context).primaryColor,
                            size: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key? key,
    required this.message,
    this.sendByMe,
    this.icon,
    required this.size,
    required this.time,
  }) : super(key: key);
  final String message, time;
  final bool? sendByMe;
  final IconData? icon;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Bubble(
      margin: BubbleEdges.only(
          top: 20,
          left: sendByMe! ? size.width * 0.15 : 10,
          right: sendByMe! ? 10 : size.width * 0.15,
          bottom: 20),
      stick: true,
      radius: Radius.circular(20),
      nip: sendByMe! ? BubbleNip.rightBottom : BubbleNip.leftBottom,
      color: Theme.of(context).primaryColor,
      nipWidth: 5,
      nipHeight: 20,
      alignment: sendByMe! ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: size.width * 0.49,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            child: Text(
              message,
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            width: size.width * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.check),
                Text(
                  time,
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
