module RubyistsHelper
  def rubyist_name(rubyist)
    rubyist.full_name.present? ? "#{rubyist.username} (#{rubyist.full_name})" : rubyist.username
  end
end
