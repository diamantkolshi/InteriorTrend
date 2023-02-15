require 'swagger_helper'

RSpec.describe 'api/v1/directories', type: :request do

  path '/api/v1/directories' do

    get('list directories') do
      tags 'Directories'
      security [user_id: [], access_token: [], client: [], basic_auth: []]
      produces 'application/json'
      response '200', '' do
        schema type: :object, properties: {
            total: {type: :number},
            results: {
                "$ref": '#/components/schemas/directories'
            }
        }
      end
    end

    post 'create directory' do
      tags 'Directories'
      security [user_id: [], access_token: [], client: [], basic_auth: []]
      produces 'application/json'
      consumes 'application/json'

      parameter name: :results, in: :body, schema: {
          "$ref": '#/components/schemas/directories'
      }

      response '201', '' do
        schema type: :object, properties: {
            id: {type: :string, enum: ['ok']}
        }
      end

      response '400', '' do
        schema type: :object, properties: {
            errors: generate_errors_schema(:normal_name, :chemical_agent, :route, :form, :dose)
        }
      end
    end
  end

  # path '/api/v1/directories/{id}' do
  #   # You'll want to customize the parameter types...
  #   parameter name: 'id', in: :path, type: :string, description: 'id'

  #   patch('update directory') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end

  #   put('update directory') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end

  #   delete('delete directory') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end
end
