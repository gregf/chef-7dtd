require 'spec_helper'

describe '7dtd::default' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  let(:sdtd) { chef_run.node['7dtd'] }

  describe 'on an debian system' do
    it 'sets the default user & group' do
      expect(sdtd['user']).to eq('7dtd')
      expect(sdtd['group']).to eq('7dtd')
    end

    it 'sets a installation directory' do
      expect(sdtd['install_dir']).to eq('/srv/7dtd')
    end

    it 'has a url' do
      expect(sdtd['steamcmd_url']).to match(/http:.+(steamcmd_linux.tar.gz)/)
    end

    it 'has contains a valid checksum' do
      expect(sdtd['checksum']).to match(/\b(?:[a-fA-F0-9][\r\n]*){64}\b/)
    end

    it 'sets some the packages arrays' do
      expect(sdtd['dependencies']).to eq(%w(gcc rsync))
      expect(sdtd['64bit_packages']).to eq(%w(lib32gcc1))
    end
  end
end
