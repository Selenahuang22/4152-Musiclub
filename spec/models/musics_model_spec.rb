require 'rails_helper'
require 'spec_helper'

describe Music do
    describe 'test self.all_categories' do
        it 'should return all categories' do
          expect(Music.all_categories).to match(%w(rock country pop blues classical jazz))
        end
    end

    describe 'test.with_categories' do
        let!(:music1) { FactoryBot.create(:music, title: 'M1',category:'pop') }
        let!(:music2) { FactoryBot.create(:music, title: 'M2',category:'pop') }
        let!(:music3) { FactoryBot.create(:music, title: 'M3',category:'rock')}
        @sort_by='title'
        @no_categories=nil
        it 'should return all when categories is nil' do
            expect(Music.with_categories(@no_categories,@sort_by)).to match_array([music1,music2,music3])
        end
        it 'should return all with specific categories' do
            # puts Music.with_categories(['pop'],@sort_by)
            expect(Music.with_categories(['pop'],@sort_by)).to match_array([music1,music2])
        end
    end

    describe 'test self.search_by' do
        let!(:music1) { FactoryBot.create(:music, title: 'M1',category:'pop') }
        it 'should return music with the specific title when input is not nil or empty' do
          expect(Music.search_by('M')).to match(["M1"])
          expect(Music.search_by('1')).to match(["M1"])
        end
        it 'should return nil when input is not nil or empty' do
            expect(Music.search_by('')).to match(nil)
        end
    end
end

