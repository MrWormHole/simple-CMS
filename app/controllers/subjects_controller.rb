class SubjectsController < ApplicationController

  layout 'admin'
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
    @subject_count = Subject.count + 1
  end

  # Process new record form
  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      flash[:notice] = "Subject created successfully"
      redirect_to(subjects_path)
    else
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  # Display edit record form
  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  # Process edit record form
  def update
    @subject = Subject.find(params[:id])

    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfully"
      redirect_to(subject_path)
    else
      @subject_count = Subject.count
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
end
