class User
  def initialize(*_)
    # ...
  end

  def update_avatar(_)
    # ...
  end
end

class Avatar
  def initialize(path)
    @path = path
  end

  attr_reader :path
end

describe User do
  it 'receives class method call' do
    expect(described_class)
      .to receive(:new).with('Bill')

    described_class.new('Bill')
  end

  it 'receives class method call' do
    expect(described_class)
      .to receive(:new) do |name|
        expect(name).to eq 'Bill'
      end

    described_class.new('Bill')
  end

  it 'receives instance method call' do
    expect_any_instance_of(described_class)
      .to receive(:update_avatar) do |user, avatar|
        expect(user).to be_an_instance_of described_class
        expect(avatar).to be_an_instance_of Avatar
        expect(avatar.path).to eq './avatar.png'
      end

    described_class.new.update_avatar(Avatar.new('./avatar.png'))
  end
end
