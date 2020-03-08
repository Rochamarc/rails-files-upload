class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new 
  end

  def create
    @resume =  Resume.new(resume_params)

    if @resume.save
      redirect_to resumes_path, notice: "Sucessfully Created"
      
      # In a api enviroment
      # render json: @resume, status: :ok
    else
      render 'new'

      # In an api enviroment
      # render json: status: :401
    end

  end

  def destroy
    @resume = Resume.find(params[:id])

    @resume.destroy
    redirect_to resumes_path, notice: "Sucessfully Deleted"
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end
