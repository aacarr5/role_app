class NotesController < ApplicationController

	before_action :check_user

	def index
		if current_user.role == "student"
			@notes = current_user.notes.order("updated_at DESC")
		else
			@notes = Note.all.order("updated_at DESC")
		end
	end

	def new
		@note = Note.new
		respond_to do |format|
			format.html {}
			format.js {render 'new'}
		end
	end

	def create
		@note = current_user.notes.build(notes_params)

		if @note.save
			respond_to do |format|
				format.html { valid_post(@note) }
				format.js {render 'create', :locals => {:note => @note}}
			end
		else
			redirect_to user_notes_path
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
		note = Note.find_by(id:params[:id])
		note_id = note.id
		note.destroy
		respond_to do|format|
			format.html {redirect_to user_notes_path}
			format.js   { render 'destroy', :locals => {:id => note_id} }
		end
	end


	def show
		@note = Note.find_by(id:params[:id])
	end


	private 

	def notes_params
		params.require(:note).permit(:header,:content,:author_id,:categories)
	end

	def valid_post(note)
		if @note.save
			redirect_to user_notes_path
		else
			render 'new'
		end
	end


end