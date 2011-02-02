# -*- coding: utf-8 -*-
EventLoader.with_options(:day => 27) do |e27|
  e27.with_options(:room => @big) do |e27_big|
    e27_big.create :title => 'Opening', :from => '12:30', :vimeo_id => 14548019, :nicovideo_id => 'sm11901507'
    e27_big.create :title => 'Conflicts and Resolutions in Ruby and Rails', :speaker => 'Akira Matsuda, Masayoshi Takahashi and others(TBA)', :from => '13:00', :to => '14:00', :profile => (<<PROFILE), :abstract => "To Be Announced (We're sorry, at Jeremy's request, his keynote has been cancelled)", :abstract_ja => "Jeremy Kemper氏の基調講演はご本人の都合により中止となりました。代替プログラムについては、追ってアナウンスいたします。悪しからずご了承ください", :lang => 'ja and/or en', :vimeo_id => 14548338, :nicovideo_id => 'sm11901600'
To Be Announced
PROFILE
    e27_big.create :title => 'jpmobile on Rails 3', :title_ja => 'jpmobile on Rails 3 の作り方', :speaker => 'Shin-ichiro OGAWA (Tokyu.rb / Nihon Ruby no Kai)', :from => '14:00', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile_ja => (<<PROFILE_JA), :profile => (<<PROFILE), :presentation_material => (<<PRESENTATION_MATERIAL), :vimeo_id => 14548658, :nicovideo_id => 'sm11901698'
Jpmobile is a Rails plugin for Japanese mobile phones. This plugin features the ability to convert Japanese emoticons and Japanese kanji codes, and session management for mobile phones which can't handle HTTP cookies. In this talk, I will introduce how we rebuilt the jpmobile codebase to support Rack applications such as Rails 3 and Sinatra.
ABSTRACT
jpmobile を Rails 3 や Sinatra に対応させるまでの道のりを紹介。Rack化や絵文字やデコメへの対応などを、どのようにRailsをハックしたかとともに紹介します。
ABSTRACT_JA
小川 伸一郎 (Tokyu.rb)
株式会社イオレで「らくらく連絡網」という携帯向けメーリングリストサービスの開発に従事。RubyKaigi2009を機にjpmobileのコアコミッターに。京都生まれで大阪育ちの博士（理学）。
PROFILE_JA
Shin-ichiro OGAWA (Tokyu.rb)
Developer of Raku-Raku renraku-mou in eole. inc., which is mailing list service for Japanese mobile phone. Core commiter of jpmobile.
Born in Kyoto, grew up in Osaka. Ph.D in Physics, but It's no use for works.
PROFILE
http://www.slideshare.net/rust/jpmobile-on-rails-30
PRESENTATION_MATERIAL
    e27_big.create :title => 'Open social application development for cell-phones to begin in Ruby on Rails', :title_ja => 'Ruby on Railsではじめる携帯電話向けオープンソーシャルアプリケーション開発', :speaker => 'Masaki Yamada (Control plus Co. Ltd.)', :from => '14:30', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile => (<<PROFILE_JA), :presentation_material => (<<PRESENTATION_MATERIAL), :vimeo_id => 14549468, :nicovideo_id => 'sm11902001'
In the world of the open social application development for cell-phones, PHP is a major language, but the development using Ruby on Rails is possible. I show the know-how which we got through development of our product \"Sweets Collection\" and introduce open social application development using Ruby on Rails.
ABSTRACT
携帯電話向けのオープンソーシャルアプリケーション開発の世界では、PHPがメジャーな言語ですが、Ruby on Railsを使った開発も可能です。私達が自社プロダクト「スイーツコレクション」の開発を通じて得たノウハウを公開するとともに、Ruby on Railsを使ったオープンソーシャルアプリケーション開発をご紹介します。
ABSTRACT_JA
山田将輝 (コントロールプラス株式会社)
ソーシャルゲーム作ってます
レッドブルを入力するとソースコードを出力します
社内唯一のemacs派
@masarakki
github.com/masarakki
PROFILE_JA
http://www.slideshare.net/MasakiYamada/rubykaigi2010
PRESENTATION_MATERIAL
    e27_big.create_break :from => '15:00'
    e27_big.create :title => 'Building Real Time Web', :title_ja => 'リアルタイムウェブができるまで', :speaker => 'Makoto Inoue (New Bamboo (London, UK))', :from => '15:30', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA), :presentation_material => (<<PRESENTATION_MATERIAL), :vimeo_id => 14549558
The real time web is not about adding chat on your website. It's not really about having stock tickers. The most interesting aspect of the realtime web is to be found in augmenting the web that we already know. We can add realtime functionally to our applications as another layer of fidelity.
This is our story (New Bamboo, London, UK) of experimenting various real time web technologies and coming up with our own solutions (http://www.pusherapp.com). This is not about explaining how to use our solutions, but about sharing exciting opportunities and new technical challenges HTML5 WebSocket brings when you build real time web.
ABSTRACT
ここ最近のAjaxにかわるトレンドとしてリアルタイムウェブを利用した例が見かけられることが多いですが、その多くはチャットや株価更新などのサンプルの域をでないように見えます。弊社New Bamboo (London, UK)では、既存のリアルタイム技術をいろいろ研究した結果をPusher (http://www.pusherapp.com)というサービスとしてリリースしました。このトークでは、リリースにいたるまでの経緯をご紹介すると共に、HTML5 WebSocketを使うことによる新しい発見やチャレンジを皆様と共有していきたいと思います。
ABSTRACT_JA
Makoto Inoue (New Bamboo)
Rubyist living in London since 2004 (though did not know about Ruby when I was in Japan. Sorry..)
ex-DBA(Sybase). Co-organises London Javascript Meetup, London NoSQL Summer. Hosts Tokyo Cabinet Wiki. Currently toying around with Golang.
PROFILE
井上真(New Bamboo)
2004年からロンドンに在住中の逆輸入Rubyist（日本にいる時はRubyのこと知りませんでした。すみません）。元DBA(Sybase)。London Javascript Meetup, London NoSQL Summerの共同運営者、Tokyo Cabinet Wiki主催、 ３ヶ月ごとに興味の対象が変わるのが悩み。現在はGolangに浮気中。
PROFILE_JA
http://www.slideshare.net/inouemak/building-realtimewebslide
PRESENTATION_MATERIAL
    e27_big.create :title => 'We can make the GC X times slower than the original', :title_ja => 'われわれは、GCをX倍遅くできる', :speaker => 'nari (Network Applied Communication Laboratory)', :from => '16:00', :to => '17:00', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA), :presentation_material => (<<PRESENTATION_MATERIAL), :vimeo_id => 14549681
The presentation introduces the technique and a result about Lazy Sweep GC for CRuby GC. In addition, I introduce the prospects of the future GC improvement.
ABSTRACT
CRubyに対するLazySweepGCの実装方法と結果を紹介する。また、今後のGC改善の展望を述べる。
ABSTRACT_JA
nari (Network Applied Communication Laboratory Ltd.)
A Ruby commiter.
He is good at letting it collect garbages.
He have written a japanese book: "Garbage Collection - Algorithms and implementions"
PROFILE
nari（株式会社ネットワーク応用通信研究所）
Rubyコミッタ。ゴミを集めさせることが得意。
著書は『ガベージコレクションのアルゴリズムと実装』（共著）
PROFILE_JA
http://www.slideshare.net/authorNari/gcx
PRESENTATION_MATERIAL
    e27_big.create_break :from => '17:00'
    e27_big.create :title => 'The basis of making DSL with Ruby', :title_ja => 'Rubyで作るDSLの基礎', :speaker => 'Yasuko Ohba (Everyleaf Corporation)', :from => '17:30',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA), :presentation_material => (<<PRESENTATION_MATERIAL), :vimeo_id => 14549764
Ruby is well known as a language with which you can create your own DSL easily. Making DSL with Ruby is really easy, but there seem to be many developers who have not tried to make DSL with Ruby by design. In my opinion, there is no clear boundary between 'Useful APIs' and DSL. However, we can always judge whether a code is like DSL or not, that means, we can create DSL by design. In this talk, I'll start by looking into what DSL is and when to use it. After that I'll talk what concepts, habits and techniques you need to make your own DSL, showing typical examples from famous DSL codes like Rails, RSpec and so on.
ABSTRACT
RubyはDSLを作りやすい言語として知られています。実際に、DSLを作るのは簡単です。しかし、Rubyで意識的にDSLを作ったことのある人は意外に少ないのかもしれません。 Rubyで実現するDSLは、「使いやすいAPI」の一形態であり、ここから先がDSLだという明確な境界はありませんが、結果として出来上がったコードがDSL的かどうかは歴然と判断できます。つまり、コードをDSL的にするかどうかは開発者が意図的に選択していける事柄なのです。 本セッションでは、DSLとは何か、どんなときにDSLが有効かからはじめて、RubyでDSLを書く際に必要となる考え方、習慣、そしてテクニックを、 Rails や RSpec といった良く知られたコードを例にして話していきます。
ABSTRACT_JA
Yasuko Ohba (Everyleaf Corporation), nay3
A Rails application developer who loves programing.
President & CEO of Everyleaf Corporation.
One of her products is Kozuchi, a family bookkeeping web application.
Wrote the book “Ruby on Rails 逆引きクイックリファレンス” (with other authors, published by Mainichi Communications Inc.) and translated Ola Bini's "Practical JRuby on Rails Web 2.0 Projects" into Japanese (with other guys. The Japanese version, "JRuby on Rails 実践開発ガイド" was published by SHOEISHA).
PROFILE
大場寧子（株式会社万葉）, nay3
実装をこよなく愛するRailsエンジニア。株式会社万葉の代表取締役社長。
プロダクトにWeb家計簿「小槌」など。
著書「Ruby on Rails 逆引きクイックリファレンス」（共著、毎日コミュニケーションズ） 訳書「JRuby on Rails 実践開発ガイド」（Ola Bini 著、共訳、翔泳社）。
PROFILE_JA
http://www.slideshare.net/nay/the-basis-of-making-dsl-with-ruby
PRESENTATION_MATERIAL
    e27_big.create :title => 'Best Imitation of Your Class', :title_ja => '君のクラスの最高の偽物', :speaker => 'Shugo Maeda (Network Applied Communication Laboratory Ltd.)', :from => '18:00', :to => '19:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA), :vimeo_id => 14549892
Ruby's open classes contribute to extensibility of applications such as Ruby on Rails. However, they sometimes cause serious conflicts between class extensions. This talk illustrates problems of open classes, and propose a resolution by which classes can be refined locally.

  Keywords: selector namespace, classbox, context-oriented programming
ABSTRACT
Rubyのオープンクラスは、Ruby on Railsのようなアプリケーションの拡張性に 寄与している。しかし、オープンクラスはクラス拡張間の深刻な衝突を引き起こ すこともある。この発表では、オープンクラスの問題を説明し、クラスを局所的に 変更することができるような解決法を提案する。

  キーワード: selector namespace, classbox, context-oriented programming
ABSTRACT_JA
Shugo Maeda (Network Applied Communication Laboratory Ltd.)
He is a director of Network Applied Communication Laboratory Ltd., a co-chairperson of Ruby Association LLC, and a daimyo programmer.
PROFILE
前田 修吾（株式会社ネットワーク応用通信研究所）
株式会社ネットワーク応用通信研究所取締役。Rubyアソシエーション副理事長。大名プログラマ。
PROFILE_JA
  end

  e27.with_options(:room => @medium) do |e27_medium|
    e27_medium.create :title => 'Feels Like Ruby', :speaker => 'Sarah Mei (Pivotal Labs)', :from => '14:00',:abstract => (<<ABSTRACT), :profile => (<<PROFILE), :presentation_material => (<<PRESENTATION_MATERIAL), :vimeo_id => 14546877
For a Rubyist, writing Javascript is the worst part of working on a Ruby web application. Those clean, modern UIs are often made possible by incredibly complex Javascript. The helpers inevitably get in the way, and you end up writing most of it by hand.

It is painful.

But you can make writing Javascript code feel more like writing Ruby code. I will show techniques that go beyond \"unobtrusive\" and turn Javascript into a first-class citizen in your Ruby application. Make your Javascript more joyful!
ABSTRACT
Sarah Mei has spent most of the last dozen years writing code, and
most of the last four doing Ruby. She's a developer at Pivotal Labs,
and a pair programming fangirl. She spends a lot of her free time
showing people of all ages and backgrounds how awesome programming is
- especially, of course, with Ruby.
PROFILE
http://www.slideshare.net/sarahmei/feels-like-ruby-ruby-kaigi-2010
PRESENTATION_MATERIAL
    e27_medium.create :title => 'User Experience for Library Designers', :speaker => 'geemus (Wesley Beary)(Engine Yard)', :from => '14:30',:abstract => (<<ABSTRACT), :profile => (<<PROFILE), :vimeo_id => 14547164
I've written \"a lot of code\":http://github.com/geemus, both hobby and work, over the last year, and looking back I can't help but think that writing code for yourself is easy; it's writing code for others can be tough. In this session, I'll share some examples of good and bad practices gathered in my years writing code and libraries, and discuss how to get past being too close to the problem. I'll talk specifically about growing your work into something anybody (and hopefully everybody) will use.
ABSTRACT
geemus (Wesley Beary) [github.com/geemus] is an avid Rubyist and Open Source enthusiast. When not spending his spare time working on enumerable overly ambitious open source projects he spends his days developing the Engine Yard Cloud [http://www.engineyard.com/products/cloud].
PROFILE
    e27_medium.create_break :from => '15:00'
    e27_medium.create :title => 'Rubygems, Bundler, and the future', :speaker => 'Carl Lerche (Engine Yard)', :from => '15:30',:abstract => (<<ABSTRACT), :profile => (<<PROFILE), :vimeo_id => 14547561
Rubygems has served the community well for many years. However, as applications become more and more complex, certain problems arise. Bundler was created to solve some of those problems and has been evolving rapidly based on community feedback. It's time to look at the current state of affairs and think about Rubygems 2.0. What parts of bundler could be moved upstream and what problems remain to be solved?
ABSTRACT
Until Carl Lerche discovered Ruby on Rails in 2005 he thought he would
never do web development again. It was Ruby that lured him back into
programming and open source development. Currently, he spends much of
his time at Engine Yard contributing to Rails, and in his free time,
to many side projects.
PROFILE
    e27_medium.create :title => 'Truth and Consequences: Handling Ruby 1.9 Encodings in Rails', :speaker => 'Yehuda Katz (Engine Yard)', :from => '16:30',:abstract => (<<ABSTRACT), :vimeo_id => 14547743
Ruby 1.9 adds support for many different encodings, making it possible to write Ruby web programs that can handle non-English characters well. However, these changes have had many consequences. At the beginning, the new encoding support has introduced much confusion in simple, English-only Rails applications and applications relying heavily on Unicode. Yehuda will explain the common problems caused by the changes, talk about what Rails has done to eliminate many of them, and what the Ruby community can do to make writing internationalized programs easier.
ABSTRACT
    e27_medium.create :title => 'A frog in a well does not know the great sea', :title_ja => '井の中の蛙、大海を知らず', :speaker => 'Sarah Allen (Mightyverse)', :from => '16:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :profile => (<<PROFILE), :presentation_material => (<<PRESENTATION_MATERIAL), :vimeo_id => 14547648
When building an application it is easy to forget that most applications today are available globally and used by people who speak many languages. You may create user interface in English or Japanese, but people may choose to type their data in their native language. Web browsers will allow people to enter text in almost any script, and if you are lucky it will \"just work\" ... but often it needs a little more attention. Sarah will share anecdotes from her adventures building Mightyverse, a multi-lingual database of native language video recordings. She will highlight details of how to get unicode text in and out of a database well as how to handle multibyte text in Ruby.
ABSTRACT
アプリケーションを構築する時、ほとんどのアプリケーションが今日グローバル的に使用されること、多国語を話す人々に使用されること忘れがちになってしまいます。あなたは、英語や日本語のユーザーインターフェイスを制作するかもしれません。でも、人々は母国語でデーターを記入することを選ぶかもしれません。ウェブブラウザは、ほぼすべてのスクリプトを記入することを可能にします。もし、あなたがラッキーなら、それはなんとか機能するかもしれません。しかし、しばしば、それはもう少し注意を必要とします。サラは、ネイティブスピーカーのビデオを使用した多国語データーベースのMightyverseを構築する経験からの逸話を共有するでしょう。　サラは、どのようにしてUnicodeテキストをデータベースに出し入れするのかの詳細に重点をおきます。また、Rubyでどのようにマルチバイトテキストを扱うかにも重点をおきます。
ABSTRACT_JA
Sarah leads a small consulting group, Blazing Cloud, and is working on a mobile-focused startup, Mightyverse. Sarah started in web development by creating Shockwave and Flash video, but has enjoyed the transition from native, proprietary code to dynamic languages and open source.  In addition to mobile and web development, she regularly teaches Ruby and Rails with a test-first approach. In her spare time, Sarah works to diversify the Ruby on Rails community with a focus on outreach to women through the RailsBridge Open Workshop project.  She blogs at ultrasaurus.com and tweets as @ultrasaurus.
PROFILE
http://www.slideshare.net/sarah.allen/international-web-application-development
PRESENTATION_MATERIAL
    e27_medium.create_break :from => '17:00'
    e27_medium.create :title => 'My many failed products', :speaker => 'jugyo (Everyleaf Corporation)', :from => '17:30',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile_ja => (<<PROFILE_JA), :profile => (<<PROFILE), :vimeo_id => 14547828
I will talk about my many failed products, and a few of my successful ones. My products can be found here: http://github.com/jugyo
ABSTRACT
私のたくさんの失敗プロダクトと少しの成功プロダクトについて話します。 私のプロダクトはここ => http://github.com/jugyo/
ABSTRACT_JA
jugyo, 河野十行 (株式会社万葉)
Rails エンジニアであり Termtter と g の開発者。
github.com/jugyo
PROFILE_JA
jugyo, Kazuyuki Kohno (Everyleaf Corporation)
He is a Rails engineer, and author of Termtter and g.
github.com/jugyo
PROFILE
    e27_medium.create :title => 'Coding for fun, and having fun coding', :title_ja => 'みんなが楽しくプログラミング出来る魔法', :speaker => 'tenderlove (AT&T Interactive)', :from => '18:00', :to => '19:00', :abstract => (<<ABSTRACT), :profile => (<<PROFILE), :presentation_material => (<<PRESENTATION_MATERIAL), :vimeo_id => 14547904
Programming for fun, or having fun programming. Ruby is the best language for both! Let's talk about programming after we've punched out from work, the programming we can do while drinking a beer, and the programming we can do to make our friends laugh. We'll take a look at projects built for fun, as well as projects built to have fun! We'll dissect them to figure out what makes them tick, then
extract techniques that we can use with our day to day tasks.
ABSTRACT
Aaron Patterson:

Mild mannered Rubyist by day, and culinary superhero by night. When
Aaron isn’t ruining people’s lives by writing software like phuby,
enterprise, and neversaydie, he can be found writing slightly more
useful software like nokogiri. To keep up his Gameboy Lifestyle, Aaron
spends his weekdays writing high quality software for ATTi. Be sure to
catch him on Karaoke night, where you can watch him sing his favorite
smooth rock hits of the 70’s and early 80’s.
PROFILE
http://www.slideshare.net/tenderlove/having-fun-programming
PRESENTATION_MATERIAL
  end
  e27.create :title => 'World Wide Ruby Conferences', :title_ja => '世界の Ruby Conference から', :speaker => 'Kuniaki IGARASHI (Everyleaf Corporation)', :room => @b202, :from => '17:30', :to => '19:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'en, ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA)
There are many Ruby/Rails conferences, \"RubyKaigi\"s and Ruby/Rails meetups throughout the world, but we can only participate in a few of these. I'd like to use the \"Lightening Talk\" style to introduce some of the people running these other meetups. You may learn about a new meetup to visit, or give you ideas for your own m0eetup.

Speakers

Pat Allan
Rails Camps
http://railscamps.com/

Chad Fowler
Rubyconf
http://rubyconf.org/

Jiang Wu
Rubyconf China
http://rubyconfchina.org/

Daniel Bovensiepen
EuRuKo
http://euruko2011.org/

Masayoshi Takahashi
RubyKaigi
http://rubykaigi.org/
ABSTRACT
世界中でたくさんのRuby会議、Ruby/Rails Conference、Ruby/Rails勉強会が行われています。私たちが参加できるのはそのうちのほんの一部です。この時間は世界中の勉強会を運営する方々にLT形式で紹介していただきます。次に行く勉強会を開拓したり、あなたが開催する勉強会の参考にするのはいかがでしょうか？

Speakers

Pat Allan
Rails Camps
http://railscamps.com/

Chad Fowler
Rubyconf
http://rubyconf.org/

Jiang Wu
Rubyconf China
http://rubyconfchina.org/

Daniel Bovensiepen
EuRuKo
http://euruko2011.org/

Masayoshi Takahashi
RubyKaigi
http://rubykaigi.org/
ABSTRACT_JA
Kuniaki IGARASHI , igaiga (@igaiga555) http://github.com/igaiga
Rails and iPhone app developer in Everyleaf Corporation.
Chief developer of the timer "TwYM" that is used in RubyKaigi2009
Lightning Talks.
Staff of Kosen Conference Committee, founder of coffee.rb.

Daniel Bovensiepen (@bovensiepen) http://www.bovensiepen.net
Projectmanager at Siemens AG.
Building High Frequency Radios for Mass Transit Projects.
Giving another talk at RubyWorld Conf 2010

Jiang Wu
Jiang Wu(呉江) is a Ruby developer in Shanghai, China. He has worked with Ruby for 3 years. In 2008, he open sourced a library of Chinese payment gateway, implemented in Active Merchant. From 2009, he is devoted to promote "off rails", such as Sinatra and Sequel, in China.

and Chad Fowler.
PROFILE
五十嵐邦明 (@igaiga555) http://github.com/igaiga
株式会社万葉 で Rails, iPhone アプリの開発に従事。
RubyKaigi2009 Lightning Talks で使われたタイマー "TwYM" のメイン開発者。
高専カンファレンス副代表、coffee.rb設立者。
PROFILE_JA
  e27.with_options(:room => @a202) do |e27_a202|
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

  e27.with_options(:room => @b201) do |e27_b201|
    e27_b201.create :title => 'rake:money', :title_ja => 'rake:money 拡大版～Rubyエンジニアと企業の幸せな関係～', :speaker => 'Ayumu Aizawa / Ouka Yuka (rake:money and RubyKaigi2010 Sponsors)', :from => '14:00', :to => '16:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
The meeting of the IT system engineer to think that I earn money seriously.

I raise awareness of the money, and it is a meeting of the people who want to become the engineer who can earn one's convincible income. I take up marketing and a business trend or a topic about the money that it is not readily possible for in a topic about economy in tax or assets use in the normal technology system study society how I cut one's skill efficiently in imitation Ta'izz.

In the Ruby meeting extension, I make it.
ABSTRACT
真剣にお金を稼ぐことを考えるIT系エンジニアの会。

お金に対する意識を高めて、自分の納得のいく収入を稼げるエンジニアになりたいと考える人たちの会合です。 自分のスキルをどうすれば効率よくマネタイズできるか、マーケティングやビジネストレンド、はたまた節税や資産運用についてなど、普通の技術系勉強会ではなかなか話題にできないお金に関する話題を取り上げます。

Ruby会議拡大版では、Ruby会議スポンサーの各社をパネラーに迎え、Rubyエンジニアに対するビジネスニーズや、企業の中のRubyist がどのようにビジネス価値を発揮していくかといったテーマについてパネルディスカッションを行います。
ABSTRACT_JA
    e27_b201.create :title => 'Ruby Business Owner Kaigi', :title_ja => 'Ruby親方会議', :speaker => 'Takeyuki FUJIOKA (xibbar)(Rabbix corporation / Nihon Ruby no kai)', :from => '16:00', :to => '18:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Ruby's small business owner talk about own working and exchange experience each other.
ABSTRACT
Rubyを使ってスモールビジネスを展開しているビジネスオーナーの情報交換を行います。
ABSTRACT_JA
  end

  foyer_event = e27.create :title => "Let's create your own T-shirt designed by Ruby at RubyKaigi 2010!! / The Origami Ruby (paper craft) Generated by The Ruby", :title_ja => 'RubyKaigiで自分だけのrubyTシャツを作ろう！ / Ruby で作る Ruby の折り紙', :speaker => '(See Abstract)', :room => @foyer, :from => '13:00', :to => '15:30',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Events held during the session in the foyer.
ABSTRACT
会期中にホワイエにて行われているイベントです。
ABSTRACT_JA
  e27.create :title => "Let's create your own T-shirt designed by Ruby at RubyKaigi 2010!!", :title_ja => 'RubyKaigiで自分だけのrubyTシャツを作ろう！', :speaker => 'Yasuo Yoshikawa (tmix producer)', :room => @foyer, :from => '13:00', :to => '15:30',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :parent_event => foyer_event, :profile_ja => (<<PROFILE_JA)
Let's create your own T-shirt designed by Ruby on tmix! tmix is the only on-demand retail platform for consumers.

If you can create T-shirt today, you can put on it tomorrow!

This event open until Aug 27th 15:00 pm . price 1,500en (front or back print only!) White or Black T ,size 160,S,M,L,XL Cash only.
ABSTRACT
tmixを使って、自分だけのRubyKaigi記念rubyTシャツを作ろう！

・Rubyのコードでデザイン、意外にカッコいいかも！？
・twitterのアカウントなど入れてもOK！
・ユニフォーム交換のように会場であった人と交換しても楽しい！

今日作って明日届く！みんなで着てワイワイ楽しも〜☆

！！注意！！白、黒メンズ定番Tシャツ（160〜XL）のみ。前側、もしくは背中側どちらかの面のみ。午後15時までに注文をお願いします。

1枚1,500円（現金のみ）

作り方（各自持参のPCにてお願いします。）
・http://tmix.jp/rubykaigi2010 にアクセス
・tmix会員登録、もしくはopenIDを使って各自でログイン
・サンプルデザインから、各自思い思いにデザイン
・デザインが終わったら、サイズを選択。名前、メアドを記入して購入ボタンで注文完了。その後tmix担当（吉川）にすぐに支払い、引換券をもらう。
※支払いを持って正式に注文を受付となります。

・翌日午後13時から17時のあいだに受け取る。

2010 年 8 月 27 日(金)のみ開催注文は28 日(土)13時から17時までに会場で受け取りできる人のみ。
ABSTRACT_JA
株式会社spice life代表取締役。
オリジナルTシャツデザインサイトtmix http://tmix.jp/ ,
ミニ名刺作成pocketer http://pocketer.jp/
を運営してます。
ちなみに、tmixはrailsで作ってます。

http://twitter.com/yoshikawayasuo
PROFILE_JA
  e27.create :title => "The Origami Ruby (paper craft) Generated by The Ruby", :title_ja => 'Ruby で作る Ruby の折り紙', :speaker => 'Hiroyuki Shimura (Nihon Ruby-no-kai (Japan Ruby Group))', :room => @foyer, :from => '13:00', :to => '15:30',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :parent_event => foyer_event
  The Origami Ruby (paper craft) Generated by The Ruby: Let's fold origami \"Ruby\" like http://dl.dropbox.com/u/4921720/RubyFoldings/IMG_0362.A3_C35_Chu25.WebSmall.JPG  . In the first half, we will fold origami \"Ruby\" together with the origami paper that has crease fold lines. In the second half, we will fold something with foil paper and cellophane paper and read a Ruby script that generates paper with crease fold lines.
ABSTRACT
  Ruby の折り紙を折ります。http://dl.dropbox.com/u/4921720/RubyFoldings/IMG_0362.A3_C35_Chu25.WebSmall.JPG
  折り線をプリントした展開図を用意しますので、前半それを参考にみんなで折りましょう。後半は、ちょっと難しくなりますがホイル折紙や透明折紙(セロファン)で折ってみたり、或は展開図を作成する Rubyスクリプトを読みましょう。
ABSTRACT_JA
end
