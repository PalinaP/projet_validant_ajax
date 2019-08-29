class EmailsController < ApplicationController

  def index
    @emails = Email.all.sort_by{|email| email[:created_at]}.reverse
  end

# ***********************

  def create
    charset = Array('A'..'Z') + Array('a'..'z')
    @email = Email.new(
      object: Faker::Book.title,
      body: Array.new(200) { charset.sample }.join
    )

    if @email.save
      flash[:success] = "Un nouvel email a été reçu"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    else
      flash.now[:error] = @email.errors.full_messages.to_sentence
      render :root_path
    end
  end

  # ***********************

  def update
    @email = Email.find_by(id:params[:id])

    if params[:email_read] == true
      @email.read = true
    else params[:email_read] == false
      @email.read = false
    end

    if @email.update
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    else
      flash.now[:error] = @email.errors.full_messages.to_sentence
      render :root_path
    end

  end

# ***********************

  def show
    @email = Email.find_by(id:params[:id])
    @email.read = true

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end

  end

# ***********************

  def destroy

    @email = Email.find_by(id:params[:id])
    @id = params[:id]

    if @email.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
      flash[:notice] = "Email effacé"
    else
      flash.now[:error] = @email.errors.full_messages.to_sentence
      render :root_path
    end

  end

# ***********************

end
