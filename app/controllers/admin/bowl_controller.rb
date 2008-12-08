class Admin::BowlController < Admin::AdminController
	def delete
		Bowl.delete(params[:id])
		render :nothing=>true
	end

	def edit
		@colspan = 5
		if params[:id]
			@item = Bowl.find(params[:id])
		else
			@item = Bowl.new
		end
		@games = Game.find_with_teamnames(:conditions=>"is_bowl = 1",:order=>"week,gametime").collect {|p| ["#{p.away_loc} #{p.away_name} @ #{p.home_loc} #{p.home_name}",p.id]}
		render :partial => "edit"
	end

	def index
		@title = "Administration :: Bowls"
	end

  def list
  	if params[:id]
  		@item = Bowl.find(params[:id])
#  		@game = Game.find_with_teamnames(:conditions=>"games.id = #{@item.game_id}").first
  		render(:partial => "item") and return
  	else
  		@items = Bowl.find(:all, :order=>"name")
  	end
  end

  def new
  	@item=Bowl.new
  	render :partial=>"admin/shared/newitem"
	end

	def update
		if params[:id]
			@item = Bowl.find(params[:id])
			if @item.update_attributes(params[:item])
				redirect_to :action => "list",:id=>params[:id]
			else
			 	render_text @item.errors.inspect  + "\n"
			end
		else
			@item = Bowl.new(params[:item])
			if @item.save
				redirect_to :action => "list","component"=>true
			else 
				logger.info "Errors: "+@item.errors.inspect
				render_text @item.errors.inspect  + "\n"
			end
		end
	end
end
