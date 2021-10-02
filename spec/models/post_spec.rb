require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Associations" do
    it { should belong_to(:project) }
    it { should have_many(:ingredients) }
  end

  describe "Validations" do
  end

  describe 'Filters' do
    describe '#posts_by_categories' do
      it 'fetch post by ingredients category (DISTINCT)' do
        posts_result = Post.filter_by_categories([6,7])

        expect(posts_result.length).to eq 1

        posts_result.each do |post|
          expect(post).to eq posts(:project1_post)
        end
      end

      it 'fetch posts with the diff categories (DISTINCT)' do
        posts_result = Post.filter_by_categories([6,7,12])

        expect(posts_result.length).to eq 2
        expect(posts_result).to eq [Post.first, Post.second]
      end

      it 'fetch all posts with the diff categories (DISTINCT)' do
        posts_result = Post.filter_by_categories([6,7,12,13,14,16,18,19])

        expect(posts_result.length).to eq Post.all.length
        expect(posts_result).to eq Post.all.to_a
      end
    end
  end
end
