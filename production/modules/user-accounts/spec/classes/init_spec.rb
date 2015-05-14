require 'spec_helper'
describe 'accounts' do

  context 'with defaults for all parameters' do
    it { should contain_class('accounts') }
  end
end
