require 'spec_helper'

describe 'nswl', :type => 'class' do

  context "On RedHat OS family" do

    let :facts do {
      :osfamily => 'RedHat'
    } end

    # init.pp
    it { should contain_class('nswl::package') }
    it { should contain_class('nswl::config') }
    it { should contain_class('nswl::service') }

    # package.pp
    it { should contain_package('nswl') }

    # service.pp
    it { should contain_service('nswl') }

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
