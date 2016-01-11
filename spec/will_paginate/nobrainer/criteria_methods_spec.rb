describe WillPaginate::NoBrainer::CriteriaMethods do
  before do
    90.times do |i|
      User.create(name: "User#{i}", age: i)
    end
  end

  describe 'Model' do
    subject { User }

    it { should respond_to(:page) }
    it { should respond_to(:per_page) }
  end

  describe 'Collection' do
    subject { User.all }

    it { should respond_to(:page) }
  end
end
