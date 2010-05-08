require File.dirname(__FILE__) + '/acceptance_helper'

feature 'トップページ' do
  name_assoc = {
    'ja'    => '日本Ruby会議2010',
    'ja-JP' => '日本Ruby会議2010',
    'en'    => 'RubyKaigi 2010',
    'en-US' => 'RubyKaigi 2010',
    'zh-TW' => 'RubyKaigi 2010'
  }

  name_assoc.each do |lang, event_name|
    scenario "/ にアクセスする (言語: #{lang})" do
      header 'Accept-Language', lang
      visit '/'
      page.should have_content(event_name)
    end

    %w(2010).each do |year|
      scenario "/#{year} にアクセスする (言語: #{lang})" do
        header 'Accept-Language', lang
        visit "/#{year}/"
        page.should have_content(event_name)
      end

      scenario "/#{year} にアクセスする (言語: #{lang})" do
        header 'Accept-Language', lang
        visit "/#{year}"
        page.should have_content(event_name)
      end
    end
  end
end
