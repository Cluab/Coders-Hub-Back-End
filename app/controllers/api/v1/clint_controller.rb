module Api
  module V1
    class ClintController < ApiController
      skip_before_action :doorkeeper_authorize!, only: %i[react]

      # GET /clint.json
      def react
        @react_clint = Doorkeeper::Application.find_by(name: 'React')
        if @react_clint.nil?
          render json: { error: 'no React Clint Present' }, status: :unprocessable_entity
        else
          render json: {
            id: @react_clint.id,
            name: @react_clint.name,
            uid: @react_clint.uid,
            secret: @react_clint.secret,
            redirect_uri: @react_clint.redirect_uri,
            scopes: @react_clint.scopes,
            confidential: @react_clint.confidential,
            created_at: @react_clint.created_at.iso8601
          }, status: :ok
        end
      end
    end
  end
end
