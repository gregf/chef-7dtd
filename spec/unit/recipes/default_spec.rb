require 'spec_helper'

describe '7dtd::default' do
  context 'install 7dtd defaults' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'includes the 7dtd::user recipe' do
      expect(chef_run).to include_recipe('7dtd::user')
    end

    it 'creates a directory for the 7dtd server to live' do
      expect(chef_run).to create_directory('/srv/7dtd').with(
        user: '7dtd',
        group: '7dtd',
        mode: 0755,
        recursive: true
      )
    end

    it 'includes the 7dtd::service recipe' do
      expect(chef_run).to include_recipe('7dtd::service')
    end
  end
end
