# flutter_brunch_challenge

這是 Flutter Brunch 現場小挑戰活動 使用的初始專案，
從 2020/08/29 開始。

## Flutter Brunch 2020/08 小挑戰
#### 1. Widget 練習：Drawer
- 幫頁面加上 Drawer。參考： https://flutter.dev/docs/cookbook/design/drawer
- 可能用到的 Widget：Drawer、ListView、DrawerHeader、ListTile、Text、Icon、BoxDecoration
<img src="https://github.com/hl3hl3/FlutterBrunchChallenge/blob/develop/readme/challenge_202008_3.png" width="300">

#### 2. 動畫練習：幫 App 介紹區塊加上動畫效果
- 參考：https://flutter.dev/docs/cookbook/animation/opacity-animation
- 先把所在 Widet 轉成 StatefulWidget
- 幫介紹區塊加上點擊事件
- 點擊時修改狀態並 setState

#### 3. 點擊開啟 Drawer
- 宣告一個型別為 GlobalKey<ScaffoldState> 的變數，建議名稱：_scaffoldKey
- 將 Scaffold 的 key 設定為宣告的 _scaffoldKey
- 幫 小挑戰區塊文字 加上點擊事件（用 GestureDetector？ 或整塊換成 RaisedButton? 或其他？）
- 點擊事件中  `_scaffoldKey.currentState.openDrawer();` 
- setState()   
<img src="https://github.com/hl3hl3/FlutterBrunchChallenge/blob/develop/readme/challenge_202008_0.gif" width="300">
  
#### 4. 換成自己喜歡的顏色吧！
<img src="https://github.com/hl3hl3/FlutterBrunchChallenge/blob/develop/readme/challenge_202008_2.png" width="300">
