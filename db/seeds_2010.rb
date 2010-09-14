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
@big = Room.create :name_en => 'Main Convention Hall', :name_ja => '大ホール', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 1
@medium = Room.create :name_en => 'Convention Hall 200', :name_ja => '中ホール200', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 2
@b202 = Room.create :name_en => '202-B', :name_ja => '202-B', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 3
@a202 = Room.create :name_en => '202-A', :name_ja => '202-A', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 4
@b201 = Room.create :name_en => '201-B', :name_ja => '201-B', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 5
@a201 = Room.create :name_en => '201-A', :name_ja => '201-A', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 6
@foyer = Room.create :name_en => 'Foyer', :name_ja => 'ホワイエ', :floor_en => '2nd floor', :floor_ja => '2階', :sort_order => 7

# events
%w[0827 0828 0829].each do |day|
  load File.dirname(__FILE__) + "/seeds_2010#{day}.rb"
end
