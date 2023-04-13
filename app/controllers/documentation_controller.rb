class DocumentationController < ApplicationController
  def index
    render 'index'
  end

  def authentication
    render 'authentication'
  end

  def users
    render 'users'
  end

  def classes
    render 'classes'
  end

  def reservations
    render 'reservations'
  end
end
