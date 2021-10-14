require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Associations" do
    it { should belong_to(:project) }
    it { should have_many(:ingredients) }
  end

  describe "Validations" do
  end

  describe 'Filters' do
    describe '#filter_by_categories' do
      it 'return empty for filter with parent category' do
        posts_result = Post.filter_by_categories([1,2,3])

        expect(posts_result.length).to eq 0
      end

      it 'fetch post by ingredients subcategories (DISTINCT)' do
        posts_result = Post.filter_by_categories([6,7])

        expect(posts_result.length).to eq 1

        posts_result.each do |post|
          expect(post).to eq posts(:project1_post)
        end
      end

      it 'fetch posts with the diff subcategories (DISTINCT)' do
        posts_result = Post.filter_by_categories([6,7,12])

        expect(posts_result.length).to eq 2
        expect(posts_result).to eq [Post.first, Post.second]
      end

      it 'fetch all posts with the diff subcategories (DISTINCT)' do
        posts_result = Post.filter_by_categories([6,7,12,13,14,16,18,19])

        expect(posts_result.length).to eq Post.all.length
        expect(posts_result).to eq Post.all.to_a
      end
    end
  end

  describe '#filter_by_forms' do
    it 'return posts with with form' do
      posts_result = Post.filter_by_forms([1])

      expect(posts_result.length).to eq 2
      expect(posts_result).to eq [Post.first, Post.third]
    end

    it 'return all posts with diff formats, no dublicate (disctinct)' do
      posts_result = Post.filter_by_forms([1,2,3])

      expect(posts_result.length).to eq Post.all.length
      expect(posts_result).to eq Post.all.to_a
    end
  end

  describe '#filter_by_styles' do
    it 'return posts with with style' do
      posts_result = Post.filter_by_styles([2])

      expect(posts_result.length).to eq 1
      expect(posts_result).to eq [Post.third]
    end

    it 'return all posts with diff styles, no dublicate (disctinct)' do
      posts_result = Post.filter_by_styles([1,2,3])

      expect(posts_result.length).to eq Post.all.length
      expect(posts_result).to eq Post.all.to_a
    end
  end

  describe '#filter_by_colors' do
    it 'return posts with with color' do
      posts_result = Post.filter_by_colors([1])

      expect(posts_result.length).to eq 2
      expect(posts_result).to eq [Post.first, Post.third]
    end

    it 'return all posts with diff colors, no dublicate (disctinct)' do
      posts_result = Post.filter_by_colors(Color.all.pluck(:id))

      expect(posts_result.length).to eq Post.all.length
      expect(posts_result).to eq Post.all.to_a
    end
  end

  describe '#filter_by_materials' do
    it 'return posts with with material' do
      posts_result = Post.filter_by_materials([1])

      expect(posts_result.length).to eq 2
      expect(posts_result).to eq [Post.first, Post.third]
    end

    it 'return all posts with diff materials, no dublicate (disctinct)' do
      posts_result = Post.filter_by_materials(Material.all.pluck(:id))

      expect(posts_result.length).to eq Post.all.length
      expect(posts_result).to eq Post.all.to_a
    end
  end

  describe '#distinct_categories' do
    it "return all categories from ingradients without dublicate" do
      post = Post.first
      expect(post.ingredients.length).to eq 3
      expect(post.distinct_categories.class).to eq Array
      expect(post.distinct_categories.length).to eq 2
      expect(post.distinct_categories).to eq [Category.find(6), Category.find(12)]
    end
  end
end
