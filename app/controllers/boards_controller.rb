class BoardsController < ApplicationController
  def show
    @board = Board.find_by!(permalink: params[:permalink])
  end

  def fallback
    board = Board.find_by!(permalink: params[:permalink])

    redirect_to board_path(board)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to board_path(@board)
    else
      @board.clear_permalink

      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :permalink)
  end
end
