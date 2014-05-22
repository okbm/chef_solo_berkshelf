# メモ的なもの
----

## 環境構築に必要なもの
- Vagrant
- chef-solo
- berkshelf

### chefやらを使うためのPC側のset up(メモメモ)
- [Download Vagrant ](http://www.vagrantup.com/downloads.html)
    - 最新の使ったほうが事故らない気がする（berkshelfで詰まった）
    
```
$ sudo gem update --system
$ sudo gem install bundler

$ sudo gem install bundler
$ bundle -v
-bash: bundle: command not found 
$ echo 'export PATH="$HOME/.rbenv/versions/2.0.0-p0/bin:$PATH"' >> ~/.bashrc

$ bundle -v
Bundler version 1.6.2

$ vi Gemfile
source "https://rubygems.org"

gem 'chef'
gem 'knife-solo', '>= 0.3.0.pre5'
gem 'berkshelf'

$ sudo bundle install
$ berks -v
/Users/home/.rbenv/versions/2.0.0-p0/lib/ruby/site_ruby/2.0.0/rubygems/core_ext/kernel_require.rb:126:in `require': cannot load such file -- hitimes/hitimes (LoadError)
    from /Users/okabe-m/.rbenv/versions/2.0.0-p0/lib/ruby/site_ruby/2.0.0/rubygems/core_ext/kernel_require.rb:126:in `require'
    ~~ 途中略 ~~~
    
$ sudo bundle update 
$ berks -v
3.1.2
$ vagrant plugin install vagrant-omnibus
$ vagrant plugin install vagrant-berkshelf --plugin-version=2.0.1
$ vagrant plugin install vagrant-berkshelf --plugin-version '< 2.0' # vagrantのバージョンが1.5以下だったら、こっちらしい
```

### レシピ
```
$ cd site-cookbooks
$ berks cookbook base
$ vim base/recipes/default.rb 

```

#### 参考URL
- [bundler - bundleコマンドにパスが通っていなかったときの対処法 - Qiita](http://qiita.com/hyshhryk/items/7e728ad57d963454b142)
- [bundleコマンドでCould not find bundlerエラー | それなりブログ](http://blog.kjirou.net/p/1587)
- [chef-solo - Chefを読んで実行するための全知識 - Qiita](http://qiita.com/TsuyoshiUshio@github/items/89030baca68b05a9783d)[chef-solo - Chefを読んで実行するための全知識 - Qiita](http://qiita.com/TsuyoshiUshio@github/items/89030baca68b05a9783d)



## install

- debian
- Apache
- php
- mysql
- vim
- tmux
- tig
- git
- zsh
