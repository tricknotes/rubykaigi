# -*- coding: utf-8 -*-
%w(time_slits events rooms event_rubyists event_rooms event_time_slits).each do |t|
  conn = ActiveRecord::Base.connection
  conn.execute("truncate #{t};")
  conn.execute("alter table #{t} auto_increment = 1;")
end

# time_slit
[Time.zone.parse('2010/8/27 9:30'), Time.zone.parse('2010/8/28 9:30'), Time.zone.parse('2010/8/29 9:30')].each do |start_time|
  t, end_time = start_time, 10.hours.since(start_time)
  while t < end_time
    TimeSlit.create :start_at => t, :end_at => 30.minutes.since(t)
    t += 30.minutes
  end
end

# room: name_en: string, name_ja: string, floor_en: string, floor_ja: string, sort_order: integer
big = Room.create :name_en => 'Main Convention Hall', :name_ja => '大ホール', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 1
medium = Room.create :name_en => 'Convention Hall 200', :name_ja => '中ホール200', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 2
b202 = Room.create :name_en => '202-B', :name_ja => '202-B', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 3
a202 = Room.create :name_en => '202-A', :name_ja => '202-A', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 4
b201 = Room.create :name_en => '201-B', :name_ja => '201-B', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 5
a201 = Room.create :name_en => '201-A', :name_ja => '201-A', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 6
foyer = Room.create :name_en => 'Foyer', :name_ja => 'ホワイエ', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 7


# event
EventLoader.with_options(:day => 27) do |e27|
  e27.with_options(:room => big) do |e27_big|
    e27_big.create :title => 'Opening', :from => '12:30'
    e27_big.create :title => 'Keynote', :title_ja => '基調講演', :speaker => 'Jeremy Kemper ', :from => '13:00', :to => '14:00'
    e27_big.create :title => 'jpmobile on Rails 3', :title_ja => 'jpmobile on Rails 3 の作り方', :speaker => 'Shin-ichiro OGAWA (Tokyu.rb / Nihon Ruby no Kai)', :from => '14:00', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Jpmobile is the Rails plugin for Japanese mobile phones. This plugin consists of a several convertions including Japanse emoticons, Japanese kanji codes, and the session managiment of some mobile phones which can't handle Cookie. In this talk, I will introduce how we rebuild the jpmobile codes, in order to support Rails 3 and Rack applications(Sinatra, etc.).
ABSTRACT
jpmobile を Rails 3 や Sinatra に対応させるまでの道のりを紹介。Rack化や絵文字やデコメへの対応などを、どのようにRailsをハックしたかとともに紹介します。
ABSTRACT_JA
    e27_big.create :title => 'Open social application development for cell-phones to begin in Ruby on Rails', :title_ja => 'Ruby on Railsではじめる携帯電話向けオープンソーシャルアプリケーション開発', :speaker => 'Masaki Yamada (Control plus Co. Ltd.)', :from => '14:30', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
In the world of the open social application development for cell-phones, PHP is a major language, but the development using Ruby on Rails is possible. I show the know-how which we got through development of our product \"Sweets Collection\" and introduce open social application development using Ruby on Rails.
ABSTRACT
携帯電話向けのオープンソーシャルアプリケーション開発の世界では、PHPがメジャーな言語ですが、Ruby on Railsを使った開発も可能です。私達が自社プロダクト「スイーツコレクション」の開発を通じて得たノウハウを公開するとともに、Ruby on Railsを使ったオープンソーシャルアプリケーション開発をご紹介します。
ABSTRACT_JA
    e27_big.create_break :from => '15:00'
    e27_big.create :title => 'Building Real Time Web', :title_ja => 'リアルタイムウェブができるまで', :speaker => 'Makoto Inoue (New Bamboo (London, UK))', :from => '15:30', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA)
The real time web is not about adding chat on your website. It's not really about having stock tickers. The most interesting aspect of the realtime web is to be found in augmenting the web that we already know. We can add realtime functionally to our applications as another layer of fidelity.
This is our story (New Bamboo, London, UK) of experimenting various real time web technologies and coming up with our own solutions (http://www.pusherapp.com). This is not about explaining how to use our solutions, but about sharing exciting opportunities and new technical challenges HTML5 WebSocket brings when you build real time web.
ABSTRACT
ここ最近のAjaxにかわるトレンドとしてリアルタイムウェブを利用した例が見かけられることが多いですが、その多くはチャットや株価更新などのサンプルの域をでないように見えます。弊社New Bamboo (London, UK)では、既存のリアルタイム技術をいろいろ研究した結果をPusher (http://www.pusherapp.com)というサービスとしてリリースしました。このトークでは、リリースにいたるまでの経緯をご紹介すると共に、HTML5 WebSocketを使うことによる新しい発見やチャレンジを皆様と共有していきたいと思います。
ABSTRACT_JA
    e27_big.create :title => 'We can make the GC X times slower than the original', :title_ja => 'われわれは、GCをX倍遅くできる', :speaker => 'nari (Network Applied Communication Laboratory)', :from => '16:00', :to => '17:00', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
The presentation introduces the technique and a result about Lazy Sweep GC for CRuby GC. In addition, I introduce the prospects of the future GC improvement.
ABSTRACT
CRubyに対するLazySweepGCの実装方法と結果を紹介する。また、今後のGC改善の展望を述べる。
ABSTRACT_JA
    e27_big.create_break :from => '17:00'
    e27_big.create :title => 'The basis of making DSL with Ruby', :title_ja => 'Rubyで作るDSLの基礎', :speaker => 'Yasuko Ohba (Everyleaf Corporation)', :from => '17:30',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Ruby is well known as a language with which you can create your own DSL easily. Making DSL with Ruby is really easy, but there seem to be many developers who have not tried to make DSL with Ruby by design. In my opinion, there is no clear boundary between 'Useful APIs' and DSL. However, we can always judge whether a code is like DSL or not, that means, we can create DSL by design. In this talk, I'll start by looking into what DSL is and when to use it. After that I'll talk what concepts, habits and techniques you need to make your own DSL, showing typical examples from famous DSL codes like Rails, RSpec and so on.
ABSTRACT
RubyはDSLを作りやすい言語として知られています。実際に、DSLを作るのは簡単です。しかし、Rubyで意識的にDSLを作ったことのある人は意外に少ないのかもしれません。 Rubyで実現するDSLは、「使いやすいAPI」の一形態であり、ここから先がDSLだという明確な境界はありませんが、結果として出来上がったコードがDSL的かどうかは歴然と判断できます。つまり、コードをDSL的にするかどうかは開発者が意図的に選択していける事柄なのです。 本セッションでは、DSLとは何か、どんなときにDSLが有効かからはじめて、RubyでDSLを書く際に必要となる考え方、習慣、そしてテクニックを、 Rails や RSpec といった良く知られたコードを例にして話していきます。
ABSTRACT_JA
    e27_big.create :title => 'Best Imitation of Your Class', :title_ja => '君のクラスの最高の偽物', :speaker => 'Shugo Maeda (Network Applied Communication Laboratory Ltd.)', :from => '18:00', :to => '19:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Ruby's open classes contribute to extensibility of applications such as Ruby on Rails. However, they sometimes cause serious conflicts between class extensions. This talk illustrates problems of open classes, and propose a resolution by which classes can be refined locally.

  Keywords: selector namespace, classbox, context-oriented programming
ABSTRACT
Rubyのオープンクラスは、Ruby on Railsのようなアプリケーションの拡張性に 寄与している。しかし、オープンクラスはクラス拡張間の深刻な衝突を引き起こ すこともある。この発表では、オープンクラスの問題を説明し、クラスを局所的に 変更することができるような解決法を提案する。

  キーワード: selector namespace, classbox, context-oriented programming
ABSTRACT_JA
  end

  e27.with_options(:room => medium) do |e27_medium|
    e27_medium.create :title => 'Feels Like Ruby', :speaker => 'Sarah Mei (Pivotal Labs)', :from => '14:00',:abstract => (<<ABSTRACT)
For a Rubyist, writing Javascript is the worst part of working on a Ruby web application. Those clean, modern UIs are often made possible by incredibly complex Javascript. The helpers inevitably get in the way, and you end up writing most of it by hand.

It is painful.

But you can make writing Javascript code feel more like writing Ruby code. I will show techniques that go beyond \"unobtrusive\" and turn Javascript into a first-class citizen in your Ruby application. Make your Javascript more joyful!
ABSTRACT
    e27_medium.create :title => 'User Experience for Library Designers', :speaker => 'geemus (Wesley Beary)(Engine Yard)', :from => '14:30',:abstract => (<<ABSTRACT)
I've written \"a lot of code\":http://github.com/geemus, both hobby and work, over the last year, and looking back I can't help but think that writing code for yourself is easy; it's writing code for others can be tough. In this session, I'll share some examples of good and bad practices gathered in my years writing code and libraries, and discuss how to get past being too close to the problem. I'll talk specifically about growing your work into something anybody (and hopefully everybody) will use.
ABSTRACT
    e27_medium.create_break :from => '15:00'
    e27_medium.create :title => 'Rubygems, Bundler, and the future', :speaker => 'Carl Lerche (Engine Yard)', :from => '15:30',:abstract => (<<ABSTRACT)
Rubygems has served the community well for many years. However, as applications become more and more complex, certain problems arise. Bundler was created to solve some of those problems and has been evolving rapidly based on community feedback. It's time to look at the current state of affairs and think about Rubygems 2.0. What parts of bundler could be moved upstream and what problems remain to be solved?
ABSTRACT
    e27_medium.create :title => 'Truth and Consequences: Handling Ruby 1.9 Encodings in Rails', :speaker => 'Yehuda Katz (Engine Yard)', :from => '16:00',:abstract => (<<ABSTRACT)
Ruby 1.9 adds support for many different encodings, making it possible to write Ruby web programs that can handle non-English characters well. However, these changes have had many consequences. At the beginning, the new encoding support has introduced much confusion in simple, English-only Rails applications and applications relying heavily on Unicode. Yehuda will explain the common problems caused by the changes, talk about what Rails has done to eliminate many of them, and what the Ruby community can do to make writing internationalized programs easier.
ABSTRACT
    e27_medium.create :title => 'A frog in a well does not know the great sea', :title_ja => '井の中の蛙、大海を知らず', :speaker => 'Sarah Allen (Mightyverse)', :from => '16:30',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA)
When building an application it is easy to forget that most applications today are available globally and used by people who speak many languages. You may create user interface in English or Japanese, but people may choose to type their data in their native language. Web browsers will allow people to enter text in almost any script, and if you are lucky it will \"just work\" ... but often it needs a little more attention. Sarah will share anecdotes from her adventures building Mightyverse, a multi-lingual database of native language video recordings. She will highlight details of how to get unicode text in and out of a database well as how to handle multibyte text in Ruby.
ABSTRACT
アプリケーションを構築する時、ほとんどのアプリケーションが今日グローバル的に使用されること、多国語を話す人々に使用されること忘れがちになってしまいます。あなたは、英語や日本語のユーザーインターフェイスを制作するかもしれません。でも、人々は母国語でデーターを記入することを選ぶかもしれません。ウェブブラウザは、ほぼすべてのスクリプトを記入することを可能にします。もし、あなたがラッキーなら、それはなんとか機能するかもしれません。しかし、しばしば、それはもう少し注意を必要とします。サラは、ネイティブスピーカーのビデオを使用した多国語データーベースのMightyverseを構築する経験からの逸話を共有するでしょう。　サラは、どのようにしてUnicodeテキストをデータベースに出し入れするのかの詳細に重点をおきます。また、Rubyでどのようにマルチバイトテキストを扱うかにも重点をおきます。
ABSTRACT_JA
    e27_medium.create_break :from => '17:00'
    e27_medium.create :title => '1.9 on 1.8', :speaker => 'ujihisa (HootSuite)', :from => '17:30',:abstract => (<<ABSTRACT)
Topic: RubyGems library \"backports\" and \"sfl\", RubySpec, and Rubinius.

There's no doubt that all features newly introduced in Ruby 1.9 are really useful. Besides the biggest changes like the introduction of YARV, new methods like Kernel.spawn are also handy. Most Rubyists code in Ruby 1.9, however, they sometimes need to write 1.8 compatible code. Some methods have already been introduced in Ruby 1.8.7, whilst the others were not. For example, `Enumerable#map` without block differs between 1.8 and 1.9.

Fortunately Marc-Andre, one of the ruby committers, is working on solving the issue with his RubyGems library \"backports\". Also, I am working on porting Kernel.spawn to 1.8 on some platforms with the RubyGems library \"sfl\". They are not perfect yet, but we can figure out what's compatible or incompatible.

I'll explain the background, usage and implementation of \"backports\" and \"sfl\", referring RubySpec and Rubinius which played a very important role. I'll demonstrate some pragmatic cases on several Ruby implementations. Throughout the presentation, I'd like to clarify how useful the latest Ruby is.
ABSTRACT
    e27_medium.create :title => 'My many failure products', :speaker => 'jugyo (Everyleaf Corporation)', :from => '18:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
I talk about my many failure products and few successful products. My products is here => http://github.com/jugyo/
ABSTRACT
私のたくさんの失敗プロダクトと少しの成功プロダクトについて話します。 私のプロダクトはここ => http://github.com/jugyo/
ABSTRACT_JA
    e27_medium.create :title => 'Coding for fun, and having fun coding', :title_ja => 'みんなが楽しくプログラミング出来る魔法', :speaker => 'tenderlove (AT&T Interactive)', :from => '18:30',:abstract => (<<ABSTRACT)
Programming for fun, or having fun programming. Ruby is the best language for both! Let's talk about programming after we've punched out from work, the programming we can do while drinking a beer, and the programming we can do to make our friends laugh. We'll take a look at projects built for fun, as well as projects built to have fun! We'll dissect them to figure out what makes them tick, then
extract techniques that we can use with our day to day tasks.
ABSTRACT
  end
  e27.create :title => 'World Wide Ruby Conferences', :title_ja => '世界の Ruby Conference から', :speaker => 'Kuniaki IGARASHI (Everyleaf Corporation)', :room => b202, :from => '17:30', :to => '19:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA)
There are many Ruby/Rails conferences, \"RubyKaigi\"s and Ruby/Rails meetups throughout the world, but we can only participate in a few of these. I'd like to use the \"Lightening Talk\" style to introduce some of the people running these other meetups. You may learn about a new meetup to visit, or give you ideas for your own m0eetup.
ABSTRACT
世界中でたくさんのRuby会議、Ruby/Rails Conference、Ruby/Rails勉強会が行われています。私たちが参加できるのはそのうちのほんの一部です。この時間は世界中の勉強会を運営する方々にLT形式で紹介していただきます。次に行く勉強会を開拓したり、あなたが開催する勉強会の参考にするのはいかがでしょうか？
ABSTRACT_JA
  e27.with_options(:room => a202) do |e27_a202|
    e27_a202.create :title => 'Ruby developer meeting at Tsukuba', :title_ja => 'Ruby開発会議つくば', :speaker => 'Ruby core team', :from => '10:00', :to => '12:30',:abstract => (<<ABSTRACT), :lang => 'ja'
We will hold a meeting about development of Ruby.
ABSTRACT
    e27_a202.create :title => "Monthly 'toRuby' workshop in Tsukuba", :title_ja => '出張版 toRuby勉強会', :speaker => 'Shouichi Nakauchi (toRuby)', :from => '14:00', :to => '16:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Monthly 'toRuby' workshop that always holds in Nasu area comes to here Tsukuba and holds the same workshop as usual. Since we are going to prepare some subject maters, you will be able to enjoy programing Ruby. Please bring your PC for Ruby programing.

The Nasu area is located in an only 150km north direction from Tokyo. Nasu is Tochigi-ken Nasushiobara city formally. 'to' of toTuby is 'To' of Tochigi-ken. Now, we are having programming and a discussion using the book of Mr. Masatoshi Seki's dRuby. Please look at http://pub.cozmixng.org/~the-rwiki/rw-cgi.rb?cmd=view;name=toRuby for details. (This page is Japanese only.) Moreover, also about the contents of our event performed by RubyKaigi, we are going to notify in the above-mentioned website. Thank you.
ABSTRACT
いつも那須方面で開催しているtoRuby勉強会が、つくばに出張してきて、いつものような勉強会を開催します。Rubyを使ったお題を用意するので、参加者みなさんにPCを持参してもらい、手を動かしながらRubyを楽しむ会になります。

toRubyは東京のちょっとだけ北、150kmくらいにある栃木県、那須塩原市で月に一度、勉強会を開催しています。toRubyのtoはとちぎの'と'です。現在は咳さんのdRubyの本を使って、写経やディスカッションをしています。詳細は http://pub.cozmixng.org/~the-rwiki/rw-cgi.rb?cmd=view;name=toRuby をご覧ください。またRubyKaigiでの内容についても、上記Webにて告知していきます。
ABSTRACT_JA
    e27_a202.create :title => 'Head First "Ordinary" System Development', :title_ja => 'Head First ふつうのシステム開発', :speaker => 'Eiwa System Management, Inc.', :from => '16:00', :to => '18:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
We, Eiwa System Management, Inc. are one of the cutting-edge Ruby/Rails company in Japan. We're proud of presenting our way on building Rails application. @pragdave says "agility is part of the fabric of Rails." in his book Agile Web Development with Rails.
However, we need a little bit more tools to improve our Rails projects in the real world. In this sub event, we'll give you live-demo, some commentary on what agile software development is and discussion with audiences.

Keywords: Agile Software Devleopment, Test Driven Development, Scrum, Pivotal Tracker, Ruby on Rails, Bundler, RSpec, Steak, Git, Capistrano
ABSTRACT
『RailsによるアジャイルWebアプリケーション開発』にもあるように「アジリティ(アジャイルであること)は、Railsの骨組みの一部」です。
とはいうものの、実際にプロジェクトを進めるには、Rails以外にももう少し仕掛けが必要です。
この企画では、永和システムマネジメントが普段の受託開発プロジェクトでおこなっている、ふつうのシステム開発のすすめ方をライブ形式でお伝えします。
参加者の皆さまからの疑問・質問にお答えする時間も用意しております。
Railsの良さを活かしたプロジェクトの進め方に興味のある皆さまのご参加をお待ちしております。

キーワード: アジャイル開発、TDD、Scrum、Pivotal Tracker、Ruby on Rails、Bundler、RSpec、Steak、Git、Capistrano、など
ABSTRACT_JA
  end

  e27.with_options(:room => a201) do |e27_a201|
    e27_a201.create :title => 'rake:money', :title_ja => 'rake:money 拡大版', :speaker => 'Ayumu Aizawa / Ouka Yuka (rake:money and RubyKaigi2010 Sponsors)', :from => '14:00', :to => '16:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
The meeting of the IT system engineer to think that I earn money seriously.

I raise awareness of the money, and it is a meeting of the people who want to become the engineer who can earn one's convincible income. I take up marketing and a business trend or a topic about the money that it is not readily possible for in a topic about economy in tax or assets use in the normal technology system study society how I cut one's skill efficiently in imitation Ta'izz.

In the Ruby meeting extension, I make it.
ABSTRACT
真剣にお金を稼ぐことを考えるIT系エンジニアの会。

お金に対する意識を高めて、自分の納得のいく収入を稼げるエンジニアになりたいと考える人たちの会合です。 自分のスキルをどうすれば効率よくマネタイズできるか、マーケティングやビジネストレンド、はたまた節税や資産運用についてなど、普通の技術系勉強会ではなかなか話題にできないお金に関する話題を取り上げます。

Ruby会議拡大版では、Ruby会議スポンサーの各社をパネラーに迎え、Rubyエンジニアに対するビジネスニーズや、企業の中のRubyist がどのようにビジネス価値を発揮していくかといったテーマについてパネルディスカッションを行います。
ABSTRACT_JA
    e27_a201.create :title => 'Ruby Business Owner Kaigi', :title_ja => 'Ruby親方会議', :speaker => 'Takeyuki FUJIOKA (xibbar)(Rabbix corporation / Nihon Ruby no kai)', :from => '16:00', :to => '18:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Ruby's small business owner talk about own working and exchange experience each other.
ABSTRACT
Rubyを使ってスモールビジネスを展開しているビジネスオーナーの情報交換を行います。
ABSTRACT_JA
  end

  e27.create :title => "Let's create your own T-shirt designed by Ruby at RubyKaigi 2010!! / The Origami Ruby (paper craft) Generated by The Ruby", :title_ja => "RubyKaigiで自分だけのrubyTシャツを作ろう！/ Ruby で作る Ruby の折り紙", :speaker => 'Yasuo Yoshikawa (tmix producer) / Hiroyuki Shimura (Nihon Ruby-no-kai (Japan Ruby Group))', :room => foyer, :from => '13:00', :to => '15:30',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Let's create your own T-shirt designed by Ruby at RubyKaigi 2010!!!:
 Let's create your own T-shirt designed by Ruby on tmix! tmix is the only on-demand retail platform for consumers.

 If you can create T-shirt today, you can put on it tomorrow!

 This event open until Aug 27th 15:00 pm . price 1,500en (front or back print only!) White or Black T ,size S,M,L,XL,XXL Cash only.

The Origami Ruby (paper craft) Generated by The Ruby:
 Let's fold origami \"Ruby\" like http://dl.dropbox.com/u/4921720/RubyFoldings/IMG_0362.A3_C35_Chu25.WebSmall.JPG. In the first half, we will fold origami \"Ruby\" together with the origami paper that has crease fold lines. In the second half, we will fold something with foil paper and cellophane paper and read a Ruby script that generates paper with crease fold lines.
ABSTRACT
RubyKaigiで自分だけのrubyTシャツを作ろう！:
  tmixを使って、自分だけのRubyKaigi記念rubyTシャツを作ろう！

  ・Rubyのコードでデザイン、意外にカッコいいかも！？
  ・twitterのアカウントなど入れてもOK！
  ・ユニフォーム交換のように会場であった人と交換しても楽しい！

  今日作って明日届く！みんなで着てワイワイ楽しも〜☆

  ！！注意！！白、黒メンズ定番Tシャツ（S〜XXL）のみ。前側、もしくは背中側どちらかの面のみ。午後15時までに注文をお願いします。

  1枚1,500円（現金のみ）

  作り方（各自持参のPCにてお願いします。）
  ・http://tmix.jp/rubykaigi2010 にアクセス
  ・tmix会員登録、もしくはopenIDを使って各自でログイン
  ・サンプルデザインから、各自思い思いにデザイン
  ・デザインが終わったら、サイズを選択。名前、メアドを記入して購入ボタンで注文完了。その後tmix担当（吉川）にすぐに支払い、引換券をもらう。
  ※支払いを持って正式に注文を受付となります。

  ・翌日午後13時から17時のあいだに受け取る。

  2010 年 8 月 27 日(金)のみ開催注文は28 日(土)13時から17時までに会場で受け取りできる人のみ。

Ruby で作る Ruby の折り紙:
  Ruby の折り紙を折ります。http://dl.dropbox.com/u/4921720/RubyFoldings/IMG_0362.A3_C35_Chu25.WebSmall.JPG 折り線をプリントした展開図を用意しますので、前半それを参考にみんなで折りましょう。後半は、ちょっと難しくなりますがホイル折紙や透明折紙(セロファン)で折ってみたり、或は展開図を作成する Rubyスクリプトを読みましょう。
ABSTRACT_JA
end

EventLoader.with_options(:day => 28) do |e28|
  e28.with_options(:room => big) do |e28_big|
    e28_big.create :title => 'Ruby 1.9.2 is released! / Ruby committers Q & A', :title_ja => 'Ruby 1.9.2 is relesed! / Rubyコミッタ Q & A', :speaker => 'Yugui, Shugo Maeda', :from => '9:30', :to => '11:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Many committers will come to RubyKaigi, so it's a good chance to ask them. In this event Ruby committers will answer questions from audience (or other committers).
ABSTRACT
RubyKaigiにはたくさんのコミッタが来場するので、彼らに質問するよい機会です。このイベントでは、Rubyコミッタが聴衆(又は他のコミッタ) からの質問に回答します。
ABSTRACT_JA
    e28_big.create :title => 'Keynote', :title_ja => '基調講演', :speaker => 'Matz', :length => 1.hour, :lang => 'ja'
    e28_big.create_break :from => '12:00', :length => 90.minutes
    e28_big.create :title => 'Esoteric Obfuscated Ruby Programming', :title_ja => '超絶技巧 Ruby プログラミング', :speaker => 'Yusuke Endoh (independent)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Ruby allows us to write not only easy-to-read programs but also hard-to-read programs. In this presentation, we introduce our \"artistically\" hard-to-read programs written in Ruby. We also discuss its implementation techniques, if time permits.
ABSTRACT
Ruby は読みやすいプログラムを簡単に書ける言語だが、読みにくいプログラムも簡単に書ける。 本発表では、発表者による「芸術的に」読みにくい Ruby プログラムを紹介する。 時間があれば、その実装技法の解説を行う。
ABSTRACT_JA
    e28_big.create :title => 'Daily Ruby', :title_ja => 'Rubyな日々', :speaker => 'Kazuhiro NISHIYAMA (Good-Day, Inc.)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
I will talk about my daily life as a committer of Ruby and Ruby Reference Manual Renewal Project.
ABSTRACT
Ruby や Ruby リファレンスマニュアル刷新計画のコミッターとしてどういうことをしているのかという話をする予定です。
ABSTRACT_JA
    e28_big.create :title => 'Ruby Reference Manual Renewal Project 2010 Summer', :title_ja => 'Ruby リファレンスマニュアル刷新計画 2010 夏', :speaker => 'okkez (Ruby Reference Manual Renewal Project)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
In this talk, I will talk about Ruby Reference Manual Renewal Project and discuss the latest developments and future plans.
ABSTRACT
昨年の報告以降の動きをまとめて報告します。また、今後の予定や特に助けが必要な部分について説明します。
ABSTRACT_JA
    e28_big.create_break
    e28_big.create :title => 'Ruby API is Improved Unix API', :title_ja => 'Unix修正主義', :speaker => 'Tanaka Akira (National Institute of Advanced Industrial Science and Technology (AIST))', :length => 1.hour,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Ruby's library API is similar to Unix API but improved. For example, Unix provides non-blocking I/O by the flag for each open file. This is problematic because the open file is used for various operations and the flag affects all of them. Ruby I/O provides non-blocking methods such as read_nonblock. This provides a way to specify non-blocking behavior for each operation individually. Another example is fork() system call which is problematic with multi threads. Ruby provides spawn() method for safe usage of fork(). This presentation shows API problem discovery and fix by such examples and other problems we may fix in future.
ABSTRACT
Ruby のライブラリ API は Unix の影響を色濃く受けているが、 Unix の API をそのまま提供しているのではなく、 Unix の失敗を修正している部分がいくつかある。 たとえば、ノンブロッキング I/O は、オープンしたファイルに対するフラグで指示するため、 特定の操作だけをノンブロッキングにすることが難しい。 これに対し、Ruby ではフラグでなく read_nonblock メソッドなどを用いることにより、それが簡単になっている。 また、プロセスを起動する fork システムコールは近年のマルチスレッド環境では大きな問題がある。 これに対し、Ruby ではその問題がないプロセス起動方法として spawn メソッドを導入した。 本発表ではこのような修正例を述べ、また、まだ修正していない Unix の失敗とそれを Ruby で修正する可能性について述べる。 それにより、API の問題の発見と修正についての知見を示す。
ABSTRACT_JA
    e28_big.create_break
    e28_big.create :title => 'Lightning Talks', :abstract => "Lightning Talks are 11 x 5minutes talk in a 60 minutes time slot", :abstract_ja => "1人持ち時間5分のライトニングトークです", :speaker => '(See Abstract)', :length => 1.hour, :lang => 'ja, en'
  end

  e28.with_options(:room => medium) do |e28_medium|
    e28_medium.create :title => 'Rocking the enterprise with Ruby', :speaker => 'Munjal Budhabhatti And Sudhindra Rao (ThoughtWorks Inc)', :from => '9:30',:abstract => (<<ABSTRACT)
ThoughtWorks has been working on a long scale project at Rackspace building data center of the future using Ruby. This projects has evolved since its inception. And so has the architecture. Developing in ruby has assisted us in managing changes to the business rules at a rapid pace. We have been delivering successfully every two weeks for last three years. We would like to share our learnings from this effort.
ABSTRACT
    e28_medium.create :title => 'Rails to Sinatra: What is ready', :speaker => 'Jiang Wu (Tengu)',:abstract => (<<ABSTRACT), :lang => 'ja'
As Sinatra 1.0 came out, we have a good alternative to rails(before is merb). I will introduce efforts of people around Sinatra community to eliminate gap of moving from Rails to Sinatra including my works.
ABSTRACT
    e28_medium.create :title => 'Mapping the world with DataMapper', :speaker => 'Ted Han (%w(Videojuicer DataMapper))',:abstract => (<<ABSTRACT)
Ubiquitous computing has opened the door to two new revolutions, data collection and data manipulation. Mobile phones, digital cameras, low cost electronics, and wireless internet access have made it possible to collect data any time, anywhere. But what are we doing with the data once it's collected? How do we navigate the oceans of data we generate daily? Where can we find a Rubyist's tools for data mining and manipulation? We'll discuss how to use DataMapper, a Ruby data access library, to make sense of data of all kinds.
ABSTRACT
    e28_medium.create_break :from => '12:00', :length => 90.minutes
    e28_medium.create :title => 'The Necessity and Implementation of Speedy Tests', :speaker => 'Jake Scruggs (Backstop Solutions)', :length => 1.hour,:abstract => (<<ABSTRACT)
Your project's software practices are deteriorating every minute the developers wait for slow tests to finish. Once developers get fed up and stop running the tests, disregard for failing builds can't be far behind, and from there it's only a short leap to the albatross of a brittle/irrelevant test suite. Luckily this can all be avoided by adopting some time-saving testing standards and practices.
ABSTRACT
    e28_medium.create :title => 'Seamless Integration Testing', :speaker => 'paulelliott (Hashrocket)', :abstract => (<<ABSTRACT)
Do you have a solid, full coverage integration test suite? You should. It is the final automated point of assurance that what you are about to push to production is not going to blow something up and cost your or your client money. I show how to integration test a real Rails application, demonstrating best practices you can apply to any setup and the latest technologies for fully covering your app, including javascript!
ABSTRACT
    e28_medium.create_break
    e28_medium.create :title => 'A Metaprogramming Spell Book', :speaker => 'Paolo "Nusco" Perrotta', :length => 1.hour, :abstract => (<<ABSTRACT)
When I started to learn Ruby, I was awed by the code of experienced rubyists. That code was full of amazing magic tricks that I could barely understand. People called those tricks \"metaprogramming\".

With time, I found that metaprogramming sits right at the core of Ruby. To think in Ruby, I had to understand all those scary tricks! Feeling like a sorcerer's apprentice, I set out to write a Spell Book of metaprogramming techniques. Once I'd finished the Spell Book, metaprogramming didn't seem like black magic anymore. Instead, it just felt like any other set of techniques.

In this talk, I'll show you the content of my Spell Book, so that you don't have to go through the trouble of writing one yourself.
ABSTRACT
    e28_medium.create_break
  end

  e28.create :title => 'JRubyKaigi 2010', :title_ja => 'JRuby会議 2010', :speaker => 'Koichiro Ohba / Akasaka.rb (JRuby.org and EngineYard)', :room => b202, :from => '12:00', :to => '18:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja, en'
It's JRubyKaigi for people who love JRuby, by JRuby core developers and Japanese JRuby developers. This kaigi will make both people who like JRuby already or not love JRuby much more. It will contain great sessions; the keynote session by Thomas E.Enebo(@tom_enebo) and Charles O.Nutter(@headus), the invited talks by Nick Sieger(@nicksieger), Hiroshi Nakamura(@nahi), Takeru Sasaki(@urekat), Koichi Fujikawa(@fujibee), Yoko Harada(@yokolet). We also have time table for 6 lightning talks from general participant (we'll accept proposals beforehand).
ABSTRACT
JRuby コア開発者と日本のJRuby開発者によるJRubyが好きな人のためのJRubyKaigiを開催します。JRubyが好きな人はますます好きになり、そうでない人もJRubyが好きになる会議です。開催概要は次を予定しています。基調講演：Thomas E.Enebo(@tom_enebo) and Charles O.Nutter(@headus)、招致講演：Nick Sieger(@nicksieger)、Hiroshi Nakamura(@nahi)、Takeru Sasaki(@urekat)、Koichi Fujikawa(@fujibee)、Yoko Harada(@yokolet)、他にLightning Talks 6枠前後を一般募集。
ABSTRACT_JA

  e28.with_options(:room => a202) do |e28_a202|
    e28_a202.create :title => 'tDiaryKaigi', :title_ja => 'tDiary会議', :speaker => 'SHIBATA Hiroshi (Eiwa System Management,Inc., asakusa.rb, tDiary.org)', :from => '9:30', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
In this session, tDiary users and developpers will discuss future and love for tDiary! we plan to hackathon, and if you have useful patches, please attend this session.
ABSTRACT
tDiary のユーザと開発者が集まって今後のロードマップや意見交換を中心にtDiary愛について語り合いたいと思います。 Hackathonも予定していますので、コミッタに取り込んでもらいたいパッチがある人はぜひお越し下さい。
ABSTRACT_JA
    e28_a202.create :title => 'Asakusa.rb in Tsukuba', :title_ja => '浅草.rb in つくば', :speaker => 'Akira Matsuda (Asakusa.rb)', :from => '12:00', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA)
During RubyKaigi, you'll find tons of foreign Ruby Stars and Book writers here in Tsukuba. Why don't we directly tell them our questions, requirements, and of course, our deep appreciation, since these days are only once a year and are a very special chance for us. OK, of course we're all willing to tell them, but we know it's very hard to do so. We can hardly distinguish who's who, maybe we lack the courage to talk to them, especially when there's a language barrier between us. So, Asakusa.rb are producing a special event which aims to help introduce everybody to one another and facilitate communicate. We're having live discussions with, for example,
    the creators of Rails 3, the author of \"The Passionate Programmer\", guys from the crazy \"Ruby Brigade\" Seattle.rb, and lot of other foreign super Ruby Stars who are sticking around here. C'mon everybody, let's get together and talk about \"your\" Ruby!
ABSTRACT
RubyKaigi の会場には、皆さんも日ごろお世話になっているはずのプロダクトや書籍の作者さんご本人がうじゃうじゃ来場しています。せっかくの年に一度のチャンスなので、是非この機会にいつも感じている疑問や要望、それから感謝の気持ちを思い切って直接作者さんに伝えちゃいましょう！とはいえ、誰が誰だかよくわからないし、いきなり面と向かっては話しかけづらいし、特に言語の壁があったりするとなかなか勇気が要りますよね？そこで、僕たち Asakusa.rbでは、Jeremy Kemper や Chad Fowler をはじめ、当日会場に居る豪華外タレさんたちをゲストにお迎えして、彼ら自身の 'あの'プロダクトについて、ご本人と Asakusa.rb のメンバーたちと、それからもちろん会場の皆様も巻き込んで、生のアツいディスカッションを行います。
ABSTRACT_JA
    e28_a202.create :title => 'Pair Programming Cultural Exchange', :speaker => 'Sarah Mei (Pivotal Labs)', :to => '18:00',:abstract => (<<ABSTRACT), :lang => 'ja'
We may not speak the same language, but we do have one language in common. So, we can code together!

Armed with a list of pair programming phrases in English and Japanese, let's work together on a project in Ruby. Coding together can help us bridge the artificial boundaries created by language, culture, and distance, and can create friendships that last beyond the conference.

Unicorns and ponies for everyone!
ABSTRACT
  end

  e28.with_options(:room => b201) do |e28_b201|
    e28_b201.create :title => 'jpmobile Kaigi 2010', :speaker => 'Shin-ichiro OGAWA (Tokyu.rb)', :from => '9:30', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
A Kaigi for \"jpmobile\" developers. Jpmobile is the de facto standard Rails plugin for Japanese mobile phones. Almost all of \"jpmobile\" developers will come to this session and discuss the future of jpmobile, then
start to struggle to make it real, that means, write codes. The main topics will be supporting Rails 3.0+ and Ruby 1.9, building Rack middleware.

Anyone who wants to contribute to jpmobile should attend this Kaigi.
ABSTRACT
日本全国から jpmobile 開発者・利用者が一堂に会して、jpmobile の今後について議論や開発を行う企画です。えにしテックの設楽さんを中心に、Rails 3.0 以降や Rack について、その場で議論して開発に入るハッカソンスタイルを取る予定です。
ABSTRACT_JA
    e28_b201.create :title => 'PGP Key Signing Party', :title_ja => "キーサインパーティー 2010", :speaker => 'Shyouhei Urabe w/ Yugui (Ruby Core Team)', :from => '12:00', :length => 90.minutes, :abstract => (<<ABSTRACT), :lang => 'ja'
Let's trade pubkeys! Keysign party connects our community tightly each other. It is also fairly important when you want to make a secure channel with us (e.g. when you report a security incident).

Please take a look at this howto before joining this party. You need a PGP key pair plus few more physical preparations.
ABSTRACT
    e28_b201.create :title => 'M-x ruby-and-emacs-workshop', :speaker => 'Zev Blut', :length => 90.minutes,:abstract => (<<ABSTRACT)
Stretch your fingers and warm up your control and meta keys. Bring your laptop and .emacs file. Let's show each other our techniques for writing Ruby code using Emacs.

This is a workshop for both beginners and advanced users to share tips and tricks for developing Ruby code with Emacs.
ABSTRACT
    e28_b201.create :title => 'Cucumber hands-on', :title_ja => 'Cucumber ハンズオン', :speaker => 'MOROHASHI Kyosuke (EIWA System Management, Inc.)', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Cucumber is a very nice testing framework. But the major feature, execute natural language text as tests, varies from familiar \"Ruby syntax\". Therefore, you may feel inhibited to take the first step (so I was.). In this sub-event, we try Cucumber to build a simple Rails application. It will tell you that cucumber is not so difficult to start and has great power to describe software test.
ABSTRACT
Cucumberはとてもよくできたテスティングツールです。しかし、その大きな特長である、自然言語を使ったテスト定義は、慣れ親しんでいる「Ruby の文法」とは見た目が大きくことなります。そのため、はじめの一歩を踏み出すに心理的な抵抗を感じることもあるでしょう(私もそうでした)。この企画では、Cucumberを使いながら簡単なRailsアプリケーションを作っていくことで、始めるのは難しくないことと、そしてCucumber のパワーを実感してもらうことを目的としています。
ABSTRACT_JA
  end

  e28.with_options(:room => a201) do |e28_a201|
    e28_a201.create :title => 'Nihon Ruby-no-Kai meeting', :title_ja => '日本Rubyの会の会', :speaker => 'Koji Shimada (Nihon Ruby-no-Kai)', :from => '12:00', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
An open meeting where Rubyists discuss what we can do for Ruby.
ABSTRACT
RubyのためにRubyistができることについて話し合うイベント。 RubyKaigi2010の時期には実は第6期が終わっているので、第6期の活動のふりかえりと、第7期の活動のアイデア出しをやりましょう!
ABSTRACT_JA
    e28_a201.create :title => 'Vim', :speaker => 'ujihisa (HootSuite)', :to => '17:00',:abstract => (<<ABSTRACT)
About half of Rubyists are using Vim to code Ruby. Vim is one of the ultimate tools for software developments, which vary among programmers. Why don't you exchange the ways you use Vim?

For example, I am using some Vim plugins such as quickrun.vim, neocomplcache, and smartchr.vim to code Ruby efficiently. Although my ~/.vimrc is less than just 900 lines, there are plenty of good tricks worth telling to you. I'd like to tell you about my Vim knowledge, and learn how you yourself are optimizing Vim.

I'd like to make the event in English, because most Japanese have already been learning English for a while. Of course, attendees are supposed to be familiar with Ruby and Vim, because they are the lingua franca of this event. I can help translating Japanese to English or English to Japanese. Even if you don't have a lot of confidence with other languages, you can still attend this event.

Other editor users such.
ABSTRACT
  end

  e28.create :title => "Let's create your own T-shirt designed by Ruby at RubyKaigi 2010!! / The Origami Ruby (paper craft) Generated by The Ruby", :title_ja => 'RubyKaigiで自分だけのrubyTシャツを作ろう！ / Ruby で作る Ruby の折り紙', :speaker => 'Yasuo Yoshikawa (tmix producer) / Hiroyuki Shimura (Nihon Ruby-no-kai (Japan Ruby Group))', :room => foyer, :from => '12:00', :to => '17:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Let's create your own T-shirt designed by Ruby at RubyKaigi 2010!!!:
  Let's create your own T-shirt designed by Ruby on tmix! tmix is the only on-demand retail platform for consumers.

  If you can create T-shirt today, you can put on it tomorrow!

  This event open until Aug 27th 15:00 pm . price 1,500en (front or back print only!) White or Black T ,size S,M,L,XL,XXL Cash only.

  The Origami Ruby (paper craft) Generated by The Ruby: Let's fold origami \"Ruby\" like http://dl.dropbox.com/u/4921720/RubyFoldings/IMG_0362.A3_C35_Chu25.WebSmall.JPG  . In the first half, we will fold origami \"Ruby\" together with the origami paper that has crease fold lines. In the second half, we will fold something with foil paper and cellophane paper and read a Ruby script that generates paper with crease fold lines.
ABSTRACT
RubyKaigiで自分だけのrubyTシャツを作ろう！:
  tmixを使って、自分だけのRubyKaigi記念rubyTシャツを作ろう！

  ・Rubyのコードでデザイン、意外にカッコいいかも！？
  ・twitterのアカウントなど入れてもOK！
  ・ユニフォーム交換のように会場であった人と交換しても楽しい！

  今日作って明日届く！みんなで着てワイワイ楽しも〜☆

  ！！注意！！白、黒メンズ定番Tシャツ（S〜XXL）のみ。前側、もしくは背中側どちらかの面のみ。午後15時までに注文をお願いします。

  1枚1,500円（現金のみ）

  作り方（各自持参のPCにてお願いします。）
  ・http://tmix.jp/rubykaigi2010 にアクセス
  ・tmix会員登録、もしくはopenIDを使って各自でログイン
  ・サンプルデザインから、各自思い思いにデザイン
  ・デザインが終わったら、サイズを選択。名前、メアドを記入して購入ボタンで注文完了。その後tmix担当（吉川）にすぐに支払い、引換券をもらう。
  ※支払いを持って正式に注文を受付となります。

  ・翌日午後13時から17時のあいだに受け取る。

  2010 年 8 月 27 日(金)のみ開催注文は28 日(土)13時から17時までに会場で受け取りできる人のみ。

  Ruby で作る Ruby の折り紙:
  Ruby の折り紙を折ります。 http://dl.dropbox.com/u/4921720/RubyFoldings/IMG_0362.A3_C35_Chu25.WebSmall.JPG 折り線をプリントした展開図を用意しますので、前半それを参考にみんなで折りましょう。後半は、ちょっと難しくなりますがホイル折紙や透明折紙(セロファン)で折ってみたり、或は展開図を作成する Rubyスクリプトを読みましょう。
ABSTRACT_JA
end

EventLoader.with_options(:day => 29) do |e29|
  e29.with_options(:room => big) do |e29_big|
    e29_big.create :title => 'Cloud management with Ruby', :title_ja => 'Rubyでクラウドを便利にする方法〜ニフティクラウドの事例〜', :speaker => 'Kei Hamanaka (NIFTY Corporation), Yuichi Saotome (NIFTY Corporation)', :from => '9:30',:abstract => (<<ABSTRACT), :lang => 'ja'
We show the construction/operation methods for Cloud with Ruby. (ex. NIFTY Cloud)
ABSTRACT
    e29_big.create :title => 'Distributed storage system with ruby', :title_ja => 'Rubyによる分散ストレージシステムの実装', :speaker => 'Toshiyuki Terashita (RICOH IT SOLUTIONS Co.,Ltd.)', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Castoro is a new scalable storage system implemented in Ruby. In this session, we talk about the reasons why we decided to develop new Castoro storage system, and the features against another storage systems such as MogileFS and kumoFS.
ABSTRACT
Castoroは、Rubyで実装されたスケーラブルなストレージシステムです。本発表では、開発に至った経緯と、MogileFSやkumoFS等、他の分散ストレージシステムとの違いについて紹介します。
ABSTRACT_JA
    e29_big.create :title => 'The last decade of RWiki and lazy me', :title_ja => 'RWikiと怠惰な私の10年間', :speaker => 'Masatoshi SEKI (druby.org)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
On August 31st, 2000, A slightly strange Wiki was introduced in ruby-list. It was [ruby-list:24661] The first practical application, RWiki.

RWiki is a software with strong opinion. RWiki was introduced as one example of many Ruby libraries, but its singular implementation also reflects author's opinion. The most significant feature of RWiki is in-memory application that contains all databases and objects in one process. Yes, NoSQL and In-Memory are also recent buzzwords.

A couple days after this presentation, RWiki will celebrate its ten years. I am managing several RWiki sites that are in active. Currently, those sites have about 30 thousand pages and its process size is over 1 giga bytes. In this presentation, I will tell a little story which was developed in the process of those RWiki sites' gaining \"size and quantity\".
ABSTRACT
2000-8-31、ruby-listにすこし変わったWikiが紹介されました。[ruby-list:24661] dRubyの最初の実用的なアプリケーション、RWikiです。

RWikiはメッセージ色の濃いソフトウェアです。RWikiはRuby周辺のさまざまなライブラリのサンプルとして紹介されましたが、特異な実装も作者のメッセージです。RWikiのもっとも大きな特徴はデータベース、オブジェクトを全て一つのプロセスの中に配置する、In-Memory のアプリケーションであることです。そういえば、NoSQL、In-Memoryは最近のバズワードでもありますね。

この発表の数日後、RWikiはちょうど10年を迎えます。 私はアクティブなRWikiサイトを複数運営していて、現在では3万ページ、プロセスサイズは1GBを超えています。本発表では、このサイトが「大きさ・量」を獲得していく過程で展開された、ちょっとした物語を報告します。
ABSTRACT_JA
    e29_big.create :title => 'Practical Ruby Projects with MongoDB', :speaker => 'Alex Sharp (Lead Developer, OptimisDev)', :length => 1.hour,:abstract => (<<ABSTRACT)
While there is a lot of excitement surrounding MongoDB and the NoSQL movement, MongoDB is all about practicality, pragmatism and performance. MongoDB boasts a robust feature set that provides a pragmatic blend of rich functionality, performance and scalability that today's software developers need, and all at a relatively low barrier to entry.
ABSTRACT
    e29_big.create_break :length => 90.minutes
    e29_big.create :title => "IronRuby - What's in it for Rubyists?", :speaker => 'Shay Friedman (Sela Group)', :length => 1.hour, :abstract => (<<ABSTRACT)
IronRuby is the new implementation of the Ruby language from Microsoft which opens the .NET world to Rubyists. This brings a whole set of new opportunities to Rubyists like using Ruby to write RIA applications, providing enhanced user interface to Ruby applications and more. Come and see the new possibilities that IronRuby brings to the Ruby world!
ABSTRACT
    e29_big.create_break
    e29_big.create :title => 'The spread of enterprise Ruby at hot spot SHIMANE', :title_ja => 'Ruby業務システムの広がりとホットスポット島根', :speaker => 'Hiroshi Yoshioka (TechnoProject Ltd.)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
In Matsue City and SHIMANE prefecture of local government, many common business systems began to remake by Ruby/Rails since 2007. Now, the wave of Ruby/Rails spreads to enterprise system fields and prepheral regions. Based many experience and results, how to built up the enterprise systems by Ruby/Rails, how to built up the long term maintenance systems, challenging to high productivty and another Agile development.
ABSTRACT
地方自治体である松江市や島根県では、2007年から一般的な行政システムをRuby/Railsで再構築を行っている。今、Ruby/Railsの波が企業システムの分野や周辺の地域に広がり始めた。 多くの経験と実績に基づいて、Ruby/Railsの基幹業務システムの構築方法、長期間メンテナンスするシステムの構築方法、高生産性や別なアジャイル開発への挑戦について説明する。
ABSTRACT_JA
    e29_big.create :title => 'There Is No Spoon -- Think Global, Act Regional', :speaker => 'Shintaro Kakutani (rubykaigi.org, Nihon Ruby-no-kai)', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
I have been a member of RubyKaigi organizer since 2006 and also am the founder of Regional RubyKaigi started in 2008. \"Kaigis\" have changed the landscape of the Ruby community in Japan. These 2 years mean a lot to me. I'd love to show you what happened is and tell you what I believe is going to happen in the Ruby community in Japan.
ABSTRACT
2008年につくばで(!)開催されたRejectKaigiで提案した地域Ruby会議プロジェクトは2周年を迎えます。この2年間に9都市で17の地域Ruby会議が実施され、私はその全てに参加しました。本セッションでは、過去2年間の地域Ruby会議をふりかえり、今後の地域Ruby会議のありかたについて私見を述べます。東京と東京以外の違いと地域のRubyユーザグループの重要性や地域Ruby会議とRubyKaigiの関係など、「RubyKaigi以後」のRuby コミュニティのあり方を考える材料を提供します。
ABSTRACT_JA
    e29_big.create_break
    e29_big.create :title => 'Keynote', :title_ja => '基調講演', :speaker => 'Chad Fowler', :length => 1.hour
    e29_big.create :title => 'Closing'
  end

  e29.with_options(:room => medium) do |e29_medium|
    e29_medium.create :title => 'The future of the bigdecimal library and the number system of Ruby', :title_ja => "bigdecimal ライブラリと Ruby の数値系の未来", :speaker => 'Kenta Murata (GeneticLab Co., Ltd. && Ruby Sapporo)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :from => '9:30', :lang => 'ja'
I taked over the maintainer of the bigdecimal standard library in the beginning of this year. Today, the bigdecimal library has some problems in its behaviors, such as interacting convention with any other number classes. In this presentation, I will demonstrate these problematic behaviors and express their appropriate characteristics in the next version of Ruby. Additionally, I will discuss the number system which the future version of Ruby, that is 2.0, should have.
ABSTRACT
私は今年の初めに bigdecimal 標準ライブラリのメンテナに採用されました。現在 bigdecimal ライブラリは、他の数値クラスとの相互作用規則など、その振る舞いについて幾つかの問題を抱えています。私はこのプレゼンテーションで、このような問題ある振る舞いを実演で示し、これらに対して Ruby の次のバージョンで実現されるべき適切な性質を説明します。加えて、私は Ruby の未来のバージョン（すなわち 2.0）が持っているべき数値系について議論します。
ABSTRACT_JA
    e29_medium.create :title => 'NArray and scientific computing with Ruby', :speaker => 'Masahiro Tanaka (University of Tsukuba)',:abstract => (<<ABSTRACT)
NArray is an n-dimensional numerical array library developed for use in science fields, but it is usable for handling binary data efficiently. I talk about NArray for the first time after 10 years from the first release. I will also present topics including the next version of NArray, and distributed scientific computing using Ruby for multi-core era.
ABSTRACT
    e29_medium.create :title => 'How Did Yarv2llvm Fail', :title_ja => 'yarv2llvmはどう失敗したのか', :speaker => 'Hideki Miura (CSNagoya)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Yarv2llvm is a translator which converts instruciton set of VM of CRuby (aka YARV) into llvm. The feature of yarv2llvm is to use the type inference for raising the execution efficiency of generated llvm. Yarv2llvm get a results. For example it executes the program for computing fibonacci number 40 times faster than Ruby1.9. But it was clarified to be able not to convert all Ruby programs into llvm well either though it had expected beforehand. I will show the example of programming Ruby that cannot be converted with yarv2llvm well and the settlement plan. In addition I will introduce the outline of the next generation translator (ytl) that I am developing to support all specification of Ruby.
ABSTRACT
yarv2llvmはCRubyのVMの命令列をllvmに変換するトランスレータである。生成するllvmの実行効率を上げるために、型推論を用いるのが特徴である。 yarv2llvmはフィボナッチ級数プログラムでRuby1.9の約40倍の実行速度を得るなど、一定の成果が得られた。一方で、事前に予想していたことではあるが、すべてのRubyプログラムがうまくllvmに変換できるわけではないことも明らかになった。 この発表ではyarv2llvmではうまく変換できないRubyプログラム例とその解決案を説明する。さらに、フルセットRubyをサポートすることを目的に現在開発中の次世代トランスレータ(ytl)の概要を紹介する。
ABSTRACT_JA
    e29_medium.create :title => 'AOT Compiler for Ruby', :title_ja => 'Ruby 用 AOT コンパイラ', :speaker => 'Satoshi Shiba (The University of Tokyo)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
We developed a AOT Compiler, which translates Ruby script into native code to run Ruby script faster.

In this presentation, we show the composition of CRuby and the challenges we overcome to achieve full compatible AOT compiler for the CRuby. We also show the design and the implementation of our AOT compiler. We evaluated the compatibility and performance by using tests and benchmarks included in CRuby release.
ABSTRACT
Ruby スクリプトの実行をより高速にするために，Ruby スクリプトを機械語に変換する AOT（Ahead-Of-Time）コンパイラ を開発した．

本発表では，CRubyの構成を述べ，CRubyと完全互換なAOTコンパイラを開発するにあたっての課題を述べる．そして，我々のAOTコンパイラの設計と実装を示す． Ruby処理系に付属するテストプログラム，ベンチマークプログラムを用いて， その互換性，および得られた性能向上について述べる．
ABSTRACT_JA
    e29_medium.create :title => 'Memory Profiler for Ruby', :speaker => 'Tetsu Soh (The University of Tokyo)',:abstract => (<<ABSTRACT)
We developed a memory profiler for Ruby programming language that fulfills the requirement for measuring and analyzing the memory usage of Ruby applications.

In this presentation, we will describe the features, the design and the implementation of the memory profiler. We will also show the performance evaluation and demonstrate the memory profiler in action.
ABSTRACT
    e29_medium.create_break :length => 1.5.hours
    e29_medium.create :title => 'How to create Ruby reference manual search Web application with Ruby 1.9  groonga and rroonga', :title_ja => 'るりまサーチの作り方 - Ruby 1.9でgroonga使って全文検索', :speaker => 'Kouhei Sutou (ClearCode Inc. / COZMIXNG)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
This talk explains about rurema-search, Ruby reference manual in Japanese search Web application, and how to create rurema-search. Rurema-search uses Ruby 1.9.1 (MRI) as a Ruby interpreter, groonga as a full-text search engine and data store and rroonga as a Ruby-groonga interface. Those technologies are particularly explained in 'how to create rurema-search' time.

  rurema-search (Japanese): http://rurema.clear-code.com/
ABSTRACT
このトークではるりまサーチについてとるりまサーチの作り方について話します。るりまサーチはRubyリファレンスマニュアル刷新計画の成果物であるRubyのリファレンスマニュアルを高速に検索するWebアプリケーションです。るりまサーチはRubyインタプリタとしてRuby 1.9.1（MRI）、全文検索エンジンとデータストアとしてgroonga、Rubyとgroongaのインターフェイスとしてrroongaを使っています。作り方の説明では、特にこれらの技術の使い方について詳しく説明します。

 るりまサーチ: http://rurema.clear-code.com/
ABSTRACT_JA
    e29_medium.create :title => "Now you're thinking with virtual clocks", :title_ja => 'ゲームとバーチャルタイム', :speaker => 'Tom Lieber (SonicMule,Inc.)',:abstract => (<<ABSTRACT)
Turn the multimedia render loop inside out. Cooperatively scheduling lightweight Ruby threads on a virtual clock allows you to reason about the concurrent code in your game and perform complex synchronization tasks without even realizing it. Ditch the nested trees of update() calls by making time a first class cit
ABSTRACT
    e29_medium.create_break
    e29_medium.create :title => "How to survive in after Rails' time", :title_ja => 'before Rails 時代のプログラマが如何にして after Rails の世界にたどりついたか', :speaker => 'SHIBATA Hiroshi (Eiwa System Management,Inc. / asakusa.rb / tDiary.org)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
In before Rails appeared(before Rails' time), many programmers had used Ruby for developing products or useful tools. In after Rails appeared(after Rails' time), we need to change old thinking. I'll talk about my experience of changing my thinking to adapt to new days.
ABSTRACT
Rails が登場する以前(before Rails)から私たちは多くのプロダクトやツールをRubyによって作ってきました。しかし、Rails が登場した現代(after Rails)のアプリケーション開発では、before Rails とは異なる考え方を持つ必要があります。このセッションでは、自分が経験したbefore Rails から after Rails に適応するための頭の切り替え方を話します。
ABSTRACT_JA
    e29_medium.create :title => 'How To Create Beautiful Template Engine Which Never Break HTML Design', :title_ja => 'HTMLデザインをまったく崩さない、美しいテンプレートエンジンの作り方', :speaker => 'Makoto Kuwata (programmer)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
One of the problems of web application development is that it is hard to cooperate with web designer. For example, eRuby requires template files to contain Ruby codes which breaks HTML design of template files. In the result, web designer have a lot of stress. To solve this problem, several template engines are invented in the world. However, they cause another problems such as bad performance or hard to use while solving the problem. In this session, I'll explain how to create beautiful template engine which never break HTML design at all with keeping good performance and ease-to-use. I'll also explain what is wrong in existing template engines. This will be definitive session about template engine for web application development. You should join this session if you are interested in web design.
ABSTRACT
Webアプリケーション開発における問題点のひとつに、Webデザイナと協業がしにくいことが挙げられます。たとえばeRubyだとテンプレートファイル中にRubyコードを埋め込むため、テンプレートファイルのHTMLデザインが崩れてしまい、デザイナが作業しにくくなってしまいます。この問題を解決するために、HTMLデザインを崩さないようなテンプレートエンジンがいくつか考案されています。しかしそれらはHTMLデザインの問題を解決したかわりに、パフォーマンスや使い勝手の悪さなど別の問題を引き起こしています。本セッションでは、HTMLデザインを一切崩さず、かつ使いやすくて高速なテンプレートエンジンの作り方を紹介します。また既存の方法は何が間違っていたのか、そもそもHTMLデザインを崩さないだけでいいのか、など、テンプレートエンジンにまつわる様々な問題について考察します。本セッションは、テンプレートエンジンについての「決定版」ともいうべき内容です。Webデザインに興味のある方は必見です。
ABSTRACT_JA
    e29_medium.create_break
  end

  e29.with_options(:room => b202) do |e29_b202|
    e29_b202.create :title => 'Regional RubyKaigi Kaigi', :title_ja => '地域Ruby会議会議', :speaker => 'Koji Shimada (Nihon Ruby-no-Kai)', :from => '10:00', :length => 2.hours,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
An open meeting (\"kaigi\") about Regional RubyKaigi for anyone who is interested.
ABSTRACT
地域 Ruby 会議に興味ある人たちが集まって、地域Ruby会議の今後について話し合うBOF。これまでの開催の関係者、これから地域Ruby会議を開催したいと考えている人、単に地域Ruby会議に興味のある人の参加を歓迎します。
ABSTRACT_JA
    e29_b202.create :title => "We're rubyists living abroad. Any questions?", :title_ja => '外国で暮らすRubyistだけど何か質問ある？', :speaker => 'Kazuhiko (Nexedi SA)', :from => '13:30', :length => 1.hour,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA)
In the RubyKaigi, we have many foreign Rubyists. And we also have Japanese rubyists who are living abroad and foreign rubyists who is living in Japan. Please join this sub-event to discuss with such 'rubyists living abroad'! If you are interested in 'living in Japan as a foreign rubyist', please feel free to ask your questions. Both English and Japanese are welcome in this sub-event.
ABSTRACT
RubyKaigiには、外国から多くのRubyistが来ますが、外国で活躍する日本人Rubyistや日本で活躍する外国人Rubyistもたくさんやってきます。そんな身近だけれどちょっと遠い存在に見えなくもない「外国で暮らすRubyist」と意見交換する企画です。 この企画では、@ujm, @vincentisambart, @lchin といった「外国で活躍する」豪華Rubyistを招いて、「カナダのRubyistはどういうところに着目しているか」「母国語と違う環境での Rubyistの仕事の様子」など、参加者の皆さんからの質問に何でもお答えします。なお、この企画では日本語も英語もどちらもOKです。
ABSTRACT_JA
  end

  e29.with_options(:room => a202) do |e29_a202|
    e29_a202.create :title => 'Ruby Game Developers Kaigi', :title_ja => 'Rubyゲーム会議', :speaker => 'kumaryu (Ryuichi Sakamoto)',:abstract => (<<ABSTRACT), :from => '10:00', :length => 2.hours, :lang => 'ja'
Short sessions and Demos for Game Developement with Ruby. Demos are open to all.
ABSTRACT
    e29_a202.create :title => 'Asakusa.rb in Tsukuba', :title_ja => '浅草.rb in つくば', :speaker => 'Akira Matsuda (Asakusa.rb)', :from => '12:00', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA)
During RubyKaigi, you'll find tons of foreign Ruby Stars and Book writers here in Tsukuba. Why don't we directly tell them our questions, requirements, and of course, our deep appreciation, since these days are only once a year and are a very special chance for us. OK, of course we're all willing to tell them, but we know it's very hard to do so. We can hardly distinguish who's who, maybe we lack the courage to talk to them, especially when there's a language barrier between us. So, Asakusa.rb are producing a special event which aims to help introduce everybody to one another and facilitate communicate. We're having live discussions with, for example, the creators of Rails 3, the author of \"The Passionate Programmer\", guys from the crazy \"Ruby Brigade\" Seattle.rb, and lot of other foreign super Ruby Stars who are sticking around here. C'mon everybody, let's get together and talk about \"your\" Ruby!
ABSTRACT
RubyKaigi の会場には、皆さんも日ごろお世話になっているはずのプロダクトや書籍の作者さんご本人がうじゃうじゃ来場しています。せっかくの年に一度のチャンスなので、是非この機会にいつも感じている疑問や要望、それから感謝の気持ちを思い切って直接作者さんに伝えちゃいましょう！とはいえ、誰が誰だかよくわからないし、いきなり面と向かっては話しかけづらいし、特に言語の壁があったりするとなかなか勇気が要りますよね？そこで、僕たち Asakusa.rbでは、Jeremy Kemper や Chad Fowler をはじめ、当日会場に居る豪華外タレさんたちをゲストにお迎えして、彼ら自身の 'あの'プロダクトについて、ご本人と Asakusa.rb のメンバーたちと、それからもちろん会場の皆様も巻き込んで、生のアツいディスカッションを行います。
ABSTRCT_JA
    e29_a202.create :title => 'TermtterKaigi', :speaker => 'jugyo (Termtter Dev Team)', :length => 3.hours,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
\"Termtter\" is a twitter client, written in Ruby, and based on terminal applications/softwares or shells.

TermtterKaigi does:

* Hackathon
* Lightning Talks
* Refactoring Termtter
* Tutorial of Termtter
* Q&A of Termtter
ABSTRACT
TermtterはRubyで実装されている、ターミナルやシェルから利用することができるTwitterクライアントです。

TermtterKaigiは以下の事をします:

* ハッカソン
* ライトニングトーク
* Termtter のリファクタリング
* Termtter チュートリアル
* Q&A of Termtter
ABSTRACT_JA
  end

  e29.with_options(:room => b201) do |e29_b201|
    e29_b201.create :title => 'Ruby meets LDAP, choices and case', :title_ja => 'Ruby で扱う LDAP のススメ - 選択肢とその事例', :speaker => 'Kazuaki Takase', :from => '10:00', :length => 2.hours,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
LDAP is widely used for directory service, defined on RFC 4510-4519.

Ruby has library to manage LDAP, such as \"Ruby/LDAP\", \"Net::LDAP\" and \"ActiveLdap\". Unfortunately, no found enough documentation on the internet to determine library which is better.

This session introduce case of each library for Ruby community to determine for choosing which library.
ABSTRACT
Ruby/LDAP, Net::LDAP, ActiveLdap など数々の実装がある中でLDAP自身のマイナーさも相まってか、各パッケージ間の特色やその利用事例について、まとまった情報が存在していません。

数種のパッケージが存在する以上、そこに多様性が存在するはずです。求めるオペレーションによって最適なものは何か、妥当性を選択するための判断基準が存在するはずと考えます。

この企画は各パッケージでの利用事例を公募し、それぞれがその利点を発表する事によって、 LDAP を扱おうとする Ruby コミュニティにパッケージ選択の指針を提供しようとする試みです。
ABSTRACT_JA
    e29_b201.create :title => 'Ruby powering 9 million dining tables', :title_ja => 'Ruby powering 9 million dining tables', :speaker => 'Kenta Hashimoto(COOKPAD Inc.)', :from => '12:00', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Do you know the website that 45% of Japanese women in their 30's are
using regularly?
COOKPAD (cookpad.com) is the world's greatest user-generated recipe
site with 9.8 million monthly users and over 800 thousand recipes.
So what is the reason for its continued growth as the largest Ruby on
Rails site in Japan?
Kenta Hashimoto, our CTO, will introduce you to our practical
technology and development environment.

We will focus on these 3 points:

・Ruby; the value proposition for COOKPAD
・How we scale and develop COOKPAD
・COOKPAD from the eyes of non-Japanese engineers

The slides will be in English, and the lecture will be given in
Japanese, so non-Japanese are more than welcome to participate.


<time table>
12:00-12:50 - 'Ruby powering 9 million dining tables'
12:50-13:20 - Q&A and Lunch time（Please bring your lunch）

<Notice>
COOKPAD has branch offices in the US, and is always eager to take in
engineers regardless of nationality. We would appreciate participation
of non-Japanese technicians interested in working with a Japanese
company.

<Reference>
Cookpad Developer Blog
http://techlife.cookpad.com/
ABSTRACT
日本人女性30代の45％が利用するサイトをご存じですか？
クックパッド（cookpad.com）は月間989万人が利用し、80万品のレシピが集まる世界最大の料理レシピ投稿サイトです。そんなクックパッドが日本最大のRuby
on Rails製サイトとして成長を続けている理由とは何か。日々実践している技術や開発環境についてCTOの橋本健太がお話します。

以下の３つを中心にお話します。

・価値を提供する手段としてのRuby
・クックパッドのスケーリングと開発体制
・クックパッドで働く外国人エンジニアから見たクックパッド

当日スライド資料は英語、講演は日本語で行いますので、外国人の方も是非ご参加ください。

＜time table＞
12：00～12：50　'Ruby powering 9 million dining tables'
12：50～13：20　Q&A and Lunch time（各自お弁当を持参ください）

＜お知らせ＞
クックパッドは米国に支社を設けており、国籍問わず技術者の積極採用をしております。日本企業で働くことに興味がある外国人の方も、ぜひご参加ください。

＜参考＞
クックパッド開発者ブログ
http://techlife.cookpad.com/
ABSTRACT_JA
    e29_b201.create :title => 'Making MS-Win32 Ruby Hands-ON', :title_ja => 'MSWin32版Ruby野良ビルダー養成塾', :speaker => 'Akio Tajima aka arton', :from => '13:30', :length => 3.hours,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
This hands-on is for Window user who 'd like to build own ruby, extended libs and gem. From installation of the compiler to build own extended library.
ABSTRACT
この企画は、無料の意味でのFreeなVisual C++ 2010 Expressを利用して、WindowsでRubyのタールボール（安定版、および最新版スナップショット）からのmakeとinstall、PATH の通し方、拡張ライブラリの作成、make、インストール、Gemの管理など、Ruby野良ビルダーに最低限必要な知識をハンズオン形式で講習します。
ABSTRACT_JA
  end
  e29.create :title => 'The Origami Ruby (paper craft) Generated by The Ruby', :title_ja => 'Ruby で作る Ruby の折り紙', :speaker => 'Hiroyuki Shimura (Nihon Ruby-no-kai (Japan Ruby Group))', :room => foyer, :from => '10:00', :to => '16:30',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
    :abstract => "Let's fold origami \"Ruby\" like http://dl.dropbox.com/u/4921720/RubyFoldings/IMG_0362.A3_C35_Chu25.WebSmall.JPG. In the first half, we will fold origami \"Ruby\" together with the origami paper that has crease fold lines. In the second half, we will fold something with foil paper and cellophane paper and read a Ruby script that generates paper with crease fold lines.",
ABSTRACT
Ruby の折り紙を折ります。 http://dl.dropbox.com/u/4921720/RubyFoldings/IMG_0362.A3_C35_Chu25.WebSmall.JPG 折り線をプリントした展開図を用意しますので、前半それを参考にみんなで折りましょう。後半は、ちょっと難しくなりますがホイル折紙や透明折紙(セロファン)で折ってみたり、或は展開図を作成する Rubyスクリプトを読みましょう。
ABSTRACT_JA
end

lt_event = Event.find_by_title_en("Lightning Talks")
lt_event.children.create :title_en => "ARToolKit Ruby Binding",
                         :presenter_name => "Urabe, Shyouhei (Network Applied Communication Lab.)"
lt_event.children.create :title_en => "Toward creating a single stand-alone executable of Ruby",
                         :title_ja => "Ruby/Tk-Kit から RubyKit へ : Ruby の単一ファイル実行環境の構築に向けて",
                         :presenter_name => "Hidetoshi NAGAI (Kyushu Institute of Technology / Rubyist Kyushu)"
lt_event.children.create :title_en => "What is few?",
                         :presenter_name => "Sora Harakami (few developer team)"
lt_event.children.create :title_en => "Toward Lightning RubyVM",
                         :presenter_name => "Koichi Sasada (The University of Tokyo)"
lt_event.children.create :title_en => "MessagePack, a cross-language communication system",
                         :title_ja => "MessagePackで多言語間通信",
                         :presenter_name => "Sadayuki Furuhashi"
lt_event.children.create :title_en => "It's not just about the Yen: Protecting the planet with Ruby",
                         :presenter_name => "Simon Tokumine (United Nations Environment Programme)"
lt_event.children.create :title_en => "Introducing the Lingo Project: A New Generationi Text Input System Leveraging Non-native English Writing",
                         :presenter_name => "Kazki Matz (Lingo project)"
lt_event.children.create :title_en => "babushka―test-driven sysadmin for rubyists",
                         :presenter_name => "Ben Hoskings (babushka)"
lt_event.children.create :title_en => "parse.y Fam Tour",
                         :title_ja => "parse.yの歩き方 -ワシのRubyは4式まであるぞ-",
                         :presenter_name => "Ando Yasushi (Seesaa Inc.)"
lt_event.children.create :title_en => "The Timeless Way of E-Publishing with Ruby",
                         :title_ja => "時を超えた電子出版の道の中をRubyと歩いていく",
                         :presenter_name => "Masayoshi Takahashi (Tatsu-zine publishing, Nihon Ruby-no-Kai)"
lt_event.children.create :title_en => "My Report of \"Ruby Summer of Code 2010\" - Road to be a stdlib -",
                         :title_ja => "Ruby Summer of Code 2010のご報告 〜俺たちのDecimalはまだ始まったばかりだ〜",
                         :presenter_name => "Tadashi Saito (University of Tsukuba)"


# Event.create :title_en => 'Opening', :title_ja => 'オープニング',
#    :abstract_en => 'begin RubyKaigi',
#    :abstract_ja => 'はじまり', :detail_en => 'DETAIL!', :detail_ja => 'くわしく', :additional_info => 'ADDITIONAL!', :lang => 'ja', :break => false
# Rubyist.create :username => 'a_matsuda', :email => 'ronnie@dio.jp', :twitter_user_id => 7220202, :identity_url => 'http://dio.jp/', :full_name => '松田 明', :website => 'http://localhost:3000/'
