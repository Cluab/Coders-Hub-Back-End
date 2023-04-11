module Api
  module V1
    class ClientController < ApiController
      skip_before_action :doorkeeper_authorize!, only: %i[react]

      # GET /client.json
      def react
        @react_client = Doorkeeper::Application.find_by(name: 'React')
        if @react_client.nil?
          render json: { error: 'no React Client Present' }, status: :unprocessable_entity
        else
          render json: {
            id: @react_client.id,
            name: @react_client.name,
            uid: @react_client.uid,
            secret: @react_client.secret,
            redirect_uri: @react_client.redirect_uri,
            scopes: @react_client.scopes,
            confidential: @react_client.confidential,
            created_at: @react_client.created_at.iso8601
          }, status: :ok
        end
      end
    end
  end
end
