# frozen_string_literal: true

require 'rails_helper'

def generate_errors_schema(*keys)
  properties = {}
  keys.each do |key|
    properties[key.to_sym] = {type: :array, items: {type: :string}}
  end
  {type: :object, properties: properties}
end

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: '{protocol}://{defaultHost}',
          variables: {
            defaultHost: {
                default: ENV['HOSTNAME'] || 'localhost:3000'
            },
            protocol: {
                default: Rails.env.development? || Rails.env.test? ? 'http' : ENV['PROTOCOL']
            }
          }
        }
      ],
      components: {
        securitySchemes: {
          basic_auth: {
              type: :http,
              scheme: :basic
          },
          user_id: {# arbitrary name for the security scheme
              type: :apiKey,
              in: :header,
              name: "uid"
          },
          access_token: {
              type: :apiKey,
              in: :header,
              name: "access-token"
          },
          client: {
              type: :apiKey,
              in: :header,
              name: "client"
          }
        },
        schemas: {
          posts: {
              type: :object,
              properties: {
              }
          },
          directories: {
            type: :object,
            properties: {
            }
          },
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
