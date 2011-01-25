# -*- coding: utf-8 -*-

EventLoader.with_options(:day => 29) do |e29|
  e29.with_options(:room => @big) do |e29_big|
    e29_big.create :title => 'Cloud management with Ruby', :title_ja => 'Rubyでクラウドを便利にする方法〜ニフティクラウドの事例〜', :speaker => 'Kei Hamanaka, Yuichi Saotome (NIFTY Corporation)', :from => '9:30',:abstract => (<<ABSTRACT), :lang => 'ja'
We show the construction/operation methods for Cloud with Ruby. (ex. NIFTY Cloud)
ABSTRACT
    e29_big.create :title => 'Distributed storage system with ruby', :title_ja => 'Rubyによる分散ストレージシステムの実装', :speaker => 'Toshiyuki Terashita (RICOH IT SOLUTIONS Co.,Ltd.)', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile_ja => (<<PROFILE_JA)
Castoro is a new scalable storage system implemented in Ruby. In this session, we talk about why we decided to develop a new storage system, Castoro. We will also compare Castoro against other distributed storage systems, such as MogileFS and kumoFS.
ABSTRACT
Castoroは、Rubyで実装されたスケーラブルなストレージシステムです。本発表では、開発に至った経緯と、MogileFSやkumoFS等、他の分散ストレージシステムとの違いについて紹介します。
ABSTRACT_JA
寺下 敏之（てらした としゆき） リコーITソリューションズ株式会社

OSなし組み込みファームウエアからデータセンター内ソフトウエアまで手がけてき
ました。
自宅で書いたものをgithubへ置いてOSSと称して業務に持ち込む、自作自演プログラ
マです。
Railsアプリコードを書いたら負けかなと思っているRuby使いで、鳥取Ruby会
「tottoruby」主催・開催しています。
ストレージサービス「quanp」ではミドルウエアからOS寄りのコンポーネントを作っ
ています。
PROFILE_JA
    e29_big.create :title => 'The last decade of RWiki and lazy me', :title_ja => 'RWikiと怠惰な私の10年間', :speaker => 'Masatoshi SEKI (druby.org)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile_ja => (<<PROFILE_JA)
On August 31st, 2000, A slightly unusual Wiki was introduced on ruby-list. It was [ruby-list:24661] The first practical dRuby application, RWiki.

RWiki is strongly opinionated software. RWiki was introduced as an demonstration of the usage of various Ruby libraries, but its unique implementation also reflects the author's opinion. The most significant feature of RWiki is that it is an in-memory application that contains both the database and objects all in a single process. Which is rather reminiscent of some recent buzzwords: NoSQL and In-Memory.

A couple days after this presentation, RWiki will celebrate its tenth year anniversary. I am currently running several active RWiki sites. These sites have over 30 thousand pages with a process size exceeding 1Gb. In this presentation, I will tell a little story of how these RWiki sites achieved scale and volume.
ABSTRACT
2000-8-31、ruby-listにすこし変わったWikiが紹介されました。[ruby-list:24661] dRubyの最初の実用的なアプリケーション、RWikiです。

RWikiはメッセージ色の濃いソフトウェアです。RWikiはRuby周辺のさまざまなライブラリのサンプルとして紹介されましたが、特異な実装も作者のメッセージです。RWikiのもっとも大きな特徴はデータベース、オブジェクトを全て一つのプロセスの中に配置する、In-Memory のアプリケーションであることです。そういえば、NoSQL、In-Memoryは最近のバズワードでもありますね。

この発表の数日後、RWikiはちょうど10年を迎えます。 私はアクティブなRWikiサイトを複数運営していて、現在では3万ページ、プロセスサイズは1GBを超えています。本発表では、このサイトが「大きさ・量」を獲得していく過程で展開された、ちょっとした物語を報告します。
ABSTRACT_JA
関将俊（druby.org）
プログラマ。dRuby、ERBの作者。代表作はhメソッド、著書『dRubyによる分散・Webプログラミング』。ポケモンWCS2010栃木県代表(カード部門)。
PROFILE_JA
    e29_big.create :title => 'Practical Ruby Projects with MongoDB', :speaker => 'Alex Sharp (Lead Developer, OptimisDev)', :length => 1.hour,:abstract => (<<ABSTRACT), :profile => (<<PROFILE)
While there is a lot of excitement surrounding MongoDB and the NoSQL movement, MongoDB is all about practicality, pragmatism and performance. MongoDB boasts a robust feature set that provides a pragmatic blend of rich functionality, performance and scalability that today's software developers need, and all at a relatively low barrier to entry.
ABSTRACT
Alex has been Lead Developer for OptimisDev since October 2009. Prior to joining OptimisDev, he co-founded Second Street Creative in 2006, a boutique web application development and design consultancy specializing in creative brand development and agile ruby application development. He is particularly interested in the NoSQL movement and mastering the art of refactoring.

Among other open source contributions, Alex is the author of Bunyan and Papermill, two libraries for working with MongoDB.

In addition to hacking, Alex enjoys shredding fresh powder, gourmet coffee and being an amateur foodie. He does not enjoy referring to himself in third person, because it sounds weird. He currently lives in sunny Los Angeles, CA, blogs at alexjsharp.com and tweets as @ajsharp.
PROFILE
    e29_big.create_break :length => 90.minutes
    e29_big.create :title => "IronRuby - What's in it for Rubyists?", :speaker => 'Shay Friedman (Sela Group)', :length => 1.hour, :abstract => (<<ABSTRACT), :profile => (<<PROFILE), :presentation_material => (<<PRESENTATION_MATERIAL)
IronRuby is the new implementation of the Ruby language from Microsoft which opens the .NET world to Rubyists. This brings a whole set of new opportunities to Rubyists like using Ruby to write RIA applications, providing enhanced user interface to Ruby applications and more. Come and see the new possibilities that IronRuby brings to the Ruby world!
ABSTRACT
Shay Friedman is the author of IronRuby Unleashed and a Microsoft IronRuby MVP. With more than 10 years of experience, Friedman now works as a consultant and instructor of dynamic languages and .NET related subjects in CodeValue, a company he has recently co-founded. You can read his blog at http://IronShay.com and contact him via his twitter account - @ironshay.
PROFILE
http://www.slideshare.net/shayfriedman/ironruby-whats-in-it-for-rubyists-rubykaigi-2010
PRESENTATION_MATERIAL
    e29_big.create_break
    e29_big.create :title => 'The spread of enterprise Ruby at hot spot SHIMANE', :title_ja => 'Ruby業務システムの広がりとホットスポット島根', :speaker => 'Hiroshi Yoshioka (TechnoProject Ltd.)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA)
In Matsue City and SHIMANE prefecture of local government, many common business systems began to remake by Ruby/Rails since 2007. Now, the wave of Ruby/Rails spreads to enterprise system fields and prepheral regions. Based many experience and results, how to built up the enterprise systems by Ruby/Rails, how to built up the long term maintenance systems, challenging to high productivty and another Agile development.
ABSTRACT
地方自治体である松江市や島根県では、2007年から一般的な行政システムをRuby/Railsで再構築を行っている。今、Ruby/Railsの波が企業システムの分野や周辺の地域に広がり始めた。 多くの経験と実績に基づいて、Ruby/Railsの基幹業務システムの構築方法、長期間メンテナンスするシステムの構築方法、高生産性や別なアジャイル開発への挑戦について説明する。
ABSTRACT_JA
Hiroshi Yoshioka (TechnoProject LTD. & Matsukei LTD. Both CEO)
I am born in 1953.It started from the development of the middleware, and SI and a lot of package developments and application such as finance and public in the field were commanded in the first line.
A lot of environments have been experienced from the mainframe to the CSS・Web application program.
PROFILE
吉岡 宏（ヨシオカ ヒロシ）
(株)テクノプロジェクト：代表取締役社長兼(株)マツケイ：代表取締役社長
1953年生まれ。1976年からソフトウエア業界に身を置く。その間、ミドルウエアの開発から始まり、フィールドでの金融・公共など多くのＳＩやパッケージ開発・適用を第一線で指揮して来た。メインフレームからＣＳＳ・Webアプリまで、多くの環境を経験してきた。
PROFILE_JA
    e29_big.create :title => 'There Is No Spoon -- Think Global, Act Regional', :speaker => 'Shintaro Kakutani (rubykaigi.org, Nihon Ruby-no-kai)', :abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA), :presentation_material => (<<PRESENTATION_MATERIAL)
I have been a member of RubyKaigi organizer since 2006 and also am the founder of Regional RubyKaigi started in 2008. \"Kaigis\" have changed the landscape of the Ruby community in Japan. These 2 years mean a lot to me. I'd love to show you what happened is and tell you what I believe is going to happen in the Ruby community in Japan.
ABSTRACT
2008年につくばで(!)開催されたRejectKaigiで提案した地域Ruby会議プロジェクトは2周年を迎えます。この2年間に9都市で17の地域Ruby会議が実施され、私はその全てに参加しました。本セッションでは、過去2年間の地域Ruby会議をふりかえり、今後の地域Ruby会議のありかたについて私見を述べます。東京と東京以外の違いと地域のRubyユーザグループの重要性や地域Ruby会議とRubyKaigiの関係など、「RubyKaigi以後」のRuby コミュニティのあり方を考える材料を提供します。
ABSTRACT_JA
Kakutani Shintaro is a just another strong Ruby proponent, chief programmer in Eiwa System Management, Inc and board member of Nihon Ruby-no-kai(Japan Ruby Group). He is one of the organizers of RubyKaigi since 2006. He have translated some english technical book into japanese: "Agile Estimating and Planning"(co-translator), "Interface Oriented Design"(supervisor), "Practices of an Agile Developer"(co-supervisor) and "From Java to Ruby"(translator).
PROFILE
ただのRuby厨。(株)永和システムマネジメントサービスプロバイディング事業部チーフプログラマ。日本Rubyの会理事。RubyKaigiの運営を2006年からやってます。著書は『アジャイルな見積りと計画づくり』(共同翻訳)、『インターフェイス指向設計』(監訳)、『アジャイルプラクティス』(共同監訳)、『JavaからRubyへ』(翻訳)。
PROFILE_JA
http://www.slideshare.net/kakutani/there-is-nospoon
PRESENTATION_MATERIAL
    e29_big.create_break
    e29_big.create :title => 'Keynote', :title_ja => '基調講演', :speaker => 'Chad Fowler', :length => 1.hour
    e29_big.create :title => 'Closing'
  end

  e29.with_options(:room => @medium) do |e29_medium|
    e29_medium.create :title => 'The future of the bigdecimal library and the number system of Ruby', :title_ja => "bigdecimal ライブラリと Ruby の数値系の未来", :speaker => 'Kenta Murata (GeneticLab Co., Ltd. && Ruby Sapporo)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :from => '9:30', :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA)
I taked over the maintainer of the bigdecimal standard library in the beginning of this year. Today, the bigdecimal library has some problems in its behaviors, such as interacting convention with any other number classes. In this presentation, I will demonstrate these problematic behaviors and express their appropriate characteristics in the next version of Ruby. Additionally, I will discuss the number system which the future version of Ruby, that is 2.0, should have.
ABSTRACT
私は今年の初めに bigdecimal 標準ライブラリのメンテナに採用されました。現在 bigdecimal ライブラリは、他の数値クラスとの相互作用規則など、その振る舞いについて幾つかの問題を抱えています。私はこのプレゼンテーションで、このような問題ある振る舞いを実演で示し、これらに対して Ruby の次のバージョンで実現されるべき適切な性質を説明します。加えて、私は Ruby の未来のバージョン（すなわち 2.0）が持っているべき数値系について議論します。
ABSTRACT_JA
mrkn, Kenta Murata (Genetic Lab Co., Ltd.)
Kenta is a Ruby committer, who manages the bigdecimal library, and is interested in numerical computation, programming languages, random number generators, and complex networks.
He obtained his Ph.D. (Information science) from Hokkaido University in 2009.
Also, he is an author of a Japanese book titled "Ruby 逆引きレシピ".
Finally, he is a member of Ruby Sapporo, Nihon Ruby-no-kai, and Kosen Conference Committee.
PROFILE
mrkn, 村田賢太 (株式会社ジェネティックラボ)
2009年北海道大学博士 (情報科学)。同年、株式会社ジェネティックラボ入社。
2010年 bigdecimal のメンテナに就任し Ruby コミッタになる。
数値計算、プログラミング言語、乱数生成器、複雑ネットワークに興味を持つ。
著書は『Ruby逆引きレシピ』(共著)。情報処理学会、人工知能学会、各会員。
Ruby札幌、日本Rubyの会、高専カンファレンス実行委員会に所属。
PROFILE_JA
    e29_medium.create :title => 'NArray and scientific computing with Ruby', :speaker => 'Masahiro Tanaka (University of Tsukuba)',:abstract => (<<ABSTRACT), :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA), :presentation_material => (<<PRESENTATION_MATERIAL)
NArray is an n-dimensional numerical array library developed for use in science fields, but it is usable for handling binary data efficiently. I talk about NArray for the first time after 10 years from the first release. I will also present topics including the next version of NArray, and distributed scientific computing using Ruby for multi-core era.
ABSTRACT
Masahiro Tanaka (University of Tsukuba)
Research fellow at Center for Computational Sciences, University of Tsukuba.
Author of Ruby/NArray.
His research fields include infrared astronomy, distributed systems, etc.
PROFILE
田中昌宏（筑波大学）
筑波大学計算科学研究センター研究員．Ruby/NArrayの作者．
研究分野は，赤外線天文学，分散システムなど．
PROFILE_JA
http://www.slideshare.net/masa16tanaka/narray-and-scientific-computing-with-ruby
PRESENTATION_MATERIAL
    e29_medium.create :title => 'How Did Yarv2llvm Fail', :title_ja => 'yarv2llvmはどう失敗したのか', :speaker => 'Hideki Miura (CSNagoya)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA)
Yarv2llvm is a translator which converts instruciton set of VM of CRuby (aka YARV) into llvm. The feature of yarv2llvm is to use the type inference for raising the execution efficiency of generated llvm. Yarv2llvm get a results. For example it executes the program for computing fibonacci number 40 times faster than Ruby1.9. But it was clarified to be able not to convert all Ruby programs into llvm well either though it had expected beforehand. I will show the example of programming Ruby that cannot be converted with yarv2llvm well and the settlement plan. In addition I will introduce the outline of the next generation translator (ytl) that I am developing to support all specification of Ruby.
ABSTRACT
yarv2llvmはCRubyのVMの命令列をllvmに変換するトランスレータである。生成するllvmの実行効率を上げるために、型推論を用いるのが特徴である。 yarv2llvmはフィボナッチ級数プログラムでRuby1.9の約40倍の実行速度を得るなど、一定の成果が得られた。一方で、事前に予想していたことではあるが、すべてのRubyプログラムがうまくllvmに変換できるわけではないことも明らかになった。 この発表ではyarv2llvmではうまく変換できないRubyプログラム例とその解決案を説明する。さらに、フルセットRubyをサポートすることを目的に現在開発中の次世代トランスレータ(ytl)の概要を紹介する。
ABSTRACT_JA
Hideki Miura (CSNagoya)
My job is pipework. I develop software as my hobby. You can see my products in http://github.com/miura1729 .
PROFILE
三浦 英樹　(CSNagoya)
水道屋です。趣味でプログラムを書いています。書いたものはhttp://github.com/miura1729 にあります。
PROFILE_JA
    e29_medium.create :title => 'AOT Compiler for Ruby', :title_ja => 'Ruby 用 AOT コンパイラ', :speaker => 'Satoshi Shiba (The University of Tokyo)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile_ja => (<<PROFILE_JA), :profile => (<<PROFILE)
We developed a AOT Compiler, which translates Ruby script into native code to run Ruby script faster.

In this presentation, we show the composition of CRuby and the challenges we overcome to achieve full compatible AOT compiler for the CRuby. We also show the design and the implementation of our AOT compiler. We evaluated the compatibility and performance by using tests and benchmarks included in CRuby release.
ABSTRACT
Ruby スクリプトの実行をより高速にするために，Ruby スクリプトを機械語に変換する AOT（Ahead-Of-Time）コンパイラ を開発した．

本発表では，CRubyの構成を述べ，CRubyと完全互換なAOTコンパイラを開発するにあたっての課題を述べる．そして，我々のAOTコンパイラの設計と実装を示す． Ruby処理系に付属するテストプログラム，ベンチマークプログラムを用いて， その互換性，および得られた性能向上について述べる．
ABSTRACT_JA
芝 哲史 (シバ サトシ)
東京大学笹田研究室の学生です。
Ruby 1.9用の AOT コンパイラを開発しています。
PROFILE_JA
Satoshi Shiba
A graduate student in the Sasada Laboratory, The University of Tokyo.
Develop an AOT compiler for Ruby 1.9.
PROFILE
    e29_medium.create :title => 'Memory Profiler for Ruby', :speaker => 'Tetsu Soh (The University of Tokyo)',:abstract => (<<ABSTRACT), :profile => (<<PROFILE)
We developed a memory profiler for Ruby programming language that fulfills the requirement for measuring and analyzing the memory usage of Ruby applications.

In this presentation, we will describe the features, the design and the implementation of the memory profiler. We will also show the performance evaluation and demonstrate the memory profiler in action.
ABSTRACT
A graduate student in the Sasada Laboratory, The University of Tokyo.
Developed a memory profiler for Ruby1.9.
PROFILE
    e29_medium.create_break :length => 1.5.hours
    e29_medium.create :title => 'How to create Ruby reference manual search Web application with Ruby 1.9  groonga and rroonga', :title_ja => 'るりまサーチの作り方 - Ruby 1.9でgroonga使って全文検索', :speaker => 'Kouhei Sutou (ClearCode Inc. / COZMIXNG)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA)
This talk explains about rurema-search, Ruby reference manual in Japanese search Web application, and how to create rurema-search. Rurema-search uses Ruby 1.9.1 (MRI) as a Ruby interpreter, groonga as a full-text search engine and data store and rroonga as a Ruby-groonga interface. Those technologies are particularly explained in 'how to create rurema-search' time.

  rurema-search (Japanese): http://rurema.clear-code.com/
ABSTRACT
このトークではるりまサーチについてとるりまサーチの作り方について話します。るりまサーチはRubyリファレンスマニュアル刷新計画の成果物であるRubyのリファレンスマニュアルを高速に検索するWebアプリケーションです。るりまサーチはRubyインタプリタとしてRuby 1.9.1（MRI）、全文検索エンジンとデータストアとしてgroonga、Rubyとgroongaのインターフェイスとしてrroongaを使っています。作り方の説明では、特にこれらの技術の使い方について詳しく説明します。

 るりまサーチ: http://rurema.clear-code.com/
ABSTRACT_JA
Kouhei Sutou (ClearCode Inc.)
The president of ClearCode Inc.. The author or a developer of RSS Parser, Rabbit, rcairo, Ruby-GNOME2, ActiveLdap, ActiveSambaLdap, test-unit 2.x, rroonga, rurema-search, Ruby/Subversion, RWiki, Ruby and so on.
PROFILE
須藤 功平（株式会社クリアコード）
株式会社クリアコード代表取締役。RSS ParserとRabbitとrcairoとRuby-GNOME2とActiveLdapとActiveSambaLdapとtest-unit 2.xとrroongaとるりまサーチとRuby/SubversionとRWikiとRubyなどの開発者。
PROFILE_JA
    e29_medium.create :title => "Now you're thinking with virtual clocks", :title_ja => 'ゲームとバーチャルタイム', :speaker => 'Tom Lieber (SonicMule,Inc.)',:abstract => (<<ABSTRACT)
Turn the multimedia render loop inside out. Cooperatively scheduling lightweight Ruby threads on a virtual clock allows you to reason about the concurrent code in your game and perform complex synchronization tasks without even realizing it. Ditch the nested trees of update() calls by making time a first class citizen!
ABSTRACT
    e29_medium.create_break
    e29_medium.create :title => "How to survive in a post-Rails world", :title_ja => 'before Rails 時代のプログラマが如何にして after Rails の世界にたどりついたか', :speaker => 'SHIBATA Hiroshi (Eiwa System Management,Inc. / asakusa.rb / tDiary.org)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :profile => (<<PROFILE), :profile_ja => (<<PROFILE_JA)
Even before the release of Rails, we have created many useful tools and applications in Ruby. In this post-Rails world, however, the way we approach application development has changed. In this session, I will talk about my experiences in adapting my way of thinking to a post-Rails world.
ABSTRACT
Rails が登場する以前(before Rails)から私たちは多くのプロダクトやツールをRubyによって作ってきました。しかし、Rails が登場した現代(after Rails)のアプリケーション開発では、before Rails とは異なる考え方を持つ必要があります。このセッションでは、自分が経験したbefore Rails から after Rails に適応するための頭の切り替え方を話します。
ABSTRACT_JA
SHIBATA Hiroshi(hsbt) (Eiwa System Management,Inc./asakusa.rb)
He is a programmer in Eiwa System Management,Inc. member of  Japanese Society for Quality Control (JSQC). His lifework is to develop Rails ap
plication and tDiary, The tsukkomi oriented weblog.
PROFILE
柴田博志(hsbt) (永和システムマネジメント/asakusa.rb)
サービスプロバイディング事業部プログラマ、品質管理学会 正会員
Rails を使った業務システムや tDiary という Web 日記システムを作っています。
PROFILE_JA
    e29_medium.create :title => 'How To Create A Beautiful Template Engine Which Never Breaks HTML', :title_ja => 'HTMLデザインをまったく崩さない、美しいテンプレートエンジンの作り方', :speaker => 'Makoto Kuwata (programmer)',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja', :presentation_material => (<<PRESENTATION_MATERIAL)
One of the biggest challenges in modern web application development is the difficulty of collaborating with web designers. For example, eRuby requires Ruby code to be embedded inside template files, often resulting in broken HTML designs, making life difficult for web designers. To solve this problem, various template engines which don't break HTML have been created. The trade off of these template engines, however, is that they sacrifice other features such as performance or usability.

In this session, a template engine that doesn't break HTML while also  preserving performance and usability will be introduced. This session  will also explore a variety of problems relating to template engines, such as the problems with techniques used in existing template engines, and whether simple "not breaking" HTML designs is sufficient.  This will be definitive session about template engines for web application development. If you are interested in web design, you must attend this session.
ABSTRACT
Webアプリケーション開発における問題点のひとつに、Webデザイナと協業がしにくいことが挙げられます。たとえばeRubyだとテンプレートファイル中にRubyコードを埋め込むため、テンプレートファイルのHTMLデザインが崩れてしまい、デザイナが作業しにくくなってしまいます。この問題を解決するために、HTMLデザインを崩さないようなテンプレートエンジンがいくつか考案されています。しかしそれらはHTMLデザインの問題を解決したかわりに、パフォーマンスや使い勝手の悪さなど別の問題を引き起こしています。本セッションでは、HTMLデザインを一切崩さず、かつ使いやすくて高速なテンプレートエンジンの作り方を紹介します。また既存の方法は何が間違っていたのか、そもそもHTMLデザインを崩さないだけでいいのか、など、テンプレートエンジンにまつわる様々な問題について考察します。本セッションは、テンプレートエンジンについての「決定版」ともいうべき内容です。Webデザインに興味のある方は必見です。
ABSTRACT_JA
(ja)http://www.slideshare.net/kwatch/html-5079716, (en)http://www.slideshare.net/kwatch/how-to-make-designerfriendly-template-engine
PRESENTATION_MATERIAL
    e29_medium.create_break
  end

  e29.with_options(:room => @b202) do |e29_b202|
    e29_b202.create :title => 'Regional RubyKaigi Kaigi', :title_ja => '地域Ruby会議会議', :speaker => 'Koji Shimada (Nihon Ruby-no-Kai)', :from => '10:00', :length => 2.hours,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
An open meeting (\"kaigi\") about Regional RubyKaigi for anyone who is interested.
ABSTRACT
地域 Ruby 会議に興味ある人たちが集まって、地域Ruby会議の今後について話し合うBOF。これまでの開催の関係者、これから地域Ruby会議を開催したいと考えている人、単に地域Ruby会議に興味のある人の参加を歓迎します。
ABSTRACT_JA
    e29_b202.create :title => "We're rubyists living abroad. Any questions?", :title_ja => '外国で暮らすRubyistだけど何か質問ある？', :speaker => 'Kazuhiko (Nexedi SA)', :from => '13:30', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA)
In the RubyKaigi, we have many foreign Rubyists. And we also have Japanese rubyists who are living abroad and foreign rubyists who are living in Japan. Please join this sub-event to discuss with such 'rubyists living abroad'! If you are interested in 'living in Japan as a foreign rubyist', please feel free to ask your questions. Both English language and Japanese lauguage are welcome in this sub-event.
ABSTRACT
RubyKaigiには、外国から多くのRubyistが来ますが、外国で活躍する日本人Rubyistや日本で活躍する外国人Rubyistもたくさんやってきます。そんな身近だけれどちょっと遠い存在に見えなくもない「外国で暮らすRubyist」と意見交換する企画です。 この企画では、@ujm, @vincentisambart, @lchin といった「外国で活躍する」豪華Rubyistを招いて、「カナダのRubyistはどういうところに着目しているか」「母国語と違う環境での Rubyistの仕事の様子」など、参加者の皆さんからの質問に何でもお答えします。なお、この企画では日本語も英語もどちらもOKです。
ABSTRACT_JA
  end

  e29.with_options(:room => @a202) do |e29_a202|
    e29_a202.create :title => 'Ruby Game Developers Kaigi', :title_ja => 'Rubyゲーム会議', :speaker => 'kumaryu (Ryuichi Sakamoto)',:abstract => (<<ABSTRACT), :from => '10:00', :length => 2.hours, :lang => 'ja'
Short sessions and Demos for Game Developement with Ruby. Demos are open to all.
ABSTRACT
    e29_a202.create :title => 'Asakusa.rb in Tsukuba', :title_ja => '浅草.rb in つくば', :speaker => 'Akira Matsuda (Asakusa.rb)', :from => '12:00', :length => 90.minutes,:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA)
During RubyKaigi, you'll find tons of foreign Ruby Stars and Book writers here in Tsukuba. Why don't we directly tell them our questions, requirements, and of course, our deep appreciation, since these days are only once a year and are a very special chance for us. OK, of course we're all willing to tell them, but we know it's very hard to do so. We can hardly distinguish who's who, maybe we lack the courage to talk to them, especially when there's a language barrier between us. So, Asakusa.rb are producing a special event which aims to help introduce everybody to one another and facilitate communicate. We're having live discussions with, for example, the creators of Rails 3, the author of \"The Passionate Programmer\", guys from the crazy \"Ruby Brigade\" Seattle.rb, and lot of other foreign super Ruby Stars who are sticking around here. C'mon everybody, let's get together and talk about \"your\" Ruby!
ABSTRACT
RubyKaigi の会場には、皆さんも日ごろお世話になっているはずのプロダクトや書籍の作者さんご本人がうじゃうじゃ来場しています。せっかくの年に一度のチャンスなので、是非この機会にいつも感じている疑問や要望、それから感謝の気持ちを思い切って直接作者さんに伝えちゃいましょう！とはいえ、誰が誰だかよくわからないし、いきなり面と向かっては話しかけづらいし、特に言語の壁があったりするとなかなか勇気が要りますよね？そこで、僕たち Asakusa.rbでは、Jeremy Kemper や Chad Fowler をはじめ、当日会場に居る豪華外タレさんたちをゲストにお迎えして、彼ら自身の 'あの'プロダクトについて、ご本人と Asakusa.rb のメンバーたちと、それからもちろん会場の皆様も巻き込んで、生のアツいディスカッションを行います。
ABSTRACT_JA
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

  e29.with_options(:room => @b201) do |e29_b201|
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
  e29.create :title => 'The Origami Ruby (paper craft) Generated by The Ruby', :title_ja => 'Ruby で作る Ruby の折り紙', :speaker => 'Hiroyuki Shimura (Nihon Ruby-no-kai (Japan Ruby Group))', :room => @foyer, :from => '10:00', :to => '16:30',:abstract => (<<ABSTRACT), :abstract_ja => (<<ABSTRACT_JA), :lang => 'ja'
Let's fold origami \"Ruby\" like http://dl.dropbox.com/u/4921720/RubyFoldings/IMG_0362.A3_C35_Chu25.WebSmall.JPG. In the first half, we will fold origami \"Ruby\" together with the origami paper that has crease fold lines. In the second half, we will fold something with foil paper and cellophane paper and read a Ruby script that generates paper with crease fold lines.
ABSTRACT
Ruby の折り紙を折ります。 http://dl.dropbox.com/u/4921720/RubyFoldings/IMG_0362.A3_C35_Chu25.WebSmall.JPG 折り線をプリントした展開図を用意しますので、前半それを参考にみんなで折りましょう。後半は、ちょっと難しくなりますがホイル折紙や透明折紙(セロファン)で折ってみたり、或は展開図を作成する Rubyスクリプトを読みましょう。
ABSTRACT_JA
end
