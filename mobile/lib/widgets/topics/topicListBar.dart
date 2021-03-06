import 'package:discuzq/utils/global.dart';
import 'package:discuzq/widgets/common/discuzIcon.dart';
import 'package:discuzq/widgets/common/discuzText.dart';
import 'package:discuzq/widgets/common/discuzTextfiled.dart';
import 'package:discuzq/widgets/topics/topicSortTypes.dart';
import 'package:discuzq/widgets/ui/ui.dart';
import 'package:flutter/material.dart';

class TopicListBar extends StatefulWidget {
  TopicListBar({Key key, this.onKeyWordChanged, this.onSortChanged})
      : super(key: key);

  final Function onKeyWordChanged;

  final Function onSortChanged;

  @override
  _TopicListBarState createState() => _TopicListBarState();
}

class _TopicListBarState extends State<TopicListBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: DiscuzApp.themeOf(context).backgroundColor,
          border: const Border(bottom: Global.border, top: Global.border)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: DiscuzTextfiled(
              placeHolder: '输入关键字搜索话题',
              textInputAction: TextInputAction.search,
              onSubmit: widget.onKeyWordChanged,
              borderWidth: 0,
              borderColor: Colors.transparent,
            ),
          ),
          _normalPopMenu(),
        ],
      ),
    );
  }

  Widget _normalPopMenu() => Theme(
        data: Theme.of(context).copyWith(
          cardColor: DiscuzApp.themeOf(context).scaffoldBackgroundColor,
        ),
        child: PopupMenuButton<TopicListSortType>(
            icon: DiscuzIcon(Icons.more_horiz,
                color: DiscuzApp.themeOf(context).textColor),
            itemBuilder: (BuildContext context) =>
                <PopupMenuItem<TopicListSortType>>[
                  const PopupMenuItem<TopicListSortType>(
                      value: TopicListSortType.viewCount,
                      child: const DiscuzText('热度')),
                  const PopupMenuItem<TopicListSortType>(
                      value: TopicListSortType.threadCount,
                      child: const DiscuzText('内容数'))
                ],
            onSelected: (TopicListSortType value) {
              widget.onSortChanged(value);
            }),
      );
}
