require "spec_helper"

describe "macvim" do
  let(:facts) { default_test_facts }

  describe "default" do
    it do
      should contain_class("macvim")
      should contain_package("macvim").with({
        :ensure          => "installed",
        :install_options => ['--with-cscope','--override-system-vim']
      })
    end
  end

  describe "ensure" do
    let(:params) {{:ensure => 'latest'}}
    it do
      should contain_class("macvim")
      should contain_package("macvim").with({
        :ensure          => "latest",
        :install_options => ['--with-cscope','--override-system-vim']
      })
    end
  end

  describe "macvim with custom icons" do
    let(:params) { { :custom_icons => true } }
    it do
      should contain_class("macvim")
      should contain_package("macvim").with({
        :ensure          => "installed",
        :install_options => ['--with-cscope','--override-system-vim','--custom-icons']
      })
    end
  end

  describe "macvim with lua" do
    let(:params) { { :lua => true } }
    it do
      should contain_class("macvim")
      should contain_package("macvim").with({
        :ensure          => "installed",
        :install_options => ['--with-cscope','--override-system-vim','--with-lua','--with-luajit']
      })
    end
  end

  describe "macvim with custom icons and lua" do
    let(:params) { { :custom_icons => true, :lua => true } }
    it do
      should contain_class("macvim")
      should contain_package("macvim").with({
        :ensure          => "installed",
        :install_options => ['--with-cscope','--override-system-vim','--custom-icons','--with-lua','--with-luajit']
      })
    end
  end
end
