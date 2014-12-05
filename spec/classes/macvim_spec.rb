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

end
