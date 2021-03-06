UITableView周りのサンプル問題

# 1.API送信とマッピング(目安時間：60分)
GitHubのリポジトリを検索するAPI(https://api.github.com/search/repositories) を利用して、  
取得したデータをモデルにマッピングしてください。  
検索する文字列は適当に設定してください。  
モデルクラスに対しテストコードを作成してください。  

テストコードの妥当性、テストの成功を確認します。  

## マッピングする要素

- total_count
- items

items内

- full_name
- url(NSURL型で取得すること)
- created_at(NSDate型で取得すること)
- stargazers_count

[APIリファレンス](https://developer.github.com/v3/search/#search-repositories)

# 2.コンテンツの表示(目安時間：30分)  
検索結果をテーブルビューに表示してください。  
セルの表示項目はリポジトリの名前(full_name)とスター数とします。  
検索する文字列は適当に設定してください。  
ページング機能は、ここでは考慮しなくて構いません。  

セルにリポジトリ名とスター数が表示されていることを確認します。  

# 3.ページング機能の追加(目安時間：20分)
APIにpageパラメータ(Int型)を追加し、  
テーブルビューの一番下を表示したタイミングで次のページのAPIを送信し、  
テーブルビューに追加で表示してください。  

- データが追加で読み込まれること
- ページに重複、欠落がないこと
- 最後まで読まれたらそれ以上読み込まないこと

を確認します。

# 4.Pull To Refresh 機能の追加(目安時間：10分)
テーブルビューにPullToRefresh機能を追加し、  
画面をリフレッシュしてください。  

1ページ目が表示されることを確認します。  

# 5.(Advance)インクリメンタルサーチ機能の追加
検索窓を表示し、インクリメンタルサーチでの検索結果をリアルタイムに反映させてください。  

検索結果がリアルタイムで表示されることを確認します。
