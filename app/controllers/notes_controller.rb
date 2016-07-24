class NotesController < ApplicationController

	before_action :check_user

	def index
		if current_user.role == "student"
			@notes = User.find_by(id:session[:id]).notes.order("updated_at DESC")
		else
			@notes = Note.all.order("updated_at DESC")
		end
	end

	def new
		@user = User.find_by(id:session[:id])
		@note = Note.new
	end

	def create
		user_id = User.find_by(id:session[:id]).id
		@note = Note.new(notes_params)
		@note.author_id = user_id
		if @note.save
			redirect_to user_notes_path
		else
			render 'new'
		end
	end

	def edit
		@note = Note.find_by(id:params[:id])
	end

	def update
		@note = Note.find_by(id:params[:id])
		@note.update_attributes(notes_params)
		redirect_to user_notes_path
	end

	def destroy
		note = Note.find_by(id:params[:id]).destroy
		redirect_to user_notes_path
	end


	def show
		@note = Note.find_by(id:params[:id])
	end

	private 

	def notes_params
		params.require(:note).permit(:header,:content,:author_id)
	end


end