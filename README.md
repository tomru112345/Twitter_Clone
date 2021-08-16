# README

今回の Open Hack U で行うことを記したりコードを載せたりします

## 環境構築

以下のソフトウェアをインストールすることで基本的な rails の web サーバを起動できます

### Ruby install

* [Rubyのダウンロードとインストール](https://www.javadrive.jp/ruby/install/index1.html)

### Ruby on Rails install

* [Railsをインストールする](https://www.javadrive.jp/rails/install/index1.html)

### SQLite3 install

* [RailsからSQLite3を利用できるようにする](https://www.javadrive.jp/rails/install/index2.html)

### Node.js install

* [Node.jsをインストールする](https://qiita.com/sefoo0104/items/0653c935ea4a4db9dc2b)

### Yarn install

* [Yarn を導入しよう（Windows）](https://qiita.com/kurararara/items/21c70c4adfd3bb323412)

### webpacker install

```bash
rails new [app name]
```

webpackerをインストールする

```bash
rails webpacker:install
```

### サーバを起動

web サーバを起動する

```bash
rails s
```

http://localhost:3000 にアクセス

以下のように表示される

![初回起動](./img/rails01.png)

## コントローラのアクションの追加

Application コントローラに hello を追加

* app/controllers/application_controller.rb

```rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "hello, world!"
  end
end
```

* config/routes.rb 内の設定変更で、表示したいアクションを変更できる

```rb
Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://railsguides.jp/routing.html
end
```

以下のように変更してみる

```rb
Rails.application.routes.draw do
  root 'application#hello'
end
```

これで上記同様、アクセス

以下のような表示になっている

![デフォルトの表示を変更](./img/rails02.png)

## [TODO] Railsアプリのカスタマイズ

### ビューおよびコントローラーの作成

```bash
rails g controller users index show
```

次のようなファイルが自動生成

```bash
app/controllers/users_controller.rb
app/views/users/index.html.erb
app/views/users/show.html.erb
```

## 参考資料

* [Ruby 入門](https://www.javadrive.jp/ruby/)

* [Ruby on Rails チュートリアル全まとめ(解説・単語・演習)](https://qiita.com/bitcoinjpnnet/items/c43a87eca6313ad1903f)
