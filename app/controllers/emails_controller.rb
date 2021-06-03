class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end

  def new

  end

  def create
    @email = Email.new
    @email.object = Faker::TvShows::GameOfThrones.character
    @email.body = Faker::TvShows::GameOfThrones.quote
    @email.save

      respond_to do |format|
        format.html {redirect_to root_path}
        format.js { }
        flash[:notice] = "You've got mail"
      end
  end

  def edit

  end

  def update
    @email = Email.find(params[:id])
    @email.toggle(:read).save
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
      
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
    flash[:notice] = "Email deleted"
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
      flash[:notice] = "You've got mail"
    end
  end
end
