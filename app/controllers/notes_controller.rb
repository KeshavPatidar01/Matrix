class NotesController < ApplicationController
before_action :set_note, only: %i[ show destroy ]

before_action :authenticate_user!
  def index
    @notes = current_user.notes.all
  end

  def new
    @note = Note.new
  end

  def show
        @note = notes.find(params[:id])
    end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save



  redirect_to request.referer || root_path, notice: "Note saved successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy!

    respond_to do |format|
      format.html { redirect_to notes_path, notice: "Notes was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
  def set_note
    @note = current_user.notes.find(params[:id])
  end





  def note_params
    params.require(:note).permit(:note_title, :note_description)
  end
end
