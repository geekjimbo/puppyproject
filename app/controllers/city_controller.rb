class CityController < ApplicationController
	respond_to :json
	
	def index
		# sleep 5
		@cities = City.all
	end
	
	def show
		# sleep 5
		@member = City.find params[:id]
	end
	
	def update
		sleep 2
		@member = City.find params[:id]
		if @member.update_attributes(city_params)
			render "city/show"
		else
			respond_with @member
		end
	end
	
	def create
		sleep 2
		@member = City.new
		if @member.update_attributes city_params
			render "city/show"
		else
			respond_with @member
		end
	end
	
	def destroy
		sleep 2
		member = City.find params[:id]
		member.destroy()
		render json: {}
	end
	
  private
    def city_params
      params.require(:city).permit( :id, :name, :crew_id)
    end
end
