class FlashcardsController < ApplicationController
    before_action :set_flashcard, only: [:show, :edit, :update, :destroy]
  
    # GET /flashcards
    # GET /flashcards.json
    def index
      @flashcard = Flashcard.new
      
      if params[:deck_id] != nil
        @flashcards = current_user.flashcards.where deck_id: params[:deck_id]
      else
        @flashcards = current_user.flashcards.to_a
      end
  
      @decks = current_user.decks
    end
  
    # GET /flashcards/1
    # GET /flashcards/1.json
    def show
    end
  
    # GET /flashcards/new
    def new
      @flashcard = Flashcard.new
      
      if params[:deck_id] != nil
        @flashcards = current_user.flashcards.where deck_id: params[:deck_id]
      else
        @flashcards = current_user.flashcards.to_a
      end
    end
  
    # GET /flashcards/1/edit
    def edit
    end
  
    # POST /flashcards
    # POST /flashcards.json
    def create
      #pry
      if flashcard_params[:front].present? && flashcard_params[:back].present?
        Flashcard.create flashcard_params
        redirect_to :back, notice: 'Flashcard foi criado com sucesso!'
      else
        redirect_to :back, notice: 'Error: Flashcard deve ter frente e verso.'
      end
    end
  
    # PATCH/PUT /flashcards/1
    # PATCH/PUT /flashcards/1.json
    def update
      respond_to do |format|
        if @flashcard.update(flashcard_params)
          format.html { redirect_to @flashcard, notice: 'Flashcard foi atualizado com sucesso!' }
          format.json { render :show, status: :ok, location: @flashcard }
        else
          format.html { render :edit }
          format.json { render json: @flashcard.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /flashcards/1
    # DELETE /flashcards/1.json
    def destroy
      @flashcard.destroy
      respond_to do |format|
        format.html { redirect_to flashcards_url, notice: 'Flashcard foi apagado com sucesso!' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_flashcard
        @flashcard = Flashcard.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def flashcard_params
        params.require(:flashcard).permit(:front, :back, :due, :interval, :ease_factor, :last_review, :deck_id)
      end
  end
  