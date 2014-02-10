class JobsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create,:edit, :update,:destroy]
  before_action :correct_user,   only: :destroy
  
  def index
    @jobs = Job.all.paginate(page: params[:page])
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = current_user.jobs.build(job_params)
    if @job.save
      flash[:success] = "Job posted!"
      redirect_to root_url
    else
      render 'jobs/new'
    end
  end

  def destroy
    @job.destroy
    redirect_to root_url
  end

  private

  def job_params
    params.require(:job).permit!
  end

  def correct_user
    @job = current_user.jobs.find_by(id: params[:id])
    redirect_to root_url if @job.nil?
  end

  def permit!
    each_pair do |key, value|
      convert_hashes_to_parameters(key, value)
      self[key].permit! if self[key].respond_to? :permit!
    end

    @permitted = true
    self
  end
end