require 'spec_helper'

describe '7dtd::user' do
  context 'creates a user for the 7dtd server' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'creates a user with attributes' do
      expect(chef_run).to create_user('7dtd').with(
        shell: '/bin/false',
        gid: '7dtd',
        home: '/srv/7dtd'
      )
    end
  end
end
