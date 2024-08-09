class NotesController <  ApplicationController
  before_action :set_note, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :correct_user, only: [:edit,:destroy,:update]
  def index
    @notes = Note.all
  end

  def show
  # rescue ActiveRecord::RecordNotFound
  #   redirect_to root_path
  end
  def new
    # @note=Note.new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)
    # @note=Note.new(note_params)
    puts @note.inspect
    if @note.save
      redirect_to @note
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  def correct_user
    @note = current_user.notes.find_by(id: params[:id])
    redirect_to notes_path, notice: "Not Authorized to edit this note" if @note.nil?
  end

  private

  def note_params
    params.require(:note).permit(:title,:content,:user_id)
  end

  def set_note
   @note = Note.find(params[:id]) 
  end
end