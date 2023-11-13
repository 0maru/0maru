画像貼る

## 1. 基調講演

@najeira

Flutter をリリースから8年間を遡る  
今の書き方との違いや今後の発展について

## 2.  テスト戦略の見直し

CA / @ostk0069

WINTICKETでの自動テストの導入プロセスについて
から自動テストの導入について

テストツールの選定

- Autify for Mobile
- Maestro
- integretion_test

状態が多いのでUIの変更が多い -> カスタマイズ性が高いものが望ましい


### E2Eテストの目的は?
QCは新規コードを対象にチェックしている
E2Eテストは既存コードの差分、依存関係の更新を対象に

### test matrix
テストの注力する場所を分析する

- 端末、OSによる差ができくい
- データを表示するだけでロジックがない
といったページはテストの優先度を下げる

### Robot pattern

アプリ起動 -> ログイン -> ログイン成功メッセージが見える
シナリオがあったときに

RobotLogic を作成し抽象化する
例えばLoginFlowDriver ようにログインが必要なE2Eテストで簡易的にかける

PageDriver Class, Page Finder class

### OSのネイティブUIにアクセス出来るようにする

Patrol / LeanCode

### TCP (Test Case Prioritization)

1. 売上への影響
2. 信用へのリスク
3. 手動だと負荷が高い
4. 実装コスト

などの指標

### Firebase Test Labs の採用
num-flaky-test-attempts の利用

## E2Eテストの実行頻度
PR毎では問題が多い
毎日午前にテストするように切り替えた

## まとめ

テストは大切だが、プロダクトやチームに合わせて柔軟に変更する
インテグレーションテストは負荷が高いが、便利なツールはある

##  出前館におけるFlutterの現在とこれから

出前館 / 前田さん（@）
チーム規模アプリエンジニア２０人


## Dart Frog x melos

YUMEMI / もぐもぐ、k9i

### Dart Frog

shelf をラップしたFW
Provider というmiddleware が使える

### 使ってみて

BFF 程度ならなんとでもなる

## Dart でコード生成

## Flutter で構築する漫画ビューア

excite

EdgeToEdge で時計とかを消す
自動通知は出来ないのでinitState でSystemChrome で検知する

SystemUiMode.immersiveSticky がおすすめ
いい感じに消えたりしてくれる

isolate.run で画像描画の効率化

## なぜわれわれはRiverpod を使うのか

ちゅーやん

### autoDispose

依存されえれいないかはリビルドごとに判定される
Riverpod は問題を解決するために作られているので乗っかって使いうといいよね
