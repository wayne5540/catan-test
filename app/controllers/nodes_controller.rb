class NodesController < GameSessionBaseController

  before_action :find_node!, only: [:update]

  def index
    @nodes = @game.nodes

    render json: @nodes
  end

  def update
    if @node.place_token!(@player)
      render json: @node
    else
      error!(1003, "Can't place token.", 406)
    end
  end

  private

  def find_node!
    @node = @game.nodes.find(params[:id])
  end
end
