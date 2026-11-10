# no-three-in-line：1.501nの計算機援用証明稿と部分的Lean形式化

[36ページの英語論文](docs/paper/481-phase/output/pdf/no_three_in_line_481_en.pdf)で、十分大きいすべての整数nについて、n×n整数格子内に3点共線を含まない `ceil(1.501*n)` 点以上の集合が存在する、という計算機援用証明を提示しています。論文の具体的な481フェーズ入力は、全件を新たに再計算して検証しました。**Lean上の `NoThreeLine.Target` は引き続き未証明です。**

AIを大きく利用した趣味の研究プロジェクトです。著者名は付けず、独立した人間による査読は受けていません。数学的な証明稿・有限計算の実行検証・部分的な形式化の範囲を区別して公開します。

[English](README.md) · [論文とダウンロード](docs/paper/README.md) · [現在地](STATUS.md) · [Lean再現手順](docs/REPRODUCING.md) · [AI使用](AI_USAGE.md)

## 論文を読む・計算を再現する

- [英語PDF：第0.2版、481フェーズ構成](docs/paper/481-phase/output/pdf/no_three_in_line_481_en.pdf)
- [PDF・編集可能な原稿・入力・検証器・実行証跡をまとめたZIP](docs/paper/releases/no_three_line_481_complete_en_20261110.zip)
- [同梱内容と再現コマンド](docs/paper/481-phase/README.txt)
- [新規全件実行の記録](docs/paper/481-phase/verification/evidence/EXECUTION_PROVENANCE.json)と[有限検証の結果](docs/paper/481-phase/verification/evidence/FINAL_REPORT.json)

Leanを読まずに、過程の定義、保存信用の恒等式、一様な格子比較、共通停止を含むモーメント評価、五つの停止原因、具体的入力、最後の有理数比較まで追える英語稿です。入力質量は `3842853135627/2560000000000 = 1.501114506104296875`。固定次数と固定損失予算で結論へ接続し、nの偶奇や可除性を仮定しません。最終定理が成立し始める数値的なnの閾値や、小さい盤面での実用的生成保証は示していません。

新しい入力は **481フェーズ・242,176型付きセル**です。キャッシュされたフェーズ結果を使わずに検証器をビルドし、全角度計算を再実行しました。記録されたGCC 13.3.0・Ubuntu/WSL・4スレッド環境では **1,355.4秒（約22.6分）**で全フェーズを受理し、受理された481個のCSVは元資料とすべてバイト単位で一致しました。容量144行・無限方向用6上界、有限な時計定数、被覆と報告の整合性も確認しています。[比較記録](docs/paper/481-phase/evidence/replay_comparison.json)を同梱しています。

これは旧15,348フェーズ候補とは別の有限構成です。[旧31ページの条件付き英語稿](docs/paper/output/pdf/no_three_in_line_proof_draft_en.pdf)も履歴として残していますが、その「具体入力の検証が未完」という状態は新版を表しません。

## 三つの確認範囲

| 対象 | 現在の範囲 |
| --- | --- |
| 英語の数学的証明稿 | 通常の数学的議論と有限な厳密計算を合わせ、十分大きいnでの1.501n下界を証明する稿です。確率論の部分は自然言語の証明であり、数値検証器の実行だけで認証されるものではありません。 |
| 有限計算 | 新入力の全481フェーズ・242,176型付きセルと容量条件を、新規ビルドした検証器で全件再計算しました。入力・ソース・実行ファイルのhash、コマンド、終了コードも記録しています。 |
| Lean形式化 | 固定された3,242モジュールに局所・条件付き定理を収録しています。最終的な `Target` と新しい481フェーズ構成全体の形式化は未完成です。 |

独立した人間による査読や、全体のLean認証が済んだとは主張しません。hashは対象ファイルの同一性を記録し、数学的な正しさや証明検査の代わりにはしません。

## Lean形式化の現在地

[Target.lean](NoThreeLine/Target.lean)は、十分大きいすべてのnについて合法な集合Sがあり、`1501*n ≤ 1000*S.card` を満たすという目標を定義しています。今回の論文追加でLeanソースは変更していません。

Leanの監査基準は **2026年11月10日00:22 JST**です。ソースとコンパイル記録が一致し、依存先も収録した **3,242モジュール・839,734行**を公開しています。未検証の33モジュールは完成済みコードとして含めていません。これらの数は最終定理の完成率ではありません。

過去のスナップショット更新で94モジュールが加わり、[一フェーズの集中評価](NoThreeLine/ProtectedCellOnePhasePowerTail.lean)、[時計停止の評価](NoThreeLine/FrozenClockCauseSmall.lean)、[五原因からの条件付き1.501n出力](NoThreeLine/FrozenFiveCauseOutput.lean)まで進みました。そこで要求される具体入力の仮定をLean上ですべて満たす作業は残っています。

旧15,348フェーズ路線では、ベンチマークのphase 15301について80個の標準葉のうち20個と、その対称像80個を形式化しています。低高さ容量行は99/112です。新しい481フェーズの外部検証が完了しても、このLean上の被覆数は増えません。[現在地と残る仮定](STATUS.md)に詳しく記載しています。

## Leanを読む・ビルドする

1. [Target](NoThreeLine/Target.lean)：量化子と整数の点数不等式。
2. [Concrete](NoThreeLine/Concrete.lean)：実矩形から積分上界・正の余裕を得る小さな具体例。
3. [FrozenFiveCauseOutput](NoThreeLine/FrozenFiveCauseOutput.lean)：最終出力までを接続する条件付き定理。
4. [再現手順](docs/REPRODUCING.md)：固定版・限定ビルド・全体ビルドの範囲。
5. [参加する際の入口](CONTRIBUTING.md)：固定Leanスナップショットを改善する作業候補。

Elan、Python 3.11以上、Gitと固定依存関係が利用できる環境で、まず次を実行できます。

```text
python scripts/verify_snapshot.py
lake update
lake exe cache get
lake build NoThreeLine.Target NoThreeLine.AffineBranch
lake build NoThreeLine.Concrete
```

Leanは4.32.2、mathlibは `905b95818eb32af7874a58b427f50c1711a5e96c` に固定しています。全3,242モジュールを別環境で新規一括再コンパイルしたわけではなく、過去のコンパイル証跡と限定的な再ビルドを区別しています。今回完了したC++/Pythonの全件再計算とは別の確認です。論文の有限検証はLeanなしで[再現できます](docs/paper/481-phase/README.txt)。

## 利用と継続

趣味として進めるプロジェクトで、専門家への連絡は予定していません。コードと文書は[MITライセンス](LICENSE)で利用でき、フォークして改善・引き継ぎできます。ライセンス表示を保持し、AI使用を実態に沿って明記してください。数学・実装・検算・編集へのAIの関与は[AI_USAGE.md](AI_USAGE.md)と論文に記載しています。著者名・所属・個人の連絡先は付けていません。
