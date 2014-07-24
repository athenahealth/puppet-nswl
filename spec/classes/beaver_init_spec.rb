require 'spec_helper'

describe 'nswl', :type => 'class' do

  context "On RedHat OS family" do

    let :facts do {
      :osfamily => 'RedHat'
    } end

    # init.pp
    it { should contain_class('beaver::package') }
    it { should contain_class('beaver::config') }
    it { should contain_class('beaver::service') }

    # package.pp
    it { should contain_package('beaver') }

    # service.pp
    it { should contain_service('beaver') }

    # config.pp

  end

  context "On Debian OS family" do

    let :facts do {
      :osfamily => 'Debian'
    } end

    it { expect { should raise_error(Puppet::Error) } }

  end

  context "On an unknown OS" do

    let :facts do {
      :osfamily => 'Darwin'
    } end

    it { expect { should raise_error(Puppet::Error) } }

  end

end
