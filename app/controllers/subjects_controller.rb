class SubjectsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  before_action :set_subject_count, :only => [:new,:create,:edit,:update]

  # List records
  def index
    @subjects = Subject.sorted
  end

  # Display a single record
  def show
    @subject = Subject.find(params[:id])
  end

  # Display new record form
  def new
    @subject = Subject.new({:name => 'default'})
  end

  # Process new record form
  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      flash[:notice] = "Subject created successfully"
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  # Display edit record form
  def edit
    @subject = Subject.find(params[:id])
  end

  # Process edit record form
  def update
    @subject = Subject.find(params[:id])

    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfully"
      redirect_to(subject_path)
    else
      render('edit')
    end
  end

  # Display delete record form
  def delete
    @subject = Subject.find(params[:id])
  end

  # Process delete record form
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject destroyed successfully"
    redirect_to(subjects_path)
  end

  private
  def subject_params
    params.require(:subject).permit(:name,:position,:visible)
  end

  def set_subject_count
    @subject_count = Subject.count
    if params[:action] == 'new' || params[:action] == 'create'
      @subject_count += 1
    end
  end
end
