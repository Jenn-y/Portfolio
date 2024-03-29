class PortfoliosController < ApplicationController
  before_action :set_params, only: [:edit, :update, :show, :destroy]
  layout 'portfolio'
  access all: [:show, :index, :angular, :ruby_on_rails], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    head :ok
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def ruby_on_rails
    @ruby_portfolio_items = Portfolio.ruby_on_rails
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was removed' }
    end
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :thumb_image,
                                      :main_image,
                                      :body, 
                                      technologies_attributes: [:id, :name, :_destroy]
                                      )
  end

  def set_params
    @portfolio_item = Portfolio.find(params[:id])
  end

end
