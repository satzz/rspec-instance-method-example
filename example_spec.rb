class User
  def self.create(_)
    # ...
  end

  def rename(_)
    # ...
  end
end

describe User do
  it 'receives class method call' do
    expect(described_class)
      .to receive(:create) do |name|
        expect(name).to eq 'Bill'
      end

    described_class.create('Bill')
  end

  it 'receives instance method call' do
    expect_any_instance_of(described_class)
      .to receive(:rename) do |instance, name|
        expect(instance).to be_an_instance_of described_class
        expect(name).to eq 'Tom'
      end

    described_class.new.rename('Tom')
  end
end
