# frozen_string_literal: true

class PlacesController < ApplicationController
  def index
    @search = params[:search]
  end

  def create
    redirect_to action: :index, search: params[:search]
  end
end
