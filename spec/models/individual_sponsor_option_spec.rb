require 'spec_helper'

describe IndividualSponsorOption do
  context 'ちゃんと入れた' do
    subject { IndividualSponsorOption.make_unsaved }
    it { should be_valid }
  end

  context 'additional_amount がマイナス' do
    subject { IndividualSponsorOption.make_unsaved(:additional_amount => -1).tap(&:valid?) }
    its(:errors) { should be_invalid(:additional_amount) }
  end

  context 'link_url が変' do
    subject { IndividualSponsorOption.make_unsaved(:link_url => 'javascript:alert("hi!")').tap(&:valid?) }
    its(:errors) { should be_invalid(:link_url) }
  end

  context 'link_label と link_url が両方とも空' do
    subject { IndividualSponsorOption.make_unsaved(:link_label => '', :link_url => '') }
    it { should be_valid }
  end

  context 'link_label のみは OK' do
    subject { IndividualSponsorOption.make_unsaved(:link_url   => '') }
    it { should be_valid }
  end

  context 'link_url のみは NG' do
    subject { IndividualSponsorOption.make_unsaved(:link_label => '').tap(&:valid?) }
    its(:errors) { should be_invalid(:link_label) }
  end
end
