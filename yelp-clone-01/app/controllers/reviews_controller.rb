class ReviewsController < ApplicationController
  #before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    #@review = Review.new
    @establishment = Establishment.find(params[:establishment_id])
    @review = Review.new(establishment: @establishment)
  end

  # GET /reviews/1/edit
  def edit
    @establishment = Establishment.find(params[:establishment_id])
    @reviews = @establishment.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @establishment = Establishment.find(params[:establishment_id])
    @review = Review.new(establishment: @establishment)
    @review = Review.new(params[:review].permit(:ratings, :review_content))
    #@review = Review.new(review_params)
    #@review = Review.new(params[:review])
    @review.establishment = @establishment
    #@review.user = current_user
    @review.user_id = current_user.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to current_user, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { redirect_to current_user, notice: "Problem!" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @establishment = Establishment.find(params[:establishemnt_id])
    @reviews = @establishment.reviews.find(params[:id])
    @reviews.update(params[:review].permit(:rating, :review_content))

    redirect_to @establishment
=begin
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy    
    @establishment = Establishment.find(params[:establishment_id])
    @reviews = @establishment.reviews.find(params[:id])
    @reviews.destroy
    redirect_to @establishment
    
=begin
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
=end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :review_content, :date_time)
    end
    

end
