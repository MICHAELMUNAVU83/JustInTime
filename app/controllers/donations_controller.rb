class DonationsController < ApplicationController
  before_action :set_donation, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /donations or /donations.json
  def index
    @donations = Donation.where(user_id: current_user.id)
  end

  # GET /donations/1 or /donations/1.json
  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations or /donations.json
  def create
    @donation = Donation.new(donation_params)
    @donation.user_id = current_user.id

    respond_to do |format|
      if @donation.save
        format.html do
          redirect_to donations_url,
                      notice: "Donation was successfully created."
        end
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @donation.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /donations/1 or /donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html do
          redirect_to donation_url(@donation),
                      notice: "Donation was successfully updated."
        end
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @donation.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /donations/1 or /donations/1.json
  def destroy
    @donation.destroy

    respond_to do |format|
      format.html do
        redirect_to donations_url,
                    notice: "Donation was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_donation
    @donation = Donation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def donation_params
    params.require(:donation).permit(
      :type_of_donation,
      :weight,
      :nature,
      :drop_off_point,
      :user_id
    )
  end
end
