# frozen_string_literal: true

class SearchesControllers < ApplicationController
  def search_input
    @search_results = Garden.search(params[:search]).order('created_at DESC')
  end

  def index
    # if params[:search]
    #   search_input
    #   if @search_results.blank?
    #     render json: {message: "Record Not Found"}
    #   else
    #     respond_with(@search_results)
    #   end
  end
  end
