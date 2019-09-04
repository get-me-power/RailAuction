# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
**2.5.0**

## Execution method if you don't want install global gem

1. do git clone

2. Adjust ruby version (2.5.0)

3. `$ gem install bundler`

4. `$ bundle install --path vendor/bundle`

5. `$ bundle exec rails db:migrate`

6. `$ bundle exec rails s`

## TODO

- [ ] オークションの新規投稿で商品に設定している最低価格より上回る価格でないと投稿できないようにする
- [ ] オークションの新規投稿で他のオークションの投稿の中で最高の価格より上回る価格でないと投稿できないようにする
- [x] オークションの締め切り時間と現在の時間の差を表示する
- [ ] オークションの落札者と入札者のチャット機能を生成する
