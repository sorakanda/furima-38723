class ItemsController < ApplicationController
  def index
    @items = Items.all
  end

  def new
    @items = Items.new
  end
end
