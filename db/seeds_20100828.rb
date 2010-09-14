# -*- coding: utf-8 -*-
EventLoader.with_options(:day => 28) do |e28|
  e28.with_options(:room => @big) do |e28_big|
     e28_big.create :title => 'Ruby 1.9.2 is released! / Ruby committers Q & A', :title_ja => 'Ruby 1.9.2 is released! / Rubyコミッタ Q & A', :speaker => 'Yugui, Shugo Maeda', :from => '9:30', :to => '11:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Many committers will come to RubyKaigi, so it's a good chance to ask them. In this event Ruby committers will answer questions from audience (or other committers).
ABSTRACT
RubyKaigiにはたくさんのコミッタが来場するので、彼らに質問するよい機会です。このイベントでは、Rubyコミッタが聴衆(又は他のコミッタ) からの質問に回答します。
ABSTRACT_JA
    e28_big.create :title => 'Keynote', :title_ja => '基調講演', :speaker => 'Matz', :length => 1.hour, :lang => 'ja', :profile_ja => (<<PROFILE_JA)
いまや数えきれないほどのユーザーを持つ世界的プログラミング言語Rubyの創造者。っていうか、そういう立場に本人が一番困惑してるんですが。
PROFILE_JA
    e28_big.create_break :from => '12:00', :length => 90.minutes
    e28_big.create :title => 'Esoteric Obfuscated Ruby Programming', :title_ja => '超絶技巧 Ruby プログラミング', :speaker => 'Yusuke Endoh (independent)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA), :presentation_material => (<<PRESENTATION_MATERIAL)
Ruby allows us to write not only easy-to-read programs but also hard-to-read programs. In this presentation, we introduce our \"artistically\" hard-to-read programs written in Ruby. We also discuss its implementation techniques, if time permits.
ABSTRACT
Ruby は読みやすいプログラムを簡単に書ける言語だが、読みにくいプログラムも簡単に書ける。 本発表では、発表者による「芸術的に」読みにくい Ruby プログラムを紹介する。 時間があれば、その実装技法の解説を行う。
ABSTRACT_JA
A committer for Ruby and RubySpec.  1.9.2 assistant release manager.
A Ruby test maintainer.
His main interests are YARV, release engineering, tests, functional programming features and bignum.
He enjoys esoteric programming and Quine.
PROFILE
Ruby と RubySpec のコミッタ。1.9.2 リリースマネージャ補佐。Ruby テストメンテナ。
評価器 (YARV) 、リリースエンジニアリング、テスト、関数型プログラミング機能、Bignum など、Ruby の中でもどうでもいいところに興味を持つ。
Esoteric programming や Quine を好む。
PROFILE_JA
http://www.slideshare.net/mametter/ruby-esoteric-obfuscated-ruby-programming-5088683
PRESENTATION_MATERIAL
    e28_big.create :title => 'Daily Ruby', :title_ja => 'Rubyな日々', :speaker => 'Kazuhiro NISHIYAMA (Good-Day, Inc.)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
I will talk about my daily life as a committer of Ruby and the Ruby Reference Manual Renewal Project.
ABSTRACT
Ruby や Ruby リファレンスマニュアル刷新計画のコミッターとしてどういうことをしているのかという話をする予定です。
ABSTRACT_JA
    e28_big.create :title => 'Ruby Reference Manual Renewal Project 2010 Summer', :title_ja => 'Ruby リファレンスマニュアル刷新計画 2010 夏', :speaker => 'okkez (Ruby Reference Manual Renewal Project)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
In this talk, I will talk about Ruby Reference Manual Renewal Project and discuss the latest developments and future plans.
ABSTRACT
昨年の報告以降の動きをまとめて報告します。また、今後の予定や特に助けが必要な部分について説明します。
ABSTRACT_JA
    e28_big.create_break
    e28_big.create :title => 'Ruby API is Improved Unix API', :title_ja => 'Unix修正主義', :speaker => 'Tanaka Akira (National Institute of Advanced Industrial Science and Technology (AIST))', :length => 1.hour,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA)
Ruby's library API is like Unix's API, but improved. Ruby tries to fix some of the problems in Unix's API. For example, non-blocking IO in Unix is provided by setting a flag when opening a file, making it difficult to specify non-blocking behavior for individual operations. Ruby overcomes this problem by providing non-blocking methods such as #read_nonblock.

Another example is the fork() system call, which has problems in multi-threaded environments. Ruby provides the #spawn method as an alternative way to launch processes safely.

This presentation will discuss techniques for API problem discovery with more examples of Ruby's improvements over Unix's API and other problematic parts of Unix which Ruby may improve in the future.
ABSTRACT
Ruby のライブラリ API は Unix の影響を色濃く受けているが、 Unix の API をそのまま提供しているのではなく、 Unix の失敗を修正している部分がいくつかある。 たとえば、ノンブロッキング I/O は、オープンしたファイルに対するフラグで指示するため、 特定の操作だけをノンブロッキングにすることが難しい。 これに対し、Ruby ではフラグでなく read_nonblock メソッドなどを用いることにより、それが簡単になっている。 また、プロセスを起動する fork システムコールは近年のマルチスレッド環境では大きな問題がある。 これに対し、Ruby ではその問題がないプロセス起動方法として spawn メソッドを導入した。 本発表ではこのような修正例を述べ、また、まだ修正していない Unix の失敗とそれを Ruby で修正する可能性について述べる。 それにより、API の問題の発見と修正についての知見を示す。
ABSTRACT_JA
A Ruby committer.
Main interests are I/O, socket, process, time and other difficulties.
PROFILE
Ruby コミッタ。
主に I/O、ソケット、プロセス、時刻、その他の厄介事に興味を持つ。
PROFILE_JA
    e28_big.create_break
    lt_event = e28_big.create :title => 'Lightning Talks', :abstract => "Lightning Talks are 11 x 5minutes talk in a 60 minutes time slot", :abstract_ja => "1人持ち時間5分のライトニングトークです", :speaker => '(See Abstract)', :length => 1.hour, :lang => 'ja, en'
    e28_big.create :title => 'ARToolKit Ruby Binding', :abstract => '', :speaker => 'Urabe, Shyouhei (Network Applied Communication Lab.)', :lang => 'ja', :parent_event => lt_event, :from => '17:00', :to => '18:00', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA)
Urabe Shyouhei (Network Applied Communication Laboratory)

is a software scientist, best known as a Ruby core developer who maintains
Ruby 1.8.7.  He is now mainly writing codes at NaCl.  His presentation is
based on what he wrote there.
PROFILE
Ruby 1.8.7のお守り係として知られるが本人はプログラマのつもりなので、たまには
作ったプログラムの紹介をしたい。仕事で作ったやつだけど。
PROFILE_JA
    e28_big.create :title => 'Toward creating a single stand-alone executable of Ruby', :title_ja => "Ruby/Tk-Kit から RubyKit へ : Ruby の単一ファイル実行環境の構築に向けて", :abstract => '', :speaker => 'Hidetoshi NAGAI (Kyushu Institute of Technology / Rubyist Kyushu)', :lang => 'ja', :parent_event => lt_event, :from => '17:00', :to => '18:00', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA), :presentation_material => (<<PRESENTATION_MATERIAL)
One of CRuby committers and a Ruby/Tk developer.
PROFILE
CRuby の commit 権所有者で，Ruby/Tk 開発者．
PROFILE_JA
http://www.dumbo.ai.kyutech.ac.jp/~nagai/RubyTk/?%A5%D7%A5%EC%A5%BC%A5%F3%A5%C6%A1%BC%A5%B7%A5%E7%A5%F3%BB%F1%CE%C1
PRESENTATION_MATERIAL
    e28_big.create :title => 'What is few?', :abstract => '', :speaker => 'Shota Fukumori/@sora_h (few developers team)', :lang => 'ja', :parent_event => lt_event, :from => '17:00', :to => '18:00', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA)
Shota Fukumori (sora_h) is a junior high school 2 grade *half-time(!)* student and a rubyist in Japan.
He commits to Termtter and some projects and his repository, and create web service by rails. Also he is usually talking at some communities. He has a online workshop which name is online.sg http://onlinesg.org/ .
PROFILE
Shota Fukumori (sora_h)は中2で半登校 (昼休み後早退). よくtermtterや自分のレポジトリにコミットしたり, Rails などでいろいろ作ってたり, よくいろんなコミュニティのチャットで喋っている. そしてOnline.sg と呼ばれるオンラインの勉強会を開催したりもしている.
PROFILE_JA
    e28_big.create :title => 'Toward Lightning RubyVM', :abstract => '', :speaker => 'Koichi Sasada (The University of Tokyo)', :lang => 'ja', :parent_event => lt_event, :from => '17:00', :to => '18:00'
    e28_big.create :title => 'MessagePack, a cross-language communication system', :title_ja => 'MessagePackで多言語間通信', :speaker => 'Sadayuki Furuhashi', :lang => 'ja', :parent_event => lt_event, :from => '17:00', :to => '18:00', :abstract => '', :abstract_ja => ''
    e28_big.create :title => 'Let\'s calculate easily civil days by using "Ruby"', :title_ja => 'Rubyで手軽に暦日を算出しよう！', :abstract => '',:abstract_ja => '' ,:speaker => 'Yoshihiko Hara, Japan OSS Promotion Forum Application Sub Committee Ruby Application Task Force, FUJITSU SOCIAL SCIENCE LABORATORY LIMITED', :lang => 'ja', :parent_event => lt_event, :from => '17:00', :to => '18:00'
    e28_big.create :title => 'Introducing the Lingo Project: A New Generationi Text Input System Leveraging Non-native English Writing', :abstract => '', :speaker => 'Kazki Matz (Lingo project)', :lang => 'ja', :parent_event => lt_event, :from => '17:00', :to => '18:00'
    e28_big.create :title => 'babushka―test-driven sysadmin for rubyists', :abstract => '', :speaker => 'Ben Hoskings (babushka)', :parent_event => lt_event, :from => '17:00', :to => '18:00'
    e28_big.create :title => 'parse.y Fam Tour', :title_ja => "parse.yの歩き方 -ワシのRubyは4式まであるぞ-", :abstract => '', :speaker => 'Ando Yasushi (Seesaa Inc.)', :lang => 'ja', :parent_event => lt_event, :from => '17:00', :to => '18:00', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA)
The author of the first and last Google Wave book written in Japanese; the book released on August 19th.
PROFILE
たぶん史上最後のGoogle Wave本の著者。あとおっぱいとかカリスマとか
PROFILE_JA
    e28_big.create :title => 'The Timeless Way of E-Publishing with Ruby', :title_ja => "時を超えた電子出版の道の中をRubyと歩いていく", :abstract => '', :speaker => 'Masayoshi Takahashi (Tatsu-zine publishing, Nihon Ruby-no-Kai)', :lang => 'ja', :parent_event => lt_event, :from => '17:00', :to => '18:00'
    e28_big.create :title => "My Report of \"Ruby Summer of Code 2010\" - Road to be a stdlib -", :title_ja => "Ruby Summer of Code 2010のご報告 〜俺たちのDecimalはまだ始まったばかりだ〜", :abstract => '', :speaker => 'Tadashi Saito (University of Tsukuba)', :lang => 'ja', :parent_event => lt_event, :from => '17:00', :to => '18:00', :profile => (<<PROFILE)
Tadashi is in his nth year of University of Tsukuba where n is smaller than 0xDEAD. He is always interested in to make the world better a little, so he started Decimal project. It's the only one project which was accepted in Ruby Summer of Code 2010 from Japan, but Tadashi wants a cute girlfriend rather than a bounty. His weak subject is math.
PROFILE
  end

  e28.with_options(:room => @medium) do |e28_medium|
    e28_medium.create :title => 'Rocking the enterprise with Ruby', :speaker => 'Munjal Budhabhatti And Sudhindra Rao (ThoughtWorks Inc)', :from => '9:30',:abstract => (<<ABSTRACT)
ThoughtWorks has been working on a long scale project at Rackspace building data center of the future using Ruby. This projects has evolved since its inception. And so has the architecture. Developing in ruby has assisted us in managing changes to the business rules at a rapid pace. We have been delivering successfully every two weeks for last three years. We would like to share our learnings from this effort.
ABSTRACT
    e28_medium.create :title => 'Rails to Sinatra: What is ready', :speaker => 'Jiang Wu (Tengu)',:abstract => (<<ABSTRACT), :lang => 'en', :profile => (<<PROFILE)
As Sinatra 1.0 came out, we have a good alternative to rails(before is merb). I will introduce efforts of people around Sinatra community to eliminate gap of moving from Rails to Sinatra including my works.
ABSTRACT
Jiang Wu(呉江) is a Ruby developer in Shanghai, China. He has worked with Ruby for 3 years. In 2008, he open sourced a library of Chinese payment gateway, implemented in Active Merchant. From 2009, he is devoted to promote "off rails", such as Sinatra and Sequel, in China.
PROFILE
    e28_medium.create :title => 'Mapping the world with DataMapper', :speaker => 'Ted Han (%w(Videojuicer DataMapper))',:abstract => (<<ABSTRACT)
Ubiquitous computing has opened the door to two new revolutions, data collection and data manipulation. Mobile phones, digital cameras, low cost electronics, and wireless internet access have made it possible to collect data any time, anywhere. But what are we doing with the data once it's collected? How do we navigate the oceans of data we generate daily? Where can we find a Rubyist's tools for data mining and manipulation? We'll discuss how to use DataMapper, a Ruby data access library, to make sense of data of all kinds.
ABSTRACT
    e28_medium.create_break :from => '12:00', :length => 90.minutes
    e28_medium.create :title => 'The Necessity and Implementation of Speedy Tests', :speaker => 'Jake Scruggs (Backstop Solutions)', :length => 1.hour,:abstract => (<<ABSTRACT), :profile => (<<PROFILE)
Your project's software practices are deteriorating every minute the developers wait for slow tests to finish. Once developers get fed up and stop running the tests, disregard for failing builds can't be far behind, and from there it's only a short leap to the albatross of a brittle/irrelevant test suite. Luckily this can all be avoided by adopting some time-saving testing standards and practices.
ABSTRACT
In 2004 Jake Scruggs was a high school physics teacher.  Jobs since then: apprentice at Object Mentor, consultant at ThoughtWorks, consultant at Obtiva, and developer at Backstop Solutions.

He also created and maintains the code metrics gem: metric_fu
http://jakescruggs.blogspot.com/
http://metric-fu.rubyforge.org/
http://twitter.com/jakescruggs
http://www.backstopsolutions.com/
PROFILE
    e28_medium.create :title => 'Seamless Integration Testing', :speaker => 'paulelliott (Hashrocket)', :abstract => (<<ABSTRACT), :profile => (<<PROFILE)
Do you have a solid, full coverage integration test suite? You should. It is the final automated point of assurance that what you are about to push to production is not going to blow something up and cost your or your client money. I show how to integration test a real Rails application, demonstrating best practices you can apply to any setup and the latest technologies for fully covering your app, including javascript!
ABSTRACT
Paul works for Hashrocket on projects for clients ranging from small start ups to large enterprises. In addition to his consulting work, he contributes regularly to open source projects and maintains some of his own, most notably Fabrication, an object generation framework for Ruby. He is passionate about outside-in testing, Ruby, jQuery, and motorcycles.
PROFILE
    e28_medium.create_break
    e28_medium.create :title => 'A Metaprogramming Spell Book', :speaker => 'Paolo "Nusco" Perrotta', :length => 1.hour, :abstract => (<<ABSTRACT)
When I started to learn Ruby, I was awed by the code of experienced rubyists. That code was full of amazing magic tricks that I could barely understand. People called those tricks \"metaprogramming\".

With time, I found that metaprogramming sits right at the core of Ruby. To think in Ruby, I had to understand all those scary tricks! Feeling like a sorcerer's apprentice, I set out to write a Spell Book of metaprogramming techniques. Once I'd finished the Spell Book, metaprogramming didn't seem like black magic anymore. Instead, it just felt like any other set of techniques.

In this talk, I'll show you the content of my Spell Book, so that you don't have to go through the trouble of writing one yourself.
ABSTRACT
    e28_medium.create_break
  end

  e28.create :title => 'JRubyKaigi 2010', :title_ja => 'JRuby会議 2010', :speaker => 'Koichiro Ohba / Akasaka.rb (JRuby.org and EngineYard)', :room => @b202, :from => '12:00', :to => '18:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja, en'
It's JRubyKaigi for people who love JRuby, by JRuby core developers and Japanese JRuby developers. This kaigi will make both people who like JRuby already or not love JRuby much more. It will contain great sessions; the keynote session by Thomas E.Enebo(@tom_enebo) and Charles O.Nutter(@headus), the invited talks by Yoshiharu Hashimoto(@hasssie), Hiroshi Nakamura(@nahi), Takeru Sasaki(@urekat), Koichi Fujikawa(@fujibee), Yoko Harada(@yokolet). We also have 10 lightning talks. You can check out details of talks on JRubyKaigi 2010 web site.

  Site: http://j.rubykaigi.org/2010
ABSTRACT
JRuby コア開発者と日本のJRuby開発者によるJRubyが好きな人のためのJRubyKaigiを開催します。JRubyが好きな人はますます好きになり、そうでない人もJRubyが好きになる会議です。開催概要は次を予定しています。基調講演：Thomas E.Enebo(@tom_enebo) and Charles O.Nutter(@headus)、招致講演：Yoshiharu Hashimoto(@hasssie)、Hiroshi Nakamura(@nahi)、Takeru Sasaki(@urekat)、Koichi Fujikawa(@fujibee)、Yoko Harada(@yokolet)、他にライトニングトークスとして10枠を予定。詳しくはJRubyKaigi2010公式サイトを参照してください。。

  サイト: http://j.rubykaigi.org/2010
ABSTRACT_JA

  e28.with_options(:room => @a202) do |e28_a202|
    e28_a202.create :title => 'tDiaryKaigi', :title_ja => 'tDiary会議', :speaker => 'SHIBATA Hiroshi (Eiwa System Management,Inc., asakusa.rb, tDiary.org)', :from => '9:30', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA)
In this session, tDiary users and developpers will discuss future and love for tDiary! we plan to hackathon, and if you have useful patches, please attend this session.
ABSTRACT
tDiary のユーザと開発者が集まって今後のロードマップや意見交換を中心にtDiary愛について語り合いたいと思います。 Hackathonも予定していますので、コミッタに取り込んでもらいたいパッチがある人はぜひお越し下さい。
ABSTRACT_JA
SHIBATA Hiroshi(hsbt) (Eiwa System Management,Inc./asakusa.rb)
He is a programmer in Eiwa System Management,Inc. member of  Japanese Society for Quality Control (JSQC). His lifework is to develop Rails application and tDiary, The tsukkomi oriented weblog.
PROFILE
柴田博志(hsbt) (永和システムマネジメント/asakusa.rb)
サービスプロバイディング事業部プログラマ、品質管理学会 正会員
Rails を使った業務システムや tDiary という Web 日記システムを作っています。
PROFILE_JA
    e28_a202.create :title => 'Asakusa.rb in Tsukuba', :title_ja => '浅草.rb in つくば', :speaker => 'Akira Matsuda (Asakusa.rb)', :from => '12:00', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA)
During RubyKaigi, you'll find tons of foreign Ruby Stars and Book writers here in Tsukuba. Why don't we directly tell them our questions, requirements, and of course, our deep appreciation, since these days are only once a year and are a very special chance for us. OK, of course we're all willing to tell them, but we know it's very hard to do so. We can hardly distinguish who's who, maybe we lack the courage to talk to them, especially when there's a language barrier between us. So, Asakusa.rb are producing a special event which aims to help introduce everybody to one another and facilitate communicate. We're having live discussions with, for example,
    the creators of Rails 3, the author of \"The Passionate Programmer\", guys from the crazy \"Ruby Brigade\" Seattle.rb, and lot of other foreign super Ruby Stars who are sticking around here. C'mon everybody, let's get together and talk about \"your\" Ruby!
ABSTRACT
RubyKaigi の会場には、皆さんも日ごろお世話になっているはずのプロダクトや書籍の作者さんご本人がうじゃうじゃ来場しています。せっかくの年に一度のチャンスなので、是非この機会にいつも感じている疑問や要望、それから感謝の気持ちを思い切って直接作者さんに伝えちゃいましょう！とはいえ、誰が誰だかよくわからないし、いきなり面と向かっては話しかけづらいし、特に言語の壁があったりするとなかなか勇気が要りますよね？そこで、僕たち Asakusa.rbでは、Jeremy Kemper や Chad Fowler をはじめ、当日会場に居る豪華外タレさんたちをゲストにお迎えして、彼ら自身の 'あの'プロダクトについて、ご本人と Asakusa.rb のメンバーたちと、それからもちろん会場の皆様も巻き込んで、生のアツいディスカッションを行います。
ABSTRACT_JA
    e28_a202.create :title => 'Pair Programming Cultural Exchange', :title_ja => 'ペアプログラミング文化交流会', :speaker => 'Sarah Mei (Pivotal Labs)', :to => '18:00', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'en, ja'
We may not speak the same language, but we do have one language in common. So, we can code together!

Armed with a list of pair programming phrases in English and Japanese, let's work together on a project in Ruby. Coding together can help us bridge the artificial boundaries created by language, culture, and distance, and can create friendships that last beyond the conference.

Unicorns and ponies for everyone!
ABSTRACT
私たちが話す言葉は同じじゃないかもしれない。でも、私たちには一つの共通語がある。そう、だから私たちはいっしょにコードを書けるんだ！

この企画では、英語と日本語のペアプログラミング語録をひもときながら、あるRubyプロジェクトをいっしょにやってみましょう。いっしょにコードを書くことで、私たちの間の言語、文化、距離の壁を乗り越えて、Kaigiを越えた友情が生まれることでしょう。

ユニコーンとポニーをみんなに！
ABSTRACT_JA
  end

  e28.with_options(:room => @b201) do |e28_b201|
    e28_b201.create :title => 'jpmobile Kaigi 2010', :speaker => 'Shin-ichiro OGAWA (Tokyu.rb)', :from => '9:30', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA)
A Kaigi for \"jpmobile\" developers. Jpmobile is the de facto standard Rails plugin for Japanese mobile phones. Almost all of \"jpmobile\" developers will come to this session and discuss the future of jpmobile, then
start to struggle to make it real, that means, write codes. The main topics will be supporting Rails 3.0+ and Ruby 1.9, building Rack middleware.

Anyone who wants to contribute to jpmobile should attend this Kaigi.
ABSTRACT
日本全国から jpmobile 開発者・利用者が一堂に会して、jpmobile の今後について議論や開発を行う企画です。えにしテックの設楽さんを中心に、Rails 3.0 以降や Rack について、その場で議論して開発に入るハッカソンスタイルを取る予定です。
ABSTRACT_JA
Shin-ichiro OGAWA (Tokyu.rb)
Developer of Raku-Raku renraku-mou in eole. inc., which is mailing list service for Japanese mobile phone. Core commiter of jpmobile.
Born in Kyoto, grew up in Osaka. Ph.D in Physics, but It's no use for works.
PROFILE
小川 伸一郎 (Tokyu.rb)
株式会社イオレで「らくらく連絡網」という携帯向けメーリングリストサービスの開発に従事。RubyKaigi2009を機にjpmobileのコアコミッターに。京都生まれで大阪育ちの博士（理学）。
PROFILE_JA
    e28_b201.create :title => 'PGP Key Signing Party', :title_ja => "キーサインパーティー 2010", :speaker => 'Shyouhei Urabe w/ Yugui (Ruby Core Team)', :from => '12:00', :length => 90.minutes, :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Let's trade pubkeys! A key signing party is a get-together of people who use the PGP encryption system with the purpose of allowing those people to sign each others keys. Key signing parties serve to extend the web of trust to a great degree.

If you get interested you need some preparation. Take a look at
http://qwik.atdot.net/rubykaigi2010keysignparty/FrontPageJa.html
ABSTRACT
公開会議を交換しましょう。キーサインパーティーは PGP 暗号化方式を利用する人たちが相互に公開鍵を署名しあう集まりです。キーサインパーティーに参加することで信頼の輪を広げることができます。

参加には若干の準備が必要ですので、ご興味のある方は以下のURLを御覧下さい。
http://qwik.atdot.net/rubykaigi2010keysignparty/FrontPageJa.html
ABSTRACT_JA
    e28_b201.create :title => 'M-x ruby-and-emacs-workshop', :speaker => 'Zev Blut', :length => 90.minutes, :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :profile => (<<PROFILE)
Stretch your fingers and warm up your control and meta keys. Bring your laptop and .emacs file. Let's show each other our techniques for writing Ruby code using Emacs.

This is a workshop for both beginners and advanced users to share tips and tricks for developing Ruby code with Emacs.
ABSTRACT
指のストレッチ！CtrlキーとMetaキーのウォーミングアップ！
みんなで自分のラップトップと.emacsファイルを持ち込んで、見せ合いっこしながらEmacsでRubyプログラミングをする技をシェアしましょう。

この企画は、初心者から達人まで、みんなでEmacsでのRubyプログラミングの技をシェアするワークショップです。
ABSTRACT_JA
Zev is a software developer for Cerego Japan who helps with the
web operations and development of the smart.fm website.  He knows
enough Japanese to enjoy natto but not chicken sashimi.
PROFILE
    e28_b201.create :title => 'Cucumber hands-on', :title_ja => 'Cucumber ハンズオン', :speaker => 'MOROHASHI Kyosuke (EIWA System Management, Inc.)', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile_ja => (<<PROFILE_JA)
Cucumber is a very nice testing framework. But the major feature, execute natural language text as tests, varies from familiar \"Ruby syntax\". Therefore, you may feel inhibited to take the first step (so I was.). In this sub-event, we try Cucumber to build a simple Rails application. It will tell you that cucumber is not so difficult to start and has great power to describe software test.
ABSTRACT
Cucumberはとてもよくできたテスティングツールです。しかし、その大きな特長である、自然言語を使ったテスト定義は、慣れ親しんでいる「Ruby の文法」とは見た目が大きくことなります。そのため、はじめの一歩を踏み出すに心理的な抵抗を感じることもあるでしょう(私もそうでした)。この企画では、Cucumberを使いながら簡単なRailsアプリケーションを作っていくことで、始めるのは難しくないことと、そしてCucumber のパワーを実感してもらうことを目的としています。
ABSTRACT_JA
諸橋恭介(moro) (永和システムマネジメント/Rails勉強会@東京/asakusa.rb)
サービスプロバイディング事業部プログラマ

RSpecやCucumberが好きです。RubyやRailsで受託開発をしています。
主に、サービス系のWebアプリケーションを作っています。
著書「Railsレシピブック(2008年、共著)」があります。
PROFILE_JA
  end

  e28.with_options(:room => @a201) do |e28_a201|
    e28_a201.create :title => 'Nihon Ruby-no-Kai meeting', :title_ja => '日本Rubyの会の会', :speaker => 'Koji Shimada (Nihon Ruby-no-Kai)', :from => '12:00', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
An open meeting where Rubyists discuss what we can do for Ruby.
ABSTRACT
RubyのためにRubyistができることについて話し合うイベント。 RubyKaigi2010の時期には実は第6期が終わっているので、第6期の活動のふりかえりと、第7期の活動のアイデア出しをやりましょう!
ABSTRACT_JA
    e28_a201.create :title => 'Vim', :speaker => 'Kana', :to => '17:00', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
About half of Rubyists are using Vim to code Ruby. Vim is one of the ultimate tools for software developments, which vary among programmers. Why don't you exchange the ways you use Vim?

For example, I am using some Vim plugins such as quickrun.vim, neocomplcache, and smartchr.vim to code Ruby efficiently. Although my ~/.vimrc is less than just 3000 lines, there are plenty of good tricks worth telling to you. I'd like to tell you about my Vim knowledge, and learn how you yourself are optimizing Vim.

I'd like to make the event in English, because most Japanese have already been learning English for a while. Of course, attendees are supposed to be familiar with Ruby and Vim, because they are the lingua franca of this event. I can help translating Japanese to English or English to Japanese. Even if you don't have a lot of confidence with other languages, you can still attend this event.

Other editor users such as Emacs users also can attend this event. In general, tech religious wars are fun.
ABSTRACT
Rubyistの約半数が使用していると噂の統合開発環境Vimについて、使いこなすためのノウハウや快適にRubyコードを書くためのテクニックを交換しあう勉強会です。

当日は有志によるライトニングトーク、Q&A、および会場内で得た知識を実践するためのfree hack時間を設け、参加者のVim戦闘力を向上させる予定です。
ABSTRACT_JA
  end

  e28.create :title => "The Origami Ruby (paper craft) Generated by The Ruby", :title_ja => 'Ruby で作る Ruby の折り紙', :speaker => 'Hiroyuki Shimura (Nihon Ruby-no-kai (Japan Ruby Group))', :room => @foyer, :from => '12:00', :to => '17:00',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
  The Origami Ruby (paper craft) Generated by The Ruby: Let's fold origami \"Ruby\" like http://dl.dropbox.com/u/4921720/RubyFoldings/IMG_0362.A3_C35_Chu25.WebSmall.JPG  . In the first half, we will fold origami \"Ruby\" together with the origami paper that has crease fold lines. In the second half, we will fold something with foil paper and cellophane paper and read a Ruby script that generates paper with crease fold lines.
ABSTRACT
  Ruby の折り紙を折ります。http://dl.dropbox.com/u/4921720/RubyFoldings/IMG_0362.A3_C35_Chu25.WebSmall.JPG
  折り線をプリントした展開図を用意しますので、前半それを参考にみんなで折りましょう。後半は、ちょっと難しくなりますがホイル折紙や透明折紙(セロファン)で折ってみたり、或は展開図を作成する Rubyスクリプトを読みましょう。
ABSTRACT_JA
end
