class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:update, :destroy]

  # POST /submissions
  def create
    sanitized_params = params.except(:controller, :action)
    @submission = Submission.new(
      :content => sanitized_params,
      :destination => "email-service"
    )
    if @submission.save
      render json: {
        status: 200,
        message: "Submission saved",
      }
    else
      render json: {
        status: 500,
        message: "Submission could not be saved",
      }
    end
  end

  # PATCH/PUT /submissions/1
  def update
    if @submission.update(submission_params)
      render json: @submission
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /submissions/1
  def destroy
    @submission.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def submission_params
      params.require(:submission).permit(:content, :destination)
    end
end
