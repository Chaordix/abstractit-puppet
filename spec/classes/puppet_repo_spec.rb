#!/usr/bin/env rspec
require 'spec_helper'
require 'pry'

describe 'puppet::repo', :type => :class do
  on_supported_os({
      :hardwaremodels => ['x86_64'],
      :supported_os   => [
        {
          "operatingsystem" => "Ubuntu",
          "operatingsystemrelease" => [
            "14.04"
          ]
        },
        {
          "operatingsystem" => "CentOS",
          "operatingsystemrelease" => [
            "7"
          ]
        }
      ],
    }).each do |os, facts|
    context "When on an #{os} system" do
      let(:facts) do
        facts.merge({
          :concat_basedir => '/tmp',
          :puppetversion => Puppet.version
        })
      end
      it { is_expected.to compile.with_all_deps }

      context "when ::puppet::collection is not defined" do
        it "should install the puppetlabs-release package" do
          should contain_package('puppetlabs-release').with({'ensure' => 'latest'})
        end#puppetlabs-release
      end

      context "when ::puppet::collection is defined" do
        let(:pre_condition){"class{'::puppet': collection => 'BOGON'}"}
        it 'should contain the puppetlabs-release-$::puppet::collection package' do
          should contain_package('puppetlabs-release-bogon').with({'ensure' => 'latest'})
        end
        it 'should not contain the puppetlabs-release package' do
          should_not contain_package('puppetlabs-release')
        end
      end

      case facts[:osfamily]
      when 'Debian'
        it 'should contain the apt subclass' do
          should contain_class('puppet::repo::apt')
        end
      when 'RedHat'
        it 'should contain the yum subclass' do
          should contain_class('puppet::repo::yum')
        end
      end #case osfamily
    end #each OS
  end #on_supported_os
end
