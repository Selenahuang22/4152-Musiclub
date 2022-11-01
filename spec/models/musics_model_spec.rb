require 'rails_helper'
require 'spec_helper'

describe Music do
    describe '.all_categories' do
        it 'should return all categories' do
          expect(Music.all_categories).to match(%w(rock country pop blues classical jazz))
        end
    end
end
