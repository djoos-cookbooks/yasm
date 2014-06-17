require 'spec_helper'

describe 'yasm::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
end
