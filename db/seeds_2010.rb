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
big = Room.create :name_en => 'Big Hall', :name_ja => '大ホール', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 1
medium = Room.create :name_en => 'Medium Hall', :name_ja => '中ホール', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 2
b202 = Room.create :name_en => '202-B', :name_ja => '202-B', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 3
a202 = Room.create :name_en => '202-A', :name_ja => '202-A', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 4
b201 = Room.create :name_en => '201-B', :name_ja => '201-B', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 5
a201 = Room.create :name_en => '201-A', :name_ja => '201-A', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 6
foyer = Room.create :name_en => 'Foyer', :name_ja => 'ホワイエ', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 7


# event
EventLoader.with_options(:day => 27) do |e27|
  e27.with_options(:room => big) do |e27_big|
    e27_big.create :title => 'Opening', :from => '12:30'
    e27_big.create :title => 'Keynote', :title_ja => '基調講演', :speaker => 'bitsweat', :from => '13:00', :to => '14:00'
    e27_big.create :title => 'jpmobile on Rails 3', :title_ja => 'jpmobile on Rails 3 の作り方', :speaker => 'Shin-ichiro OGAWA', :from => '14:00'
    e27_big.create :title => 'Open social application development for cell-phones to begin in Ruby on Rails', :title_ja => 'Ruby on Railsではじめる携帯電話向けオープンソーシャルアプリケーション開発', :speaker => 'Masaki Yamada', :from => '14:30'
    e27_big.create_break :from => '15:00'
    e27_big.create :title => 'Building Real Time Web', :title_ja => 'リアルタイムウェブができるまで', :speaker => 'Makoto Inoue', :from => '15:30'
    e27_big.create :title => 'The LazySweepGC and Me - over the rejected', :title_ja => '僕が愛したLazySweepGC 〜Rejectを越えて〜（仮）', :speaker => 'nari', :from => '16:00', :to => '17:00'
    e27_big.create_break :from => '17:00'
    e27_big.create :title => 'The basis of making DSL with Ruby', :title_ja => 'Rubyで作るDSLの基礎', :speaker => 'Yasuko Ohba', :from => '17:30'
    e27_big.create :title => 'Best Imitation of Your Class', :title_ja => '君のクラスの最高の偽物', :speaker => 'Shugo Maeda', :from => '18:00', :to => '19:00'
  end

  e27.with_options(:room => medium) do |e27_medium|
    e27_medium.create :title => 'Feels Like Ruby', :speaker => 'Sarah Mei', :from => '14:00'
    e27_medium.create :title => 'User Experience for Library Designers', :speaker => 'geemus (Wesley Beary)', :from => '14:30'
    e27_medium.create_break :from => '15:00'
    e27_medium.create :title => 'Rubygems, Bundler, and the future', :speaker => 'Carl Lerche', :from => '15:30'
    e27_medium.create :title => 'Truth and Consequences: Handling Ruby 1.9 Encodings in Rails', :speaker => 'Yehuda Katz', :from => '16:00'
    e27_medium.create :title => 'A frog in a well does not know the great sea', :title_ja => '井の中の蛙、大海を知らず', :speaker => 'Sarah Allen', :from => '16:30'
    e27_medium.create_break :from => '17:00'
    e27_medium.create :title => '1.9 on 1.8', :speaker => 'ujihisa', :from => '17:30'
    e27_medium.create :title => 'My many failure products', :speaker => 'jugyo', :from => '18:00'
    e27_medium.create :title => 'Coding for fun, and having fun coding', :title_ja => 'みんなが楽しくプログラミング出来る魔法', :speaker => 'tenderlove', :from => '18:30'
  end

  e27.create :title => 'World Wide Ruby Conferences - Lightning Talks', :title_ja => '世界の Ruby Conference 紹介 Lightning Talks', :speaker => 'Kuniaki IGARASHI', :room => b202, :from => '17:30', :to => '19:00'

  e27.with_options(:room => a202) do |e27_a202|
    e27_a202.create :title => 'Ruby developer meeting at Tsukuba', :title_ja => 'Ruby開発会議つくば', :speaker => 'Ruby core team', :from => '10:00', :to => '12:30'
    e27_a202.create :title => "Monthly 'toRuby' workshop in Tsukuba", :title_ja => '出張版 toRuby勉強会', :speaker => 'Shouichi Nakauchi', :from => '14:00', :to => '16:00'
    e27_a202.create :title => 'Ordinary Systems Development:Revenge', :title_ja => '帰ってきたふつうのシステム開発 - Rubyとアジャイル開発の永和システムマネジメントだけど何か質問ある?', :speaker => 'SHIBATA Hiroshi', :from => '16:00', :to => '18:00'
  end

  e27.with_options(:room => a201) do |e27_a201|
    e27_a201.create :title => 'rake:money', :title_ja => 'rake:money 拡大版', :speaker => 'Ouka Yuka', :from => '14:00', :to => '16:00'
    e27_a201.create :title => 'Ruby Business Owner Kaigi', :title_ja => 'Ruby親方会議', :speaker => 'Takeyuki FUJIOKA', :from => '16:00', :to => '18:00'
  end

  e27.create :title => "Let's create your own T-shirt designed by Ruby at RubyKaigi 2010!! / The Origami Ruby (paper craft) Generated by The Ruby", :title_ja => "Rubykaigiで自分だけのrubyTシャツを作ろう！/ Ruby で作る Ruby の折り紙", :speaker => 'Yasuo Yoshikawa / Hiroyuki Shimura', :room => foyer, :from => '13:00', :to => '15:30'
end

EventLoader.with_options(:day => 28) do |e28|
  e28.with_options(:room => big) do |e28_big|
    e28_big.create :title => 'Ruby committers Q & A', :title_ja => 'Rubyコミッタ Q & A', :speaker => 'Yugui', :from => '9:30', :to => '11:00'
    e28_big.create :title => 'Keynote', :title_ja => '基調講演', :speaker => 'Matz', :length => 1.hour
    e28_big.create_break :from => '12:00', :length => 90.minutes
    e28_big.create :title => 'Transcendental Ruby Programming - Esoteric Obfuscated Ruby', :title_ja => '超絶技巧 Ruby プログラミング', :speaker => 'Yusuke Endoh'
    e28_big.create :title => 'Daily Ruby', :title_ja => 'Rubyな日々', :speaker => 'Kazuhiro NISHIYAMA'
    e28_big.create :title => 'Ruby Reference Manual Renewal Project 2010 Summer', :title_ja => 'Ruby リファレンスマニュアル刷新計画 2010 夏', :speaker => 'okkez'
    e28_big.create_break
    e28_big.create :title => 'Ruby API is Improved Unix API', :title_ja => 'Unix修正主義', :speaker => 'Tanaka Akira', :length => 1.hour
    e28_big.create_break
    e28_big.create :title => 'LT', :length => 1.hour
  end

  e28.with_options(:room => medium) do |e28_medium|
    e28_medium.create :title => 'Rocking the enterprise with Ruby', :speaker => 'Munjal Budhabhatti And Sudhindra Rao', :from => '9:30'
    e28_medium.create :title => 'Rails to Sinatra: What is ready', :speaker => 'Jiang Wu'
    e28_medium.create :title => 'Mapping the world with DataMapper', :speaker => 'Ted Han'
    e28_medium.create :title => 'Keynote中継', :length => 1.hour
    e28_medium.create_break :from => '12:00', :length => 90.minutes
    e28_medium.create :title => 'The Necessity and Implementation of Speedy Tests', :speaker => 'Jake Scruggs', :length => 1.hour
    e28_medium.create :title => 'Seamless Integration Testing', :speaker => 'paulelliott'
    e28_medium.create_break
    e28_medium.create :title => 'A Metaprogramming Spell Book', :speaker => 'Paolo "Nusco" Perrotta', :length => 1.hour
    e28_medium.create_break
    e28_medium.create :title => 'LT中継', :length => 1.hour
  end

  e28.create :title => 'JRubyKaigi 2010', :title_ja => 'JRuby会議 2010', :speaker => 'Koichiro Ohba', :room => b202, :from => '12:00', :to => '18:00'

  e28.with_options(:room => a202) do |e28_a202|
    e28_a202.create :title => 'Asakusa.rb in Tsukuba', :title_ja => '浅草.rb in つくば', :speaker => 'Akira Matsuda', :from => '12:00', :length => 90.minutes
    e28_a202.create :title => 'Pair Programming Cultural Exchange', :speaker => 'Sarah Mei', :to => '18:00'
  end

  e28.with_options(:room => b201) do |e28_b201|
    e28_b201.create :title => 'PGP Keysign Party', :speaker => 'Shyouhei Urabe w/ Yugui', :from => '12:00', :length => 90.minutes
    e28_b201.create :title => 'M-x ruby-and-emacs-workshop', :speaker => 'Zev Blut', :length => 90.minutes
    e28_b201.create :title => 'Cucumber hands-on', :title => 'Cucumber ハンズオン', :speaker => 'MOROHASHI Kyosuke', :length => 90.minutes
  end

  e28.with_options(:room => a201) do |e28_a201|
    e28_a201.create :title => 'Nihon Ruby-no-Kai meeting', :title_ja => '日本Rubyの会の会', :speaker => 'Koji Shimada', :from => '12:00', :length => 90.minutes
    e28_a201.create :title => 'Vim', :speaker => 'ujihisa', :to => '17:00'
  end

  e28.create :title => "Let's create your own T-shirt designed by Ruby at RubyKaigi 2010!! / The Origami Ruby (paper craft) Generated by The Ruby", :title_ja => 'Rubykaigiで自分だけのrubyTシャツを作ろう！ / Ruby で作る Ruby の折り紙', :speaker => 'Yasuo Yoshikawa / Hiroyuki Shimura', :room => foyer, :from => '12:00', :to => '17:00'
end

EventLoader.with_options(:day => 29) do |e29|
  e29.with_options(:room => big) do |e29_big|
    e29_big.create :title => 'Cloud management with Ruby', :title_ja => 'rubyでクラウドを便利にする方法〜ニフティクラウドの事例〜', :speaker => 'Kei Hamanaka', :from => '9:30'
    e29_big.create :title => 'Distributed storage system with ruby', :title_ja => 'Rubyによる分散ストレージシステムの実装', :speaker => 'Toshiyuki Terashita'
    e29_big.create :title => 'The last decade of RWiki and lazy me', :title_ja => 'RWikiと怠惰な私の10年間', :speaker => 'Masatoshi SEKI'
    e29_big.create :title => 'Practical Ruby Projects with MongoDB', :speaker => 'Alex Sharp', :length => 1.hour
    e29_big.create_break :length => 90.minutes
    e29_big.create :title => "IronRuby - What's in it for Rubyists?", :speaker => 'Shay Friedman', :length => 1.hour
    e29_big.create_break
    e29_big.create :title => 'The spread of enterprise Ruby at hot spot SHIMANE', :title_ja => 'Ruby業務システムの広がりとホットスポット島根', :speaker => 'Hiroshi Yoshioka'
    e29_big.create :title => 'Think Global, Act Regional', :speaker => 'Shintaro Kakutani'
    e29_big.create_break
    e29_big.create :title => 'Keynote', :title_ja => '基調講演', :speaker => 'Chad Fowler', :length => 1.hour
    e29_big.create :title => 'Closing'
  end

  e29.with_options(:room => medium) do |e29_medium|
    e29_medium.create :title => 'The future of the bigdecimal library and the number system of Ruby', :speaker => 'Kenta Murata', :from => '9:30'
    e29_medium.create :title => 'NArray and scientific computing NArray and scientific computing with Ruby', :speaker => 'Masahiro Tanaka'
    e29_medium.create :title => 'How Did Yarv2llvm Fail', :title_ja => 'yarv2llvmはどう失敗したのか', :speaker => 'Hideki Miura'
    e29_medium.create :title => 'AOT Compiler for Ruby', :title_ja => 'Ruby 用 AOT コンパイラ', :speaker => 'Satoshi Shiba'
    e29_medium.create :title => 'Memory Profiler for Ruby', :speaker => 'Tetsu Soh'
    e29_medium.create_break :length => 1.5.hours
    e29_medium.create :title => 'How to create Ruby reference manual search Web application with Ruby 1.9  groonga and rroonga', :title_ja => 'るりまサーチの作り方 - Ruby 1.9でgroonga使って全文検索', :speaker => 'Kouhei Sutou'
    e29_medium.create :title => "Now you're thinking with virtual clocks", :title_ja => 'ゲームとバーチャルタイム', :speaker => 'Tom Lieber'
    e29_medium.create_break
    e29_medium.create :title => "How to survive in after Rails' time", :title_ja => 'before Rails 時代のプログラマが如何にして after Rails の世界にたどりついたか', :speaker => 'SHIBATA Hiroshi'
    e29_medium.create :title => 'How To Create Beautiful Template Engine Which Never Break HTML Design', :title_ja => 'HTMLデザインをまったく崩さない、美しいテンプレートエンジンの作り方', :speaker => 'Makoto Kuwata'
    e29_medium.create_break
    e29_medium.create :title => 'Keynote中継', :length => 1.hour
  end

  e29.with_options(:room => b202) do |e29_b202|
    e29_b202.create :title => 'Regional RubyKaigi Kaigi', :title_ja => '地域Ruby会議会議', :speaker => 'Koji Shimada', :from => '10:00', :length => 2.hours
    e29_b202.create :title => "We're rubyists living abroad. Any questions?", :title_ja => '外国で暮らすRubyistだけど何か質問ある？', :speaker => 'Kazuhiko', :from => '13:30', :length => 1.hour
  end

  e29.with_options(:room => a202) do |e29_a202|
    e29_a202.create :title => 'Ruby Game Developers Kaigi', :title_ja => 'Rubyゲーム会議', :speaker => 'kumaryu', :from => '10:00', :length => 2.hours
    e29_a202.create :title => 'Asakusa.rb in Tsukuba', :title_ja => '浅草.rb in つくば', :speaker => 'Akira Matsuda', :from => '12:00', :length => 90.minutes
    e29_a202.create :title => 'TermtterKaigi', :speaker => 'Kazuyuki Kohno', :length => 3.hours
  end

  e29.with_options(:room => b201) do |e29_b201|
    e29_b201.create :title => 'Ruby meets LDAP  choices and case', :title_ja => 'Ruby で扱う LDAP のススメ - 選択肢とその事例', :speaker => 'Kazuaki Takase', :from => '10:00', :length => 2.hours
    e29_b201.create :title => 'Making MS-Win32 Ruby Hands-ON', :title_ja => 'MSWin32版Ruby野良ビルダー養成塾', :speaker => 'Akio Tajima aka arton', :from => '13:30', :length => 3.hours
  end

  e29.create :title => 'The Origami Ruby (paper craft) Generated by The Ruby', :title_ja => 'Ruby で作る Ruby の折り紙', :speaker => 'Hiroyuki Shimura', :room => foyer, :from => '10:00', :to => '16:30'
end


# Event.create :title_en => 'Opening', :title_ja => 'オープニング', :abstract_en => 'begin Rubykaigi', :abstract_ja => 'はじまり', :detail_en => 'DETAIL!', :detail_ja => 'くわしく', :additional_info => 'ADDITIONAL!', :lang => 'ja', :break => false
# Rubyist.create :username => 'a_matsuda', :email => 'ronnie@dio.jp', :twitter_user_id => 7220202, :identity_url => 'http://dio.jp/', :full_name => '松田 明', :website => 'http://localhost:3000/'
