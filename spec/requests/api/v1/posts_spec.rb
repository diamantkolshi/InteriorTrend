require 'swagger_helper'

RSpec.describe 'api/v1/posts', type: :request do

  path '/api/v1/posts' do
    get 'list posts' do
      response(200, 'successful') do
        tags 'Posts'
        produces 'application/json'
        response '200', '' do
          schema type: :object, properties: {
              results: {
                  type: :array,
                  items: {'$ref' => '#/components/schemas/posts'}
              }
          }
        end
      end
    end
  end

  path '/api/v1/posts/{id}' do
    get 'show post' do
      tags 'Posts'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response 200, 'successful' do
        let(:id) { '1' }
        schema type: :object, properties: {
          results: {
            type: :array,
            items: {'$ref' => '#/components/schemas/posts'}
          }
        }
      end

      response '404', '' do
        let(:id) { '123' }
        schema type: :object, properties: {
            error: {type: :string}
        }
      end
    end
  end
end
