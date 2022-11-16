require 'rails_helper'
require 'spec_helper'

describe MusicsHelper do
    describe 'test oddcess' do
        it 'should return odd or even' do
            expect(oddness(1)).to eql("odd")
        end
    end

    describe 'test musicpic' do
        it 'should return the right picture name' do
            expect(musicpic('Bizet')).to eql("/images/Bizet.jpg")
            expect(musicpic('Fake')).to eql("/images/music_icon.png")
        end
    end



end
