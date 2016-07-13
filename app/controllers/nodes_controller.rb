class NodesController < GameSessionBaseController
  def index
    @nodes = @game.nodes

    render json: @nodes
  end

  def create
    if @node.place_token!
      render json: @node
    else
      error!(1001, "Can't place token.", 404)
    end
  end
end
