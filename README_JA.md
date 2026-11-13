# no-three-in-line：1.501nの計算機援用証明稿と部分的Lean形式化

十分大きいすべての整数 `n` について、`n × n` 整数格子から3点共線を含まずに `ceil(1.501 * n)` 点以上を選べる、という計算機援用証明を英語稿で提示しています。AIを大きく利用した趣味の研究で、著者名は付けていません。原稿は未査読です。

**[英語PDF](docs/paper/481-phase/output/pdf/no_three_in_line_481_en.pdf)** · **[逆ランク205を再現](docs/REPRODUCING.md#reproduce-reverse-rank-205)** · **[原稿・入力・検証器のZIP](docs/paper/releases/no_three_line_481_complete_en_20261110.zip)** · **[English](README.md)**

LinuxまたはWSLで検証器をビルドし、逆ランク205の542セルを再計算できます。481フェーズの中で、記録された角度上界が最大のセルを含むフェーズです。

全件再計算では **481フェーズ、正の重みを持つ242,176個の型付きセル**が合格し、受理された481個のCSVが元の記録とバイト単位で一致しました。[論文と検証資料](docs/paper/README.md)から、編集用の原稿、厳密算術チェック、全件再計算手順、実行記録に進めます。

## Lean形式化

`target_of_archived481_cell_certificate` は、公開入力の正の重みを持つ各セルで角度上界が成り立つと仮定して、`NoThreeLine.Target` を導きます。スケジュール、質量、線の容量、確率論の部分はLeanで接続済みです。無条件の定理に必要な角度証明書の認証が残っています。[条件付き定理](NoThreeLine481/Archived481.lean) · [形式化の進捗とコンパイル記録](docs/FORMALIZATION_481.md)

監査済み3,242モジュールは初期のLeanスナップショットの範囲です。旧15,348フェーズ構成の進捗は[状態ページ](STATUS.md)、481フェーズ版のコードは[`NoThreeLine481`](NoThreeLine481/)にあります。

## ビルドと参加

Elan、Git、固定されたLeanの依存関係を用意すると、`lake build NoThreeLine.Target NoThreeLine.AffineBranch` で小さなモジュールから確認できます。[Leanのセットアップとビルド手順](docs/REPRODUCING.md#first-lean-build-on-a-new-machine) · [Leanの読み始めに向くモジュール](docs/REPRODUCING.md#lean-reading-paths)

[参加ガイド](CONTRIBUTING.md) · [研究ノート](docs/research-notes/README.md) · [更新履歴](CHANGELOG.md) · [AI使用](AI_USAGE.md) · [MITライセンス](LICENSE)
