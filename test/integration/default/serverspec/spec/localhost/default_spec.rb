require ::File.expand_path('../../spec_helper', __FILE__)

describe user('7dtd') do
  it { should exist }
  it { should belong_to_group '7dtd' }
  it { should have_home_directory '/srv/7dtd' }
  it { should have_login_shell '/bin/false' }
end

describe file('/srv/7dtd') do
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_grouped_into '7dtd' }
  it { should be_owned_by '7dtd' }
end

describe file('/srv/7dtd/engine/7DaysToDieServer.x86_64') do
  it { should be_file }
  it { should be_mode 755 }
  it { should be_owned_by '7dtd' }
  it { should be_grouped_into '7dtd' }
end

describe file('/srv/7dtd/engine/serverconfig.xml') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by '7dtd' }
  it { should be_grouped_into '7dtd' }
end

describe process('7DaysToDieServer') do
  its(:user) { should eq '7dtd' }
end
