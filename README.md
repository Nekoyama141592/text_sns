# Udemy講座
https://www.udemy.com/course/flutter-firebase-aws/?referralCode=1B86E06336C03FD7AE08
(このリンクを経由してコースが購入されると、講師の売り上げとしてカウントされます。)

## title
【2024年版】Flutter+Firebase+AWS アプリ開発実践講座

## sub_title
Flutter3対応。iOSとAndroidを同時に開発できるFlutterでモバイルアプリ開発に挑戦しよう。Firebase、AWSと連携し、重要なアプリの基本機能を作成。

### about
この講座について

2024年1月に公開した比較的新しい講義のため、受講者数が少なくなっています。気軽にご購入していただけると幸いです。

内容

どのFlutterアプリでも使用されるような認証、ストレージ、データ通信などの重要な機能を丁寧に作成していきます。

使用する技術

Dart

Flutter

Node.js

Firebase Auth

Firebase Remote Cofig

Firebase Firestore

Firebase Cloud Functions

AWS S3

AWS Rekognition

# text_sns

## 概要
ユーザーがテキストで投稿を行うことができるシンプルなSNS
## 主な機能

- **基本機能**：URLライクなページ遷移、状態変化の反映
- **認証機能**：Firebase Authを使用して新規登録、ログイン、ログアウトなどを実装
- **データ通信**： FirebaseのCloud Firestore, Remote Config,Cloud Functionsなどを使用してユーザー情報登録機能や投稿機能を作成
- **ストレージ機能**：AWSのS3を使用
- **不適切な画像の判定**：AWS Rekognitionを使用してアルコールやヌードが含まれているか判定

### アプリケーションへのアクセス

現在、存在しません

### 前提条件

- Ruby
- Xcode
- Android Studio
- Flutter
### アプリケーションの起動

以下のコマンドでアプリケーションを起動します。

```bash
# dev
flutter run --flavor dev -t lib/main_dev.dart

# prod
flutter run --flavor prod -t lib/main_prod.dart
```

## ディレクトリ構成

```
text_sns/
│
├── android/              # Androidディレクトリ
├── cloud_functions/      # Cloud Functionsディレクトリ
├── ios/                  # iOSディレクトリ
├── lib/                  # ライブラリディレクトリ
│    ├── app/             # GetMaterialAppに関わる情報
│    ├── constant/        # 定数ファイルを格納
│    ├── controllers/     # GetXControllerを使用するファイルを格納
│    ├── core/            # 全体で共通する処理のファイルを格納
│    ├── enums/           # enumを定義したファイルを格納
│    ├── infrastructure/  # 通信に関わるファイルを格納
│    ├── models/          # freezedを使用したmodelのファイルを格納
│    ├── repository/      # 例外処理を行うファイルを格納
│    ├── router/          # ルーターを定義
│    ├── typedefs/        # typedefsを記述するファイルを格納
│    ├── ui_core/         # 共通する画面の構成要素のファイルを格納
│    ├── view/            # 画面に関わるファイルを格納
├── .gitignore            # Git無視ファイル
├── analysis_options.yaml # エラー無視ファイル
├── COMMAND.md            # 使用コマンドファイル
├── pubspec.yaml          # 依存関係ファイル
├── pubspec.lock          # 依存関係ロックファイル
└── README.md             # このREADMEファイル
```