# Visual Stduio に行った設定もろもろ

<!-- TOC tocDepth:2..3 chapterDepth:2..6 -->

- [Visual Stduio に行った設定もろもろ](#visual-stduio-に行った設定もろもろ)
  - [1. フォント](#1-フォント)
  - [2. 設定](#2-設定)
  - [3. 画面構成](#3-画面構成)
  - [4. キーバインド](#4-キーバインド)
  - [5. 拡張機能](#5-拡張機能)
    - [5.1. VSColorOutput64](#51-vscoloroutput64)

<!-- /TOC -->

## 1. フォント

[環境] -> [フォントおよび色]

| 項目               | フォント              | サイズ | 備考                                                              |
| :----------------- | :-------------------- | :----: | :---------------------------------------------------------------- |
| 環境               | Segoe UI              |   10   |                                                                   |
| テキストエディター | HackGen               |   12   | スケール93%                                                       |
| ターミナル         | HackGen35 Console NF  |   10   |                                                                   |
| 出力ウィンドウ     | Cascadia Code         |   10   |                                                                   |
| CodeLens           | HackGen35 Console NFJ |   10   | Dark+V2(標準・無効:RGB(204, 204, 204), ホバー:RGB(241, 241, 241)) |

## 2. 設定

- プロジェクトおよびソリューション
  - 全般
    - アクティブな項目をソリューションエクスプローラー
- 環境
  - タブ
    - タブとウィンドウ
      - 既存のタブの右側に新しいタブを挿入する
      - タブの最大値：500
      - 複数の行にタブを表示する
      - ~~ドキュメントタブの色分け基準~~
        - Dark+ V2 テーマにて適用解除
- テキストエディター
  - C/C++,C#,XML,XAML
    - インデント
      - スマート
    - タブのサイズ：4
      - XMLのみ2
    - インデントのサイズ：4
      - XMLのみ2
    - ~~タブの保持(C++のみ)~~
    - 空白の挿入 ~~(C++以外)~~
      - C++も空白の挿入に変更
  - XML
    - 全般
      - 行番号：チェック
  - C/C++
    - コードスタイル
      - 書式設定
        - インデント
          - caseの内容をインデントする：チェック
          - caseラベルをインデントする：チェック
        - 改行
          - 名前空間の始めかっこの位置：新しい行へ移動
          - 型の始めかっこの位置：新しい行へ移動
          - 関数の始めかっこの位置：新しい行へ移動
          - コントロール ブロックの始めかっこの位置：新しい行へ移動
          - ラムダの始めかっこの位置：新しい行へ移動
          - 範囲の左中かっこの位置：別の行に中かっこを配置する（チェック）

## 3. 画面構成

- Left
  - Top
    - ソリューションエクスプローラー
    - ドキュメントアウトライン
    - リソースビュー
    - Git 変更
  - Bottom
    - プロパティ
- Bottom
  - 出力
  - エラー一覧
  - 開発者用PowerShell
  - ブレークポイント
  - テストエクスプローラー
  - シンボルの検索結果

## 4. キーバインド

| key                         | コマンド                                            | 使用する場所                                                   | 削除 | 備考                        |
| :-------------------------- | :-------------------------------------------------- | :------------------------------------------------------------- | :--: | :-------------------------- |
| Home                        | 編集.行頭に移動                                     | テキストエディター                                             |      |                             |
| End                         | 編集.行末に移動                                     | テキストエディター                                             |      |                             |
| Ctrl + P                    | 編集.1行上へ                                        | 全体/テキストエディター                                        |      | インテリセンス選択          |
|                             | 編集.Emacsの1行上へ                                 |                                                                |  〇  |                             |
| Ctrl + N                    | 編集.1行下へ                                        | 全体/テキストエディター                                        |      | インテリセンス選択          |
|                             | 編集.Emacsの1行下へ                                 |                                                                |  〇  |                             |
| Ctrl + H                    | 編集.後退削除                                       | 全体                                                           |      |                             |
|                             | 編集.置換                                           | 全体                                                           |  〇  |                             |
| Ctrl + U                    | 編集.BOLまで削除                                    | テキストエディター                                             |      |                             |
|                             | 編集.Emacsのユニバーサル引数                        |                                                                |  〇  |                             |
| Ctrl + G                    | ウィンドウ.ドキュメントウィンドウをアクティブにする | 全体                                                           |      |                             |
|                             | 編集.選択範囲の取り消し                             | テキストエディター/マネージドリソースエディター/設定デザイナー |      |                             |
|                             | 編集.Emacsの終了                                    |                                                                |  〇  |                             |
| Ctrl + ;                    | 編集.ToggleComment                                  | 全体                                                           |      |                             |
|                             | 編集.最後に戻った場所まで選択                       | テキストエディター                                             |  〇  |                             |
| Ctrl + Shift + ;            | 編集.ToggleCommentDouble                            | 全体                                                           |      |                             |
| Shift + Space               | 編集.入力候補                                       | 全体                                                           |      | インテリセンスの手動起動    |
| Shift + Home                | 編集.行頭まで拡張                                   | テキストエディター                                             |      |                             |
|                             | 編集.Emacsのドキュメントの開始位置に移動            | テキストエディター                                             |  〇  |                             |
| Shift + End                 | 編集.行末まで拡張                                   | テキストエディター                                             |      |                             |
|                             | 編集.Emacsのドキュメントの終了位置に移動            | テキストエディター                                             |  〇  |                             |
| Shift + Alt + F             | 編集.ドキュメントのフォーマット                     | 全体                                                           |      |                             |
| Shift + Alt + K             | 編集.選択範囲のフォーマット                         | 全体                                                           |      |                             |
| Ctrl + Shift + Alt + 下矢印 | 編集.1行下まで列を拡張                              | テキストエディター                                             |      |                             |
| Ctrl + Shift + Alt + 上矢印 | 編集.1行上まで列を拡張                              | テキストエディター                                             |      |                             |
| F2                          | 編集.名前の変更                                     | 全体                                                           |      |                             |
|                             | 編集.次のブックマーク                               | テキストエディター                                             |  〇  |                             |
| F3                          | 編集.次の強調表示された参照                         | テキストエディター                                             |      |                             |
| Shift + F3                  | 編集.前の強調表示された参照                         | テキストエディター                                             |      |                             |
| F7                          | ビルド.選択範囲のビルド                             | 全体                                                           |      |                             |
|                             | ビルド.ソリューションのビルド                       | 全体                                                           |  〇  |                             |
| Shift + F12                 | 編集.すべての参照を検索                             | 全体                                                           |      |                             |
|                             | 編集.参照へジャンプ                                 | 全体                                                           |  〇  |                             |
| Alt + /                     | 編集.やり直し                                       | 全体                                                           |      |                             |
|                             | 編集.入力候補                                       | テキストエディター                                             |  〇  |                             |
| Ctrl + Shift + /            | 編集.やり直し                                       | 全体                                                           |      |                             |
|                             | 編集.ブロックコメントの切り替え                     | テキストエディター                                             |  〇  |                             |
| Ctrl + Tab                  | ウィンドウ.次のタブ                                 | 全体                                                           |      |                             |
|                             | ウィンドウ.次のドキュメントウィンドウ               | 全体                                                           |  〇  |                             |
| Ctrl + Shift + Tab          | ウィンドウ.前のタブ                                 | 全体                                                           |      |                             |
|                             | ウィンドウ.前のドキュメントウィンドウ               | 全体                                                           |  〇  |                             |
| Ctrl + X, 2                 | ウィンドウ.新規の水平方向のドキュメントグループ     | 全体                                                           |      |                             |
|                             | 編集.Emacsの左右に分割                              | テキストエディター                                             |  〇  |                             |
| Ctrl + X, 3                 | ウィンドウ.垂直方向のドキュメントグループの新規作成 | 全体                                                           |      |                             |
| Ctrl + X, O                 | ウィンドウ.次のドキュメントウィンドウ               | 全体                                                           |      |                             |
| Ctrl + X, Ctrl + F          | ファイル.ファイルを開く                             | テキストエディター                                             |      |                             |
| Ctrl + X, Ctrl + C          | ファイル.終了                                       | 全体                                                           |  〇  |                             |
| Ctrl + X, Ctrl + Y          | 編集.スニペットの挿入                               | 全体                                                           |      |                             |
| Ctrl + X, Ctrl + V          | ウィンドウ.新規ウィンドウ                           | 全体                                                           |      |                             |
| Ctrl + Q                    | 編集.Emacsの引用符付きで挿入                        | テキストエディター                                             |  〇  | 検索窓を使用できるように    |
| Ctrl + Shift + -            | 表示.次に進む                                       | 全体                                                           |      | Ctrl + - で 表示.戻る(全体) |
| Ctrl + Shift + -            | 編集.元に戻す                                       | 全体                                                           |  〇  |                             |
| Alt + 左矢印                | 表示.戻る                                           | 全体                                                           |      |                             |
| Alt + 左矢印                | 表示.前へ                                           | 全体                                                           |  〇  |                             |
| Alt + 左矢印                | 編集.Emacsの前の単語へ移動                          | テキストエディター                                             |  〇  |                             |
| Alt + 右矢印                | 表示.次に進む                                       | 全体                                                           |      |                             |
| Alt + 右矢印                | 表示.次へ                                           | 全体                                                           |  〇  |                             |
| Alt + 右矢印                | 編集.Emacsの次の単語へ移動                          | テキストエディター                                             |  〇  |                             |

## 5. 拡張機能

- CleanBinAndObj
- Color Picker (x64)
  - 拡張子を追加
    - c, cpp, h, hpp
  - Color Swatcher を "ColorBox-Left"に設定
- CppTripleSlash
- Customize VS Window Title
  - 表示設定
    - `[solutionName] - [projectName]`
- File Path On Fotter
  - Customize VS Window Title でも代替できそう
- Format on Save for VS2022
  - [Fromat document] -> [Denied extensions..]
    - `.csproj .wapproj .shproj`
- Open in Visual Stduio Code
- Restart Visual Studio for vs2022
- ResXManager
- Solution Error Visualizer 2022
- Toggle Comment 2022
  - Ctrl + ;とCtrl + Shift + ;に割り当て
- Visafora
  - [General] -> [Keyword Highlight]をすべてFalse
  - [Rainbow Brace] -> [Rainbow Depth]を6に設定
  - braceの色付けをVSCodeと同じRainbowに変更
    - 6色まででよい
- Visual Studio Theme Pack
  - テーマ：Dark+
- VSColorOutput64
  - [ツール] -> [オプション] から"Build Text"を"Silver"に変更

### 5.1. VSColorOutput64

設定ファイル：%AppData%/VSColorOutput64/vscoloroutput.json

RegEx Patterns デフォルト値

| No. | ClassificationType | IgnoreCase | RegExPattern                                                                                       |
| :-: | :----------------: | ---------- | -------------------------------------------------------------------------------------------------- |
|  0  |     LogCustom1     | False      | `\+\+\+\>`                                                                                         |
|  1  |     BuildText      | False      | `.*[t\|c]sc\.exe.*`                                                                                |
|  2  |     BuildHead      | False      | `(=====\|-----\|Projects build report\|Status    \\| Project \[Config\\|platform\])`               |
|  3  |     BuildHead      | True       | `0 error.+0 warning`                                                                               |
|  4  |     BuildHead      | True       | `^\s*0 error\(s\)\s*$`                                                                             |
|  5  |     BuildHead      | True       | `^\s*0 warning\(s\)\s*$`                                                                           |
|  6  |     BuildHead      | True       | `0 failed\|Succeeded`                                                                              |
|  7  |      LogError      | True       | `(\W\|^)^(?!.*warning\s(BC\|CS\|CA)\d+:).*((?<!/)error\|fail\|crit\|failed\|exception)[^\w\.\-\+]` |
|  8  |      LogError      | True       | `(exception:\|stack trace:)`                                                                       |
|  9  |      LogError      | True       | `^\s+at\s`                                                                                         |
| 10  |     LogWarning     | True       | `(\W\|^)(warning\|warn)\W`                                                                         |
| 11  |   LogInformation   | True       | `(\W\|^)(information\|info)\W`                                                                     |
| 12  |      LogError      | True       | `Could not find file`                                                                              |
| 13  |      LogError      | True       | `failed`                                                                                           |

0. `"\+\+\+\>",LogCustom1,False`
1. `".*[t|c]sc\.exe.*",BuildText,False`
2. `"(=====|-----|Projects build report|Status    \| Project \[Config\|platform\])",BuildHead,False`
3. `"0 error.+0 warning",BuildHead,True`
4. `"^\s*0 error\(s\)\s*$",BuildHead,True`
5. `"^\s*0 warning\(s\)\s*$",BuildHead,True`
6. `"0 failed|Succeeded",BuildHead,True`
7. `"(\W|^)^(?!.*warning\s(BC|CS|CA)\d+:).*((?<!/)error|fail|crit|failed|exception)[^\w\.\-\+]",LogError,True`
8. `"(exception:|stack trace:)",LogError,True`
9. `"^\s+at\s",LogError,True`
10. `"(\W|^)(warning|warn)\W",LogWarning,True`
11. `"(\W|^)(information|info)\W",LogInformation,True`
12. `"Could not find file",LogError,True`
13. `"failed",LogError,True`
