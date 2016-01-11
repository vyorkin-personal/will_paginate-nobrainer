describe WillPaginate::NoBrainer::CollectionMethods do
  describe '#total_entries' do
    before do
      2.times { |i| User.create(salary: i) }
    end

    context 'when the scope is cloned' do
      let(:criteria) { User.page }

      it 'resets total_entries memoization' do
        expect(criteria.total_entries).to eq(2)
        expect(criteria.where(salary: 1).total_entries).to eq(1)
      end
    end
  end
end
