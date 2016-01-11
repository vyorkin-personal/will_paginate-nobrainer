describe WillPaginate::NoBrainer::CriteriaMethods do
  before(:each) do
    90.times do |i|
      User.create(name: "User#{i}", age: i)
    end
  end

  describe 'Model' do
    subject { User }

    it { is_expected.to respond_to(:page) }
    it { is_expected.to respond_to(:per_page) }
  end

  describe 'Collection' do
    subject { User.all }

    it { is_expected.to respond_to(:page) }
  end

  describe '#page' do
    context 'page 1' do
      subject { User.page(1) }

      it { is_expected.to be_a NoBrainer::Criteria }

      it 'has correct values' do
        expect(subject.current_page).to eq(1)
        expect(subject.previous_page).to eq(nil)
        expect(subject.next_page).to eq(2)
        expect(subject.per_page).to eq(30)
        expect(subject.offset).to eq(0)
        expect(subject.total_entries).to eq(90)
        expect(subject.total_pages).to eq(3)
      end
    end

    context 'page 2' do
      subject { User.page(2) }

      it { is_expected.to be_a NoBrainer::Criteria }

      it 'has correct values' do
        expect(subject.current_page).to eq(2)
        expect(subject.previous_page).to eq(1)
        expect(subject.next_page).to eq(3)
        expect(subject.per_page).to eq(30)
        expect(subject.offset).to eq(30)
        expect(subject.total_entries).to eq(90)
        expect(subject.total_pages).to eq(3)
      end
    end
  end
end
