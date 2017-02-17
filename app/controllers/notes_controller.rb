class NotesController < ApplicationController
  def new
    @track_id = params[:track_id]
  end

  def create
    note = Note.new(note_params)
    note.user = current_user

    if note.save
      redirect_to track_url(note.track_id)
    else
      flash[:errors] = note.errors.full_messages
      redirect_to track_url(note.track_id)
    end

  end

  def show
    redirect_to bands_url
  end

  def edit
    redirect_to bands_url
  end

  def update
    redirect_to bands_url
  end

  def destroy
    note = Note.find(params[:id])
    if current_user.id == note.user_id
      note.destroy
      redirect_to track_url(note.track_id)
    else
      render text: "403 FORBIDDEN"
      redirect_to track_url(note.track_id)
    end
  end

  private
  def note_params
    params.require(:note).permit(:user_id, :track_id, :body)
  end
end
